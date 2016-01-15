
import os,sys,types
import mxutil,maxml

err = sys.stderr

thetree = None
dirs = {}

class tree:
    entnames = []  # for every child we save the name
    children = {}  # here are the nodes for the children, keys are the entnames
    isleaf = 1     # if we are on a leaf
    path = ''      # the path with trailing slash
    file = ''      # the name of the file at this position
    text = ''      # text of this entry

    def __init__(self,path,file,text):
        self.entnames = []
        self.children = {}
        self.path = path
        self.file = file
        self.text = text

    def addchild(self,f,c):
        self.isleaf = 0
        self.entnames.append(f)
        self.children[f] = c
        
    def __repr__(self):
        return '<'+self.path+self.file+'>'

    def __str__(self):
        return '<'+self.path+self.file+'>'

GAPmanuals = []

def init(MIXERROOT):
    # We have to walk through the tree and build
    global thetree,dirs,config

    def recurse(MIXERROOT,path,text,dirs):
        if not(os.path.exists(MIXERROOT+path+'tree')):
            err.write('Error: Cannot find tree information: "'+path+"tree"+
                      '"!\n')
            sys.exit(10)
        node = maxml.parse_file(MIXERROOT+path+'tree')
        # make a directory node:
        t = tree(path,node.attr['file'],text)
        i = 0
        while i < len(node.subs):
            sub = node.subs[i]
            if type(sub) == types.StringType:
                del node.subs[i]
            else:
                if os.path.isdir(MIXERROOT+path+sub.attr['file']):
                    t.addchild(sub.attr['file'],recurse(MIXERROOT,
                               path+sub.attr['file']+'/',sub.subs[0],dirs))
                else:
                    t.addchild(sub.attr['file'],
                               tree(path,sub.attr['file'],sub.subs[0]))
                i += 1    
        dirs[path] = t
        return t

    dirs = {}
    thetree = recurse(MIXERROOT,'','Start',dirs)

    # Read information about GAP manuals:
    f = file(MIXERROOT+"lib/AllLinksOfAllHelpSections.data")
    line = f.readline()
    while line:
        l = line.strip().split('|')
        GAPmanuals.append(l)
        line = f.readline()
    f.close()

    # Read information about packages:
    config = {}
    execfile(MIXERROOT+'Packages/pkgconf.py',config)


def manual(MIXERROOT,path,filename,main,node):
    key = node.attr['manual']
    l = len(key)
    result = []
    for i in range(len(GAPmanuals)):
        if GAPmanuals[i][0] == key:
            result.append(i)
    if len(result) == 0:
        err.write('Error: Unknown manual section: "'+key+'".\n')
        n = maxml.xmltree('a',{'href':'/gap.html'})
        if node.subs == None or len(node.subs) == 0:
            n.subs = ["EMPTY"]
        else: # we inherit the subtree
            n.subs = node.subs
        return n;
    if len(result) > 1:
        err.write('Warning: Manual section not unique: "'+key+'".\n')
    i = result[0]
    if GAPmanuals[i][1][0] == '/':
        n = maxml.xmltree('a',{'href':'{{GAPManualLink}}'+GAPmanuals[i][1]})
    else:
        n = maxml.xmltree('a',{'href':'{{GAPManualLink}}/'+GAPmanuals[i][1]})
    if node.subs == None or len(node.subs) == 0:   # empty element:
        n.subs = [GAPmanuals[i][2]]
    else: # we inherit the subtree:
        n.subs = node.subs
    return n

def maketop(MIXERROOT,path,filename,main,node):
    r = []
    for s in thetree.entnames:
        e = thetree.children[s]
        # insert an anchor tag with href relative to MIXERROOT the text
        # from the "tree" file, with no meta information:
        n = maxml.xmltree('a',{'href':'/'+e.path+e.file},None)
        n.add(e.text)
        r.append(n)
        r.append('&nbsp;\n')
    return r

def makeentry(r,depth,text,link,a = {}):
    r.append( '<tr><td>' )
    r.append( '&nbsp;' * 2 * depth + '\n' )
    # insert an anchor tag with href relative to MIXERROOT the text of
    # the link no meta information:
    n = maxml.xmltree('a',{'href':link},None)
    n.add(text)
    n.attr.update(a)
    r.append(n)
    r.append( '\n</td></tr>\n' )
    

