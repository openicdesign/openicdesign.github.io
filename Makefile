
JEKYLL_VERSION=3.8
SITE=${shell pwd}/docs

.PHONY: presentations publications

jstart:
	docker run --rm --name aic_docs --volume="${SITE}:/srv/jekyll" -p 3002:4000 -it jekyll/jekyll:${JEKYLL_VERSION} jekyll serve --watch --drafts

posts:
	./genposts.sh
	cd lectures; cat ../images.txt |xargs git add -f

links:
	gh repo list --limit 300 --json name > repos.json
	python3 links.py

presentations:
	perl -e 'print("---\ntitle: Presentations\n---\n\n")' > docs/presentations.md
	perl -e 'use strict; use warnings; my $$dir="presentations"; opendir(my $$dh,$$dir) or exit 0; my @files = sort grep { /\.md$$/i && -f "$$dir/$$_" } readdir($$dh); closedir($$dh); foreach my $$file (@files) { (my $$slug=$$file)=~s/\.md$$//i; print "__[$$slug](assets/presentations/$$slug.pdf)__ "; open(my $$fh,"<","$$dir/$$file") or next; local $$/; print <$$fh>; print "\n\n"; }' >> docs/presentations.md

publications:
	perl -e 'print("---\ntitle: Publications\n---\n\n")' > docs/publications.md
	perl -e 'use strict; use warnings; my $$dir="publications"; opendir(my $$dh,$$dir) or exit 0; my @files = sort grep { /\.md$$/i && -f "$$dir/$$_" } readdir($$dh); closedir($$dh); foreach my $$file (@files) { (my $$display=$$file)=~s/\.md$$//i; my $$asset=$$display; $$asset =~ s/^.*__// if $$asset =~ /__/; print "__[$$display](assets/publications/$$asset.pdf)__ "; open(my $$fh,"<","$$dir/$$file") or next; local $$/; print <$$fh>; print "\n\n"; }' >> docs/publications.md
