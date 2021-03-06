;;; lang/data/config.el -*- lexical-binding: t; -*-

(push '("/sxhkdrc" . conf-mode) auto-mode-alist)


(def-package! dockerfile-mode
  :mode "/Dockerfile$")


(def-package! graphql-mode
  :mode "\\.g\\(?:raph\\)?ql$")


(def-package! hexl ; For ROM hacking or debugging
  :mode ("\\.hex$" . hexl-mode)
  :mode ("\\.nes$" . hexl-mode))


(def-package! json-mode
  :mode "\\.js\\(?:on\\|[hl]int\\(rc\\)?\\)$"
  :config
  (when (featurep! :feature syntax-checker)
    (add-hook 'json-mode-hook #'flycheck-mode))
  (set! :electric 'json-mode :chars '(?\n ?: ?{ ?})))


(def-package! nxml-mode
  :mode "\\.plist$"
  :config
  (set! :company-backend 'nxml-mode '(company-nxml company-yasnippet)))


(def-package! toml-mode
  :mode "\\.toml$")


(def-package! vimrc-mode
  :mode "/\\.?g?vimrc$"
  :mode "\\.vimp?$"
  :mode "\\.?vimperatorrc$")


(def-package! yaml-mode
  :mode "\\.ya?ml$")


;;
;; Frameworks
;;

(def-project-mode! +data-ansible-mode
  :modes (yaml-mode)
  :files "roles/")

(def-project-mode! +data-vagrant-mode
  :files "Vagrantfile")

