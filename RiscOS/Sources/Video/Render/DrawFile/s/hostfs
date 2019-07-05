        AREA    Asm,CODE,READONLY

        EXPORT  xhostfs_writec
xhostfs_writec
        MOV     ip,lr
        SWI     &40102
        MOVVC   a1,#0
        MOV     pc,ip

        END
