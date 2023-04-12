;;; devcontainer.el --- Work with Dev Containers (https://containers.dev)   -*- lexical-binding: t; -*-

;; Copyright (C) 2023 Brad Schwartz

;; Author: Brad Schwartz <baschwartz95@gmail.com>
;; Keywords: devcontainer docker 
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; `devcontainer.el' offers an entrypoint to working with devcontainers
;; *Heavily* inspired by the experience when using VSCodes devcontainers.
;; Relies on having `docker` CLI installed - any config relating to where the
;; docker daemon is running is left to you.

;;; Code:

;;(require 'docker-tramp)
(require 'shell)
(require 'json)

(defgroup devcontainer nil
  "DevContainer integration for Emacs"
  :prefix "devcontainer-"
  :group 'applications
  :link "https://github.com/bradschwartz/devcontainer.el"
  :link '(emacs-commentary-link :tag "Commentary" "devcontainer"))

(defun devcontainer-show-config ()
  "Show the prioritized devcontainer file"
  (interactive)
  "Show which configuration file is being used."
  (shell-command "pwd")
  (shell-command "devcontainer read-configuration --workspace-folder .|jq")
  ;;  (message ".devcontainer/devcontainer.json")
  )

(defun devcontainer-up ()
  "Start the devcontainer in this workspace"
  (interactive)
  ;; TODO: devcontainer up --workspace-folder .
  (setq devcontainer-container-id
	(cdr (assoc 'containerId
		(json-read-from-string
		 (shell-command-to-string "echo -n '{\"outcome\":\"success\",\"containerId\":\"c5fece2b9a3564cc47fab8fa668656121ccccb0aa5970fda4308db130f8d7ca2\",\"remoteUser\":\"root\",\"remoteWorkspaceFolder\":\"/workspaces/resume\"}'")
		 )
		))
	)
  (message devcontainer-container-id)
  )

(defun devcontainer-current-container-id ()
  "If a devcontainer is running, print the container ID"
  (interactive)
  (if (boundp 'devcontainer-container-id)
      (message devcontainer-container-id)
    (message "No devcontainer started"))
  )

(provide 'devcontainer)

;;; devcontainer.el ends here
