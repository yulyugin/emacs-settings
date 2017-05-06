(setq diary-highlights
 '(("TODO" . font-lock-constant-face)
   ("DONE" . font-lock-function-name-face)))

(define-derived-mode diary-mode fundamental-mode "diary"
 "Major mode fo diary."
 (setq font-lock-defaults '(diary-highlights)))

(provide 'diary)
