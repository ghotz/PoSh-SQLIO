< #      
 . S Y N O P S I S      
 	 A u t o m a t e s   d i s k   b a s e l i n i n g   w i t h   S Q L I O  
 . D E S C R I P T I O N  
 	 T h e   p u r p o s e   o f   t h i s   s c r i p t   i s   t o   a u t o m a t e   r u n n i n g   S Q L I O   m u l t i p l e   t i m e s   w i t h   d i f f e r e n t  
 	 c o m b i n a t i o n   o f   p a r a m e t e r s   t o   b a s e l i n e   t h e   p e r f o r m a n c e   o f   a   v o l u m e .  
 	  
 	 M o s t   p a r a m e t e r s   a r e   r e l a t e d   t o   S Q L I O   e x c u t i o n   w i t h   o u t - o f - t h e   b o x   d e f a u l t s   f o r   t h e  
 	 c o m m o n   s c e n a r i o .   F u r t h e r m o r e   t h e   f o l l o w i n g   f e a t u r e s   a r e   s u p p o r t e d :  
 	 	 -   a b i l i t y   t o   e s t i m a t e   o n l y   t h e   t i m e   t o   c o m p l e t e   a l l   t e s t s  
 	 	 -   p r o g r e s s   b a r   w i t h   t i m e   t o   c o m p l e t i o n   u p d a t e d   a f t e r   e v e r y   t e s t   r u n  
 	 	 -   a b i l i t y   t o   r a n g e   t h r o u g h   p a r a m e t e r s   i n t e r v a l s   e i t h e r   b y   s i n g l e   o r   b y   p o w e r   o f   2   s t e p s  
 	 	 -   a b i l i t y   t o   g e n e r a t e   o n e   s i n g l e   l o g   f i l e   o r   o n e   l o g   f i l e   p e r   t e s t   r u n  
 	  
 	 I M P O R T A N T :   t h e   s c r i p t   n e e d s   t o   b e   r u n   w i t h   A d m i n i s t r a t o r   p e r m i s s i o n s   b e c a u s e   t h e   " s e t v a l i d d a t a "  
 	 c o m m a n d   o f   F S U T I L . E X E   r e q u i r e s   i t .   S o m e   c o d e   i s   p r o v i d e d   t o   a u t o m a t i c a l l y   r e - r u n   t h e   s c r i p t  
 	 a s   A d m i n i s t r a t o r   h o w e v e r   i s   c o m m e n t e d   b e c a u s e   i t   w i l l   p o p - u p   t h e   r e q u e s t   t o   r u n   d i a l o g   a n d  
 	 t h i s   m a y   n o t   b e   t h e   e x p e c t e d   b e v a i o r   w h e n   i n t e g r a t i n g   t h e   s c r i p t   w i t h   o t h e r   s c r i p t s .  
 	 P l e a s e   n o t e   t h a t   " F S U T I L . E X E   s e t v a l i d d a t a "   d o e s n ' t   s t o p   t h e   s c r i p t   i f   p e r m i s s i o n s   a r e   n o t  
 	 g r a n t e d   a n d   i f   i t   d o e s n ' t   r u n ,   b e n c h m a r k   r e s u l t s   w i l l   b e   c o m p l e t e l y   w r o n g .  
 . P A R A M E T E R   T e s t F i l e N a m e  
 	 F u l l   p a t h n a m e   o f   t h e   d a t a   f i l e   t h a t   w i l l   b e   c r e a t e d   a n   u s e d   b y   S Q L I O   t o   r u n   t h e   b e n c h m a r k .  
 	 I f   n o t   s p e c i f i e d ,   a   f i l e   n a m e d   s q l i o t e s t f i l e . d a t   i s   i n i t i a l i z e d   u n d e r   t h e   c u r r e n t   d i r e c t o r y .  
 . P A R A M E T E R   T e s t F i l e S i z e  
 	 S i z e   o f   t h e   d a t a   f i l e   u s e d   b y   S Q L I O   t o   r u n   t h e   b e n c h m a r k .  
 	 I f   n o t   s p e c i f i e d ,   d e f a u l t s   t o   5 0 G B  
 . P A R A M E T E R   L o g d i r e c t o r y  
 	 N a m e   o f   t h e   d i r e c t o r y   w h e r e   o u t p u t   f i l e s   w i l l   b e   w r i t t e n .  
 	 I f   n o t   s p e c i f i e d ,   a   d i r e c t o r y   n a m e   " l o g "   i s   c r e a t e d   u n d e r   t h e   c u r r e n t   o n e .  
 . P A R A M E T E R   M a x T h r e a d s  
 	 M a x i m u m   n u m b e r   o f   t h r e a d s   t o   b e   u s e d   d u r i n g   t h e   s i m u l a t i o n .  
 	 I f   n o t   s p e c i f i e d ,   i t ' s   s e t   t o   t h e   n u m b e r   o f   l o g i c a l   p r o c e s s o r s .  
 . P A R A M E T E R   M a x O u t s t a n d i n g I O s  
 	 M a x i m u m   n u m b e r   o f   o u t s t a n d i n g   I O s .  
 	 I f   n o t   s p e c i f i e d ,   d e f a u l t s   t o   1 2 8 .  
 . P A R A M E T E R   S e c o n d s  
 	 T h e   n u m b e r   o f   s e c o n d s   e a c h   S Q L I O   e x e c u t i o n   s h o u l d   r u n .  
 	 I f   n o t   s e t ,   d e f a u l t s   t o   1 2 0 .  
 . P A R A M E T E R   L a t e n c y  
 	 L a t e n c y   c o n f i g u r a t i o n :   " - L S " = s y s t e m   " - L P " = p r o c e s s o r   " " = n o n e .  
 	 I f   n o t   s p e c i f i e d ,   d e f a u l t s   t o   - L S .  
 . P A R A M E T E R   B u f f e r i n g  
 	 B u f f e r i n g   c o n f i g u r a t i o n :   " - B N " = n o n e ,   " - B Y " = a l l ,   " - B H " = h a r d w a r e ,   " - B S " = s o f t w a r e .  
 	 I f   n o t   s p e c i f i e d ,   d e f a u l t s   t o   - B N .  
 . P A R A M E T E R   I n c r e m e n t T h r e a d s B y 1  
 	 S p e c i f i e s   t h a t   t h r e a d s   s h o u l d   b e   i n c r e m e n t e d   b y   1   i n s t e a d   o f   p o w e r s   o f   2 .  
 . P A R A M E T E R   I n c r e m e n t O u t s t a n d i n g I O s B y 1  
 	 S p e c i f i e s   t h a t   o u s t a n d i n g   I O s   s h o u l d   b e   i n c r e m e n t e d   b y   1   i n s t e a d   o f   p o w e r s   o f   2 .  
 . P A R A M E T E R   E s t i m a t e T i m e O n l y  
 	 O u t p u t s   o n l y   t h e   t o t a l   n u m b e r   o f   t e s t s   a n d   t h e   t i m e   e s t i m a t e d   t o   c o m p l e t e .  
 . P A R A M E T E R   S i n g l e L o g F i l e  
 	 A p p e n d s   a l l   t e s t s   r e s u l t s   i n t o   a   s i n g l e   l o g   f i l e .  
 . E X A M P L E  
 	 s q l i o - b a s e l i n e - d i s k . p s 1   - E s t i m a t e O n l y  
 	 E s t i m a t e s   o n l y   t h e   d u r a t i o n   o f   a l l   t e s t s   u s i n g   t h e   d e f a u l t   p a r a m e t e r s :  
 	 	 T e s t   f i l e   n a m e :   s q l i o t e s t f i l e . d a t   ( i n   t h e   c u r r e n t   d i r e c t o r y )  
 	 	 T e s t   f i l e   s i z e :   1 0 G B  
 	 	 L o g   d i r e c t o r y :   l o g   ( i n   t h e   c u r r e n t   d i r e c t o r y )  
 	 	 M a x i m u m   n u m b e r   o f   t h r e a d s :   s e t   t o   n u m b e r   o f   c o r e s  
 	 	 M a x i m u m   n u m b e r   o f   o u s t a n d i n g   I O s :   1 2 8  
 	 	 N u m b e r   o f   s e c o n d s   t o   r u n   e a c h   t e s t :   3 0  
 	 	 L a t e n c i e s   f r o m :   s y s t e m   ( - L S ) 	  
 	 	 B u f f e r i n g :   n o n e   ( - B N )  
 	 	 N u m b e r   o f   t h r e a d s :   f r o m   1   t o   n u m b e r   o f   c o r e s   i n   p o w e r s   o f   2   i n c r e m e n t s  
 	 	 O u s t a n d i n g   I O s :   f r o m   1   t o   1 2 8   i n   p o w e r s   o f   2   i n c r e m e n t s  
 	 	 L o g g i n g :   o n e   f i l e   p e r   t e s t   r u n  
 . E X A M P L E  
 	 s q l i o - b a s e l i n e - d i s k . p s 1   - S e c o n d s   3 0 0  
 	 R u n s   a l l   t e s t s   u s i n g   d e f a u l t   c o n f i g u r a t i o n   p a r a m e t e r s   e x c e p t   f o r   t h e   n u m b e r   o f   s e c o n d s  
 	 e a c h   t e s t   s h o u l d   r u n   w h i c h   i s   s e t   t o   m i n u t e s .  
 . E X A M P L E  
 	 s q l i o - b a s e l i n e - d i s k . p s 1   - T e s t F i l e N a m e   " E : \ M y T e s t F i l e "   - T e s t F i l e S i z e   5 0 G B  
 	 R u n s   a l l   t e s t s   u s i n g   d e f a u l t   c o n f i g u r a t i o n   p a r a m e t e r s   e x c e p t   i t   c r e a t e s   a   s p e c i f i c  
 	 t e s t   f i l e   ( o n   a   s p e c i f i c   v o l u m e   a n d   a   d i f f e r e n t   n a m e )   w i t h   a   s i z e   o f   5 0 G B .  
 . N O T E S  
 	 V e r s i o n 	 	 :   1 . 0  
 	 A u t h o r 	 	 :   G i a n l u c a   H o t z   -   g i a n l u c a _ h o t z @ h o t m a i l . c o m  
 	 C o p y r i g h t 	 :   ( c )   2 0 1 4 ,   G i a n l u c a   H o t z   ( B S D   3 - c l a u s e   l i c e n s e )  
 . L I N K  
 	 h t t p : / / w w w . g h o t z . c o m  
 . L I N K  
 	 h t t p : / / w w w . m i c r o s o f t . c o m / e n - u s / d o w n l o a d / d e t a i l s . a s p x ? i d = 2 0 1 6 3  
 # >  
 p a r a m  
 (  
 	 [ s t r i n g ] $ T e s t F i l e N a m e   =   " s q l i o t e s t f i l e . d a t " ,  
 	 [ l o n g ] $ T e s t F i l e S i z e   =   ( 5 0 G B ) ,  
 	 [ s t r i n g ] $ L o g d i r e c t o r y   =   " l o g " ,  
 	 [ i n t ] $ M a x T h r e a d s   =   ( G e t - W M I O b j e c t   w i n 3 2 _ P r o c e s s o r   - P r o p e r t y   N u m b e r O f L o g i c a l P r o c e s s o r s   |   M e a s u r e - O b j e c t   N u m b e r O f L o g i c a l P r o c e s s o r s   - s u m ) . S u m ,  
 	 [ i n t ] $ M a x O u t s t a n d i n g I O s   =   1 2 8 ,  
 	 [ i n t ] $ S e c o n d s   =   1 2 0 ,  
 	 [ s t r i n g ] $ L a t e n c y   =   " - L S " ,  
 	 [ s t r i n g ] $ B u f f e r i n g   =   " - B N " ,  
 	 [ s w i t c h ] $ I n c r e m e n t T h r e a d s B y 1 ,  
 	 [ s w i t c h ] $ I n c r e m e n t O u t s t a n d i n g I O s B y 1 ,  
 	 [ s w i t c h ] $ E s t i m a t e T i m e O n l y ,  
 	 [ s w i t c h ] $ S i n g l e L o g F i l e  
 ) ;  
 # r e g i o n   S t a r t u p  
 I f   ( ! ( [ S e c u r i t y . P r i n c i p a l . W i n d o w s P r i n c i p a l ] [ S e c u r i t y . P r i n c i p a l . W i n d o w s I d e n t i t y ] : : G e t C u r r e n t ( ) ) . I s I n R o l e ( [ S e c u r i t y . P r i n c i p a l . W i n d o w s B u i l t I n R o l e ]   " A d m i n i s t r a t o r " ) )  
 {        
 	 # $ a r g u m e n t s   =   " &   ' "   +   $ m y i n v o c a t i o n . m y c o m m a n d . d e f i n i t i o n   +   " ' "  
 	 # S t a r t - P r o c e s s   p o w e r s h e l l   - V e r b   r u n A s   - A r g u m e n t L i s t   $ a r g u m e n t s  
 	 W r i t e - O u t p u t   " T h i s   s c r i p t   r e q u i r e s   A d m i n i s t r a t o r   r i g h t s ,   p l e a s e   r u n   P o w e r S h e l l   a s   A d m i n i s t r a t o r   a n d   r e t r y . " ;  
 	 r e t u r n  
 } ;  
  
 #   I n i t i a l i z e   a r r a y   o f   c o m m o n   S Q L   S e r v e r   t e s t s  
 $ T e s t s   =  
 @ (  
 	 ( 8 , 	 	 " W " , 	 " r a n d o m " , 	 	 " c h e c k p o i n t s ,   t e m p d b ,   e t c . " ) ,  
 	 ( 8 , 	 	 " W " , 	 " s e q u e n t i a l " , 	 " b u l k   i n s e r t s " ) ,  
 	 ( 6 4 , 	 " W " , 	 " s e q u e n t i a l " , 	 " c h e c k p o i n t s ,   r e i n d e x ,   b u l k   i n s e r t s " ) ,  
 	 ( 1 2 8 , 	 " W " , 	 " s e q u e n t i a l " , 	 " b u l k   i n s e r t s ,   r e i n d e x " ) ,  
 	 ( 8 , 	 	 " R " , 	 " r a n d o m " , 	 	 " p a t t e r n   f o r   r a n d o m   d a t a   r e a d s ,   s i n g l e t o n   s e e k s ,   e t c . " ) ,  
 	 ( 6 4 , 	 " R " , 	 " s e q u e n t i a l " , 	 " r e a d - a h e a d ,   r e i n d e x ,   c h e c k d b " ) ,  
 	 ( 1 2 8 , 	 " R " , 	 " s e q u e n t i a l " , 	 " r e a d - a h e a d ,   r e i n d e x ,   c h e c k d b " ) ,  
 	 ( 2 5 6 , 	 " R " , 	 " s e q u e n t i a l " , 	 " r e a d - a h e a d ,   r e i n d e x " ) ,  
 	 ( 1 0 2 4 , 	 " R " , 	 " s e q u e n t i a l " , 	 " b a c k u p s " )  
 ) ;  
  
 #   C a l c u l a t e   t e s t   m e t r i c s  
 $ T o t a l T h r e a d T e s t s   =   i f   ( $ I n c r e m e n t T h r e a d s B y 1 )   { $ M a x T h r e a d s }   e l s e   { ( [ M a t h ] : : F l o o r ( [ M a t h ] : : L o g ( $ M a x T h r e a d s )   /   [ M a t h ] : : L o g ( 2 ) ) ) + 1 } ;  
 $ T o t a l O u s t a n d i n g I O T e s t s   =   i f   ( $ I n c r e m e n t O u t s t a n d i n g I O s B y 1 )   { $ M a x O u t s t a n d i n g I O s }   e l s e   { ( [ M a t h ] : : F l o o r ( [ M a t h ] : : L o g ( $ M a x O u t s t a n d i n g I O s )   /   [ M a t h ] : : L o g ( 2 ) ) ) + 1 } ;  
 $ T o t a l T e s t s   =   ( $ T e s t s . C o u n t )   *   $ T o t a l T h r e a d T e s t s   *   $ T o t a l O u s t a n d i n g I O T e s t s ;  
 $ T o t a l S e c o n d s E x p e c t e d   =   $ T o t a l T e s t s   *   $ S e c o n d s ;  
  
 W r i t e - O u t p u t   " R u n n i n g   $ T o t a l T e s t s   t e s t s ,   e x p e c t e d   e l a p s e d   t i m e   $ ( [ t i m e s p a n ] : : F r o m S e c o n d s ( $ T o t a l S e c o n d s E x p e c t e d ) . T o S t r i n g ( ) ) " ;  
 i f   ( $ E s t i m a t e T i m e O n l y )   {   r e t u r n   } ;  
  
 W r i t e - P r o g r e s s   - A c t i v i t y   " T e s t   i n i t i a l i z a t i o n "   - S t a t u s   " P r o c e s s i n g "   - C u r r e n t O p e r a t i o n   " C r e a t i n g   a n d   i n i t i a l i z i n g   t e s t   f i l e " ;  
 i f   ( ( T e s t - P a t h   $ T e s t F i l e N a m e ) )   {   R e m o v e - I t e m   - P a t h   $ T e s t F i l e N a m e ;   } ;  
 F S U T I L . E X E   f i l e   c r e a t e n e w   " $ T e s t F i l e N a m e "   $ T e s t F i l e S i z e ;  
 F S U T I L . E X E   f i l e   s e t v a l i d d a t a   " $ T e s t F i l e N a m e "   $ T e s t F i l e S i z e ;  
  
 W r i t e - P r o g r e s s   - A c t i v i t y   " T e s t   i n i t i a l i z a t i o n "   - S t a t u s   " P r o c e s s i n g "   - C u r r e n t O p e r a t i o n   " C r e a t i n g   l o g   d i r e c t o r y   i f   m i s s i n g . . . " ;  
 i f   ( ! ( T e s t - P a t h   $ L o g d i r e c t o r y ) )   {   N e w - I t e m   - I t e m T y p e   D i r e c t o r y   - P a t h   $ L o g d i r e c t o r y ;   } ;  
 # e n d r e g i o n   S t a r t u p  
 # r e g i o n   M a i n  
 $ N u m T e s t   =   0 ;  
  
 f o r e a c h   ( $ T e s t   i n   $ T e s t s )  
 {  
 	 $ P r o g r e s s M s g 1   =   " S Q L   S e r v e r   t e s t   p a t t e r n :   $ ( $ T e s t [ 3 ] ) . " ;  
 	 W r i t e - P r o g r e s s   - A c t i v i t y   $ P r o g r e s s M s g 1   - S t a t u s   " P r o c e s s i n g "   - S e c o n d s R e m a i n i n g   ( $ T o t a l S e c o n d s E x p e c t e d   -   ( $ N u m T e s t   *   $ S e c o n d s ) ) ;  
 	 f o r e a c h   ( $ T h r e a d   i n   1 . . $ M a x T h r e a d s )  
 	 {  
 	 	 i f   ( ! ( $ T h r e a d   - b a n d   ( $ T h r e a d   -   1 ) )   - o r   $ I n c r e m e n t T h r e a d s B y 1 )  
 	 	 {  
 	 	 	 f o r e a c h   ( $ O u t s t a n d i n g I O   i n   1 . . $ M a x O u t s t a n d i n g I O s )  
 	 	 	 {  
 	 	 	 	 i f   ( ! ( $ O u t s t a n d i n g I O   - b a n d   ( $ O u t s t a n d i n g I O   -   1 ) )   - o r   $ I n c r e m e n t O u t s t a n d i n g I O s B y 1 )  
 	 	 	 	 {  
 	 	 	 	 	 $ N u m T e s t + + ;  
 	 	 	 	 	 $ P r o g r e s s M s g 2   =   " T e s t i n g   f o r   $ ( $ S e c o n d s )   s e c o n d s   $ ( $ T e s t [ 2 ] )   $ ( s w i t c h ( $ T e s t [ 1 ] ) { ' W '   { ' w r i t e ' }   ' R '   { ' r e a d ' } } )   w i t h   $ ( $ T e s t [ 0 ] ) K B   u s i n g   $ ( $ T h r e a d )   t h r e a d ( s )   a n d   $ ( $ O u t s t a n d i n g I O )   o u t s t a n d i n g   I O ( s ) " ;  
 	 	 	 	 	 W r i t e - P r o g r e s s   - A c t i v i t y   $ P r o g r e s s M s g 1   - S t a t u s   " P r o c e s s i n g "   - C u r r e n t O p e r a t i o n   $ P r o g r e s s M s g 2   - S e c o n d s R e m a i n i n g   ( $ T o t a l S e c o n d s E x p e c t e d   -   ( $ N u m T e s t   *   $ S e c o n d s ) )   - P e r c e n t C o m p l e t e   ( ( ( $ N u m T e s t   *   $ S e c o n d s )   /   $ T o t a l S e c o n d s E x p e c t e d )   *   1 0 0 ) ;  
 	 	 	 	 	 $ L o g F i l e N a m e   =   J o i n - P a t h   $ L o g d i r e c t o r y   " s q l i o _ b $ ( $ T e s t [ 0 ] ) _ k $ ( $ T e s t [ 1 ] ) _ f $ ( $ T e s t [ 2 ] ) _ s $ ( $ S e c o n d s ) _ t $ ( $ T h r e a d ) _ o $ ( $ O u t s t a n d i n g I O ) . t x t " ;  
 	 	 	 	 	 C : \ U t i l s \ S Q L I O \ s q l i o . e x e   " - k $ ( $ T e s t [ 1 ] ) "   " - t $ ( $ T h r e a d ) "   " - s $ ( $ S e c o n d s ) "   " - o $ ( $ O u t s t a n d i n g I O ) "   " - f $ ( $ T e s t [ 2 ] ) "   " - b $ ( $ T e s t [ 0 ] ) "   " $ L a t e n c y "   " $ B u f f e r i n g "   " $ T e s t F i l e N a m e "   2 > & 1   >   " $ L o g F i l e N a m e "  
 	 	 	 	 } ;  
 	 	 	 } ;  
 	 	 } ;  
 	 } ;  
 } ;  
 # e n d r e g i o n   M a i n 