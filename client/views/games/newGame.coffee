###
    can't believe I'm writing this...
    automatically inserts p tags, <br/>'s,
	but strips out everything else
###
@stripTagsAndAutoP = (txt) ->

	# console.log "Step 0:\n==========\n" + txt

	# kill any tags
	txt = txt.replace(/<[^>]*>/gm, '')
	# console.log "Step 1:\n==========\n" + txt

	# remove "\t"s
	txt = txt.replace(/\t/g, '')
	# console.log "Step 2:\n==========\n" + txt

	# change lines that are just "\s"s to just line breaks
	txt = txt.replace(/^\s+$/gm, '')
	# console.log "Step 3:\n==========\n" + txt

	# trim each line
	txt = txt.replace(/(?:^ +| +$)/gm, '')
	# console.log "Step 3.5:\n==========\n" + txt

	# replace > 2 line breaks to just 2 line breaks
	txt = txt.replace(/(\n\r?\n\r?)(?:\n\r?)+/g, "$1")
	# console.log "Step 4:\n==========\n" + txt

	# replace single line breaks with <br/>
	# also kill orphaned <br/>'s at the beginning/end of lines
	txt = txt.replace(/\n\r?(?!\n\r?)/g, '<br/>').replace(/^<br\/>/gm, '').replace(/<br\/>$/gm, '')
	# console.log "Step 5:\n==========\n" + txt

	# wrap blocks of text in <p> tags
	# txt = txt.replace(/((?:.*|\n\r?)*)\n\r?\n\r?/gm, "<p>$1</p>")
	txt = txt.replace(/(^.+$)/gm, '<p>$1</p>')
	# console.log "Step 7:\n==========\n" + txt

	# now "minify" the HTML to be just one line
	txt = txt.replace(/\n\r?/g, '')

	return txt
