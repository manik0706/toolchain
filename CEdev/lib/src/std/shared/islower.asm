	.def	_islower
	.ref	___maptab
	.assume adl=1

; original source
; int islower(int c) {
; 	if( (unsigned char)c & (unsigned char)0x80 )
;		return (0);
;	return(__maptab[c] & (unsigned char)(LC));
; }

_islower:
	pop	hl
	pop	de
	push	de
	push	hl
	or	a,a
	sbc	hl,hl
	ld	a,e
	and	a,128
	ret	nz
	ex	de,hl
	ld	de,___maptab
	add	hl,de
	ld	a,(hl)
	and	a,4
	sbc	hl,hl
	ld	l,a
	ret