def makeleft(MIXERROOT,path,filename,main,node):
    r = []
    r.append( '<table>\n' )
    makeentry(r,0,'Start','/'+thetree.file)
    l = path.split('/')
    l = l[:-1]    # we throw away the last empty string
    # first we walk down the tree along the path and make notes:
    ents = []     # the nodes of the entries for all dirs in path
    cur = thetree
    for j in range(len(l)):   # for all path components:
        s = l[j]
        i = 0
        while i < len(cur.entnames) and cur.entnames[i] != s: i += 1
        if i >= len(cur.entnames):
            err.write('Error: Cannot find subnode: "'+s+'" in path "'+
                      path+'"!\n')
            sys.exit(11)
        cur = cur.children[cur.entnames[i]]    # the next level down
        ents.append(cur)
    
    # now we determine whether we are on a leaf or not:
    if filename+'.html' == cur.file:
        we_are_on_leaf = 0
    else:
        we_are_on_leaf = 1
    
    # Now write the hierarchy up to the second last dir:
    depth = 1
    for j in range(len(ents)-1):
        e = ents[j]
        makeentry(r,depth,e.text,'/'+e.path+e.file)
        depth += 1

    # only write out the last path component:
    if len(ents) > 0:
        if we_are_on_leaf:
            makeentry(r,depth,ents[-1].text,'/'+ents[-1].path+ents[-1].file)
        else:
            makeentry(r,depth,ents[-1].text,'/'+ents[-1].path+ents[-1].file,
                      {'class':'currentsection'})
        depth += 1
        cur = ents[-1]
    else:
        cur = thetree
    # only the nodes below are now missing!

    # we write all children of ents[-1]
    for j in cur.entnames:
        ent = cur.children[j]
        if we_are_on_leaf and filename+'.html' == ent.file:
            makeentry(r,depth,ent.text,'/'+ent.path+ent.file,
                      {'class':'currentsection'})
        else:
            makeentry(r,depth,ent.text,'/'+ent.path+ent.file)

    r.append('</table>')
    return r

def makeleft_plus(MIXERROOT,path,filename,main,node):
    r = []
    r.append( '<table>\n' )
    if path == '' and filename+'.html' == thetree.file:
        makeentry(r,0,'Start','/'+thetree.file,{'class':'currentsection'})
        we_are_home = 1
    else:
        makeentry(r,0,'Start','/'+thetree.file)
        we_are_home = 0
    l = path.split('/')
    l = l[:-1]    # we throw away the last empty string
    # first we walk down the tree along the path and make notes:
    ents = []     # the nodes of the entries for all dirs in path
    cur = thetree
    for j in range(len(l)):   # for all path components:
        s = l[j]
        i = 0
        while i < len(cur.entnames) and cur.entnames[i] != s: i += 1
        if i >= len(cur.entnames):
            err.write('Error: Cannot find subnode: "'+s+'" in path "'+
                      path+'"!\n')
            sys.exit(11)
        cur = cur.children[cur.entnames[i]]    # the next level down
        ents.append(cur)
    
    # now we determine whether we are on a leaf or not:
    if filename+'.html' == cur.file:
        we_are_on_leaf = 0
    else:
        we_are_on_leaf = 1
    
    # Now write the hierarchy up to the second last dir:
    depth = 1
    for j in range(len(ents)-1):
        e = ents[j]
        makeentry(r,depth,e.text,'/'+e.path+e.file)
        depth += 1

    savepos = len(r)
    if len(ents) > 0:
        if we_are_on_leaf:
            # only write out the last path component:
            makeentry(r,depth,ents[-1].text,'/'+ents[-1].path+ents[-1].file)
            # only the nodes below are now missing!
            savepos = len(r)  # append them here
        else:
            # now we write out all entries in the position of the last p. comp.:
            if len(ents) > 1:    # we have a second last entry:
                cur = ents[-2]
            else:
                cur = thetree
            for j in cur.entnames:
                ent = cur.children[j]
                if ent == ents[-1] and not(we_are_on_leaf):
                    makeentry(r,depth,ent.text,'/'+ent.path+ent.file,
                              {'class':'currentsection'})
                else:
                    makeentry(r,depth,ent.text,'/'+ent.path+ent.file)
                if ent == ents[-1]:
                    # save position to insert subtree here:
                    savepos = len(r)  
        depth += 1
        cur = ents[-1]   # the node of the last directory:
    else:
        cur = thetree

    # we write all children of ents[-1]
    rr = []
    for j in cur.entnames:
        ent = cur.children[j]
        if we_are_on_leaf and filename+'.html' == ent.file:
            makeentry(rr,depth,ent.text,'/'+ent.path+ent.file,
                      {'class':'currentsection'})
        elif not(we_are_on_leaf):
            makeentry(rr,depth,ent.text,'/'+ent.path+ent.file,
                      {'class':'deepestchildren'})
        else:
            makeentry(rr,depth,ent.text,'/'+ent.path+ent.file)

    # now insert the result in the correct place:
    for j in rr:
        r.insert(savepos,j)
        savepos += 1
        
    r.append('</table>')
    return r

def myfunc(M,p,f,main,node):
    return ['MIXERROOT:'+M+' path:'+p+' filename:'+f+'\n']
