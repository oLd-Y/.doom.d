(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-agenda-files '("d:/home/guolianyao/org/agenda.org"))
 '(org-capture-templates
   '(("h" "Hugo post" entry
      (file "roam/all-posts.org")
      #'org-hugo-new-subtree-post-capture-template)
     ("t" "Personal todo" entry
      (file+headline +org-capture-todo-file "Inbox")
      "* [ ] %?\12%i\12%a" :prepend t)
     ("n" "Personal notes" entry
      (file+headline +org-capture-notes-file "Inbox")
      "* %u %?\12%i\12%a" :prepend t)
     ("j" "Journal" entry
      (file+olp+datetree +org-capture-journal-file)
      "* %U %?\12%i\12%a" :prepend t)
     ("p" "Templates for projects")
     ("pt" "Project-local todo" entry
      (file+headline +org-capture-project-todo-file "Inbox")
      "* TODO %?\12%i\12%a" :prepend t)
     ("pn" "Project-local notes" entry
      (file+headline +org-capture-project-notes-file "Inbox")
      "* %U %?\12%i\12%a" :prepend t)
     ("pc" "Project-local changelog" entry
      (file+headline +org-capture-project-changelog-file "Unreleased")
      "* %U %?\12%i\12%a" :prepend t)
     ("o" "Centralized templates for projects")
     ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\12 %i\12 %a" :heading "Tasks" :prepend nil)
     ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\12 %i\12 %a" :prepend t :heading "Notes")
     ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\12 %i\12 %a" :prepend t :heading "Changelog")))
 '(package-selected-packages '(all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
