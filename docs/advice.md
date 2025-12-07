---
title: Advice
---

Use, adapt, or ignore anything here—just keep moving forward.

## Life
- Protect time for what makes you happy and double down on it.
- Own mistakes quickly; apologies repair teams faster than clever fixes.
- When exhaustion hits, rest first; once the tank refills, return to a simple
  exercise routine you can sustain for years.
- Reading is fuel for new ideas—keep magazines, books, and papers in rotation.

## Computers & Tools
- Automate backups (Time Machine + off-site) so accidents are boring, not tragic.
- Learn a programmable editor (Emacs, Vim, whatever) and customize it enough that it feels like home.
- Keep a small bag of shell tricks for cleanup and setup:

| Command | Purpose |
| ------- | ------- |
| `find ./ -name "*.cdslck" -exec rm {} \;` | Remove Cadence lock files |
| `ssh-keygen -t rsa` | Create a reusable SSH key |
| `cat ~/.ssh/id_rsa.pub | ssh host "cat >> .ssh/authorized_keys"` | Copy key to a remote |

## Programming
Pick a project you desperately want solved, then code relentlessly until it works. Books and tutorials are fine, but only as fuel for today’s experiment, not as substitutes for it.

## Circuits
- Write a verification plan before layout, and follow it.
- Simulate corner cases, document every unknown, and design tests that prove or dismiss each one.
- Shield and decouple anything that needs more than ~10 bits of honesty.
- When in doubt, probe the bias nodes, current densities, and layout parasitics—they always tattle.

## Keep Exploring
The long-form notes, war stories, and measurement tricks still live in my notebooks. If you need more depth on any section above, reach out and I’ll point you to the right logbook.
