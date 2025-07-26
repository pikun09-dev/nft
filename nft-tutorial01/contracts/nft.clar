
(define-non-fungible-token tutorial-nft uint)

(define-data-var next-token-id uint u1)

(define-public (mint)
  (let ((token-id (var-get next-token-id)))
    (begin
      (try! (nft-mint? tutorial-nft token-id tx-sender))
      (var-set next-token-id (+ token-id u1))
      (ok { token-id: token-id, owner: tx-sender })
    )
  )
)

(define-read-only (get-owner (id uint))
  (nft-get-owner? tutorial-nft id))



