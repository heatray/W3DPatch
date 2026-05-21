<# :
@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression ([System.IO.File]::ReadAllText('%~f0'))"
goto :eof
#>
Write-Host "Worms 3D Integrity Check`n"

$errors = 0
$checks = 0

$list = @'
d182adb75c76bf0ed32e6f05e8555a48  Data\AITwk.xom
5c76bcff5ba3cfa18006af37043270af  Data\CamTwk.xom
8f56b66e21d6bc516ab2890b5f03a450  Data\DefSave.xom
c7a84a58ecfff6fd9abe31d4c8949cc5  Data\HudTwk.xom
d466c1cc0d0c9aa85d99cad1758b03cd  Data\Local.xom
afc78f99b08a541e143eca2aac858be0  Data\LvlSetup.xom
3339ef6b42f67a01cba27f88bba02a44  Data\MenuTwk.xom
9a074826bb4b9062ab88b42622b6bace  Data\PartTwk.xom
12b0fbfcd26c6c9d9d371fa09717b599  Data\Persist.xom
636b31e9f1bfbfe8c676c26f69e058f0  Data\Scripts.xom
4e1e04722bcd2719e18e0444890963d5  Data\Tweak.xom
90eea4440946e98598bb2dc15637edea  Data\WeapTwk.xom
343bd139918727610585ac7c085e717a  Data\Audio\Alien.aud
4b59825fce4c7eac26978c9d8e3ea735  Data\Audio\American Wrestler.aud
a6d09fc26c0452ce29f3682008f6a0ed  Data\Audio\Biggles.aud
a473aba314516dd15a34394ae166165f  Data\Audio\Blues Man.aud
7734267df495e506373c456c8638fcc5  Data\Audio\Capone.aud
a156d89c77209f79859a00cbe7cc0a24  Data\Audio\Classic.aud
3297096147c3085b0947da38769f31f5  Data\Audio\Confucious.aud
ccb76abf85d0e61596518dd94544970b  Data\Audio\Conscience.aud
3ce2af24acb4972ea27fa814ad38ee6f  Data\Audio\Cowgirl.aud
2358bcbbb94fa143848b0106301d2668  Data\Audio\Cyberworms.aud
f7ae702400a7add371e353203227582e  Data\Audio\Drill Sergeant.aud
ad40d46bc4f512f5ab9dc32b00352753  Data\Audio\FEMUSPS2.aud
20b2bcae1228cb701b19450ff702a84f  Data\Audio\FEnd.aud
c5029355bfd3fbe989d6ac34cb964944  Data\Audio\FEndStrm.aud
6ae875fff63ae1e13868b3a0874687e7  Data\Audio\FESFXPS2.aud
4e92f1749c3ca19eee973c09f2bc1aaf  Data\Audio\Footy Fan.aud
ee29a0c62acd29c0cfdcb8f0dfe02ac8  Data\Audio\French Lover.aud
b47f65ec49aba2601c6e218909319c82  Data\Audio\French.aud
4a7eacbedd247f14a13707c65a78d98f  Data\Audio\Gangsta.aud
891690e2bd5c96b3c0da1dad6deee0b7  Data\Audio\Geordie.aud
04ccc1fb124181373c60a78bedb5d5bb  Data\Audio\German.aud
203af61559721548af40b2e7f40fa892  Data\Audio\Grandpa.aud
b41f65f2efdd82e9e84ea1ae093895a1  Data\Audio\Happy Days.aud
b57a5992b0cff16fa6166856d78d009b  Data\Audio\Hippy.aud
a6a03451971fda2a4358639706b1a8bc  Data\Audio\Horror.aud
13bfaa0a4318aa9f1ad53334499faf0c  Data\Audio\Irish.aud
c1e68da5c5ed8ab554499c1b23a3a7a3  Data\Audio\Italian.aud
26f0c5167bcd39d2876941967d1f2410  Data\Audio\London Cabbie.aud
d4be2f762eee26c930873901feb2144d  Data\Audio\Madchester.aud
e0326c8d46c4752436fe166c572ae0c9  Data\Audio\MUSPS2.aud
eaabfdddec0d1cebee5b55faf5ba2731  Data\Audio\Nagging Wife.aud
b94bd4d2d76b475f6904e71f29efd61a  Data\Audio\Patronising.aud
4bbf9c7bc3ca68a977f7eaf0d48207b8  Data\Audio\Pirate.aud
d765e6dcdbe1548b4dd80dd7a7e5e6e0  Data\Audio\Russki.aud
fe5067931897c62c85a7f0928e500f24  Data\Audio\Scotsman.aud
1c7aafef9d630a692db953147eb20fef  Data\Audio\sfx.aud
eb933572e57d362da53640ae62a743c7  Data\Audio\SFXPS2.aud
bc13719763ca136ec79ed1648805b2b0  Data\Audio\Southern Belle.aud
85b9716863674fe91870a7b6c10ad92d  Data\Audio\Spanish Inquisition.aud
489464205c13b768a718f4c786b0c97f  Data\Audio\Spanish.aud
6656673f9ef5d92d4a65952e9495be14  Data\Audio\StreamMusic.aud
4b36c7857b34e09a330764f081c8d357  Data\Audio\Super Hero.aud
b5f20009d76d723e8f041dd8a514a8c7  Data\Audio\Super Villain.aud
5c889559ca5ec27048f53d701eff9812  Data\Audio\Surfer.aud
2c24a9a5a64bf447d0b0a4ba933ac7f3  Data\Audio\Teenage Angst.aud
3d86e58a9f27b3e2ee0ed4b5f3307a79  Data\Audio\Two Smoking Barrels.aud
fc1ee0064cfc50d492a631c4583397bd  Data\Audio\US Sports.aud
42366b9624676aa3e599cc70cbfe84e8  Data\Audio\Viking.aud
ce42ae40d19ede968d836ec056cc8700  Data\Audio\War General.aud
dd4def86a7f84053cc1d656937624ae2  Data\Audio\Welsh.aud
a70007ad72c3b583672641d6ad233fd9  Data\Audio\Whoopsie.aud
627b3c3397ab9ee6e6d4a9a2a28b038b  Data\Audio\music\arctic1.wav
b3571e6792fa855757ab76acc10f00ad  Data\Audio\music\arctic2.wav
4afa05fc3cdbe7862be89ec5a04c2d24  Data\Audio\music\arctic3.wav
87f87d1df863a2b1409b62ae9c4b3a64  Data\Audio\music\arctic4.wav
6885b38186a9ea3d055bd80c81a9f694  Data\Audio\music\arctic_day.wav
c3004682154156fb7c2d91b4ffb1da95  Data\Audio\music\arctic_night.wav
71ba2b1a9de74f22f5aca346445a4de2  Data\Audio\music\CocoInst.wav
fff1686998f9b3b3e0d79fb1e316f37e  Data\Audio\music\Coconuts.wav
6e0b8c2dff5e99af2e378e057ae3961d  Data\Audio\music\FELoopAmbience.wav
87b25f6bd8037850e6eb2f13cbf8410e  Data\Audio\music\FELoopMusic.wav
581041485850702b9ccc9db430bf2488  Data\Audio\music\FELoopSfx.wav
234dfe14fed6a824e06ff0f5fdb9ca5a  Data\Audio\music\gothic1.wav
bb75474d413e35ce4ec18387dbc6e8af  Data\Audio\music\gothic2.wav
569d9bbf7829f76ac2b55dad667a2fdf  Data\Audio\music\gothic3.wav
49539b32c78f2d6142bdfbc97a18b42f  Data\Audio\music\gothic4.wav
3c89bfb936236e68068fa73b865d7564  Data\Audio\music\gothic_day.wav
71850c951ad213243c9629736a6ba6b0  Data\Audio\music\gothic_night.wav
1fc503fa51101b7a268c4dbd7ca99332  Data\Audio\music\music-frontend.wav
2e9252cf0dd16bad5de2f479856f92c5  Data\Audio\music\pirate1.wav
3511063e4bbb1b78a356c5269bcfe405  Data\Audio\music\pirate2.wav
cb1dfa955ffe8dd9bad4986c1cc0bd24  Data\Audio\music\pirate3.wav
dde08d948b39f0920886a5f7bb64e739  Data\Audio\music\pirate4.wav
8e3712ecde0afc0380f88ef695b5cffd  Data\Audio\music\pirate_day.wav
baf1b4513475159f71e88b00806c2c38  Data\Audio\music\pirate_night.wav
3901064ce8b4088a925e9fcdf4e6bdae  Data\Audio\music\space1.wav
bf1efe450f3ca6b19fe5a3323a77bf1a  Data\Audio\music\space2.wav
011c7527864015a54db743863700e520  Data\Audio\music\space3.wav
64e73290efacfbf992b37abb70a66ed2  Data\Audio\music\space4.wav
253af02466deb9fe7d4cb00384a2e9f0  Data\Audio\music\space_day.wav
bc1d9405ba3b45fd3c07233755dc7cc7  Data\Audio\music\space_night.wav
91b2b7d4ec0add9e009fd52d0e17dcbe  Data\Audio\music\tudor1.wav
ee918e23e1f1b99de3c611cd82bd8475  Data\Audio\music\tudor2.wav
06fcc72ef92c256067bb1c0935aa5f59  Data\Audio\music\tudor3.wav
ad5610e003afb68450f917d52ee2fa23  Data\Audio\music\tudor4.wav
69c4e4db3b6ceff6bd03f7aa344fbf1f  Data\Audio\music\tudor_day.wav
c9465dc2d7b7c59fb7affc5bc4f90b8e  Data\Audio\music\tudor_night.wav
5ea194176d8eb624c58832232564e186  Data\Audio\music\war1.wav
cc7b862505ad955e11acfa5b86bed126  Data\Audio\music\war2.wav
86ee448d68aeaadb7f6b359900c4db81  Data\Audio\music\war3.wav
2b47b31584702128a46c1322f87ebe41  Data\Audio\music\war4.wav
9eb3572a3c6df714f155645d1a6384ba  Data\Audio\music\war_day.wav
1da954c3c6dff86dfa402be1cd893e6b  Data\Audio\music\war_night.wav
a4c7bcaade3345f0f2e7a09d8ca885fd  Data\Audio\music\worms-intro-fanfare.wav
519dc263fd8fa1d9c6e91ae37afe0f34  Data\Audio\music\wormsong.wav
3cfd781c5a0226ebfdb2f17967b77b61  Data\Audio\sfx\AxeImpact.wav
2c29763a58565e768c9d4257140ba376  Data\Audio\sfx\AxeSwing.wav
4b0795f7ce15362c5798315ecd382e14  Data\Audio\sfx\BananaImpact.wav
95ac21fa0510ee803a7d23707b036e05  Data\Audio\sfx\bathit.wav
c9aca01bb284fdab718ed977a0f1cc81  Data\Audio\sfx\BatSwing.wav
c26117487030a3187bd0b239b0adee09  Data\Audio\sfx\BirdsTweet.wav
98f26570f64d46b5ab9664c4f4ee263a  Data\Audio\sfx\BlowPipeRelease.wav
7959345d435b4d8ddccbcd41f3f9606f  Data\Audio\sfx\bomber.wav
da6f546f532bc1249cafb25172016556  Data\Audio\sfx\BombWhistle.wav
e3931a252299306543bbce6181ee8f69  Data\Audio\sfx\BulletImpact.wav
72f080e11712bda72ceae8e3af08c00b  Data\Audio\sfx\ConcreteDonkey.wav
b978e1bcedf5be7b94b8a05b6ea87d61  Data\Audio\sfx\ConcreteDonkeyImpact.wav
0e5861b8710e28feff07b8a743bcbebe  Data\Audio\sfx\ConcreteDonkeyRelease.wav
b3da04755b5a90cfe4a8fcc51a8a1216  Data\Audio\sfx\CowFall.wav
ba334f0cb7597065fdf8345a043e15e9  Data\Audio\sfx\CowWalk.wav
5b6fcd52e7f36cfc252048fbf2a4adcb  Data\Audio\sfx\CrateImpact.wav
ba577fde057ce5b9c0605a83eb2ff6dd  Data\Audio\sfx\CratePickup.wav
b6395defda2f2a599afe26dc81cf0de1  Data\Audio\sfx\CratePop.wav
e2754812d73624dc5dcd00b6d86b14d7  Data\Audio\sfx\cratespawn.wav
4a1020f66561e39dbb15d683f5f1c587  Data\Audio\sfx\debris1.wav
2ea61b6e4ffddc312454262eb180e1c0  Data\Audio\sfx\debris2.wav
f13cc6d49d749c83128b56d225e3b1c2  Data\Audio\sfx\debris3.wav
f84fc207351f89d1baed31366ff1309c  Data\Audio\sfx\debris4.wav
f0a9f4e81bd82388e05b819da8473cd2  Data\Audio\sfx\DragonPunchImpact.wav
00ed97c3ed2c4e2fbd5faf9221a5cdc7  Data\Audio\sfx\drawaxe.wav
8b37203f55c4aa6001c559d3ac5b78bc  Data\Audio\sfx\drawbat.wav
5722b78229c117f5b18e3f652027a440  Data\Audio\sfx\drawbazooka.wav
5734c136e2f40a55eb2a7276b628d73c  Data\Audio\sfx\drawcow.wav
3c713d1d3f4426590694d14a6848d638  Data\Audio\sfx\DrawEarthquake.wav
175ad9c04cfd30880abe5bd3c83a0864  Data\Audio\sfx\DrawFirePunch.wav
bc1704c9bdd12425091c7bd654e42ae6  Data\Audio\sfx\drawgrenade.wav
797528cb25eae3cf626a539d0fe9e656  Data\Audio\sfx\DrawItem.wav
8f177afe2ad0ba65d5f29ecea473eb1b  Data\Audio\sfx\DrawMiniGun.wav
abf306da614e66e11c22ad3c486321ba  Data\Audio\sfx\DrawNuke.wav
ab13b33a3f142c45edecb95a88d8a45c  Data\Audio\sfx\DrawOldWoman.wav
7e5ce4a05d05ae1d44623ffa7b59c9c3  Data\Audio\sfx\DrawPigeon.wav
b645732bd178f671d8f02b5999cf8f6d  Data\Audio\sfx\DrawRedbull.wav
9634a7ba88ace4ffabd798a5e387dcb5  Data\Audio\sfx\drawsheep.wav
b36cdb66a07806354361fb7dfff98dfa  Data\Audio\sfx\drawshotgun.wav
6fcbe5b4e2c7d718680919d55a88376e  Data\Audio\sfx\drawuzi.wav
ddbe849f0684e585291cc701758bd2b7  Data\Audio\sfx\duff.wav
dc29b54debfe4ab752c33fb5fafa6be2  Data\Audio\sfx\earthquakeloop.wav
299718f315975081e2a70a8a2c02f8df  Data\Audio\sfx\Explosion1.wav
b01ae5087e0e81f5ffc437278deb89be  Data\Audio\sfx\Explosion2.wav
2f90b8d2c310591b098ca48a64794095  Data\Audio\sfx\Explosion3.WAV
d27a6687fc9bc328b52f607f9105ad07  Data\Audio\sfx\FEClick.wav
d8ed64ae3bfc0f2024801f68b1185ba4  Data\Audio\sfx\FEDuff.wav
6cf38121ad90a883d7e9cc18b25b9f09  Data\Audio\sfx\FEInFly.wav
951c8c9538af50432c3a261c3d829d29  Data\Audio\sfx\FEInScale.wav
288daa96e4a10c441a5aac360553cc31  Data\Audio\sfx\FEKeyClick.wav
561751a4b6211e92b3ee8c5d12a8269a  Data\Audio\sfx\FEKeyClickDelete.wav
04cfe787c271b74f235235e89441c3c2  Data\Audio\sfx\FELetterInDrop.wav
7745e5a464258fe8ae6097f92cacfb92  Data\Audio\sfx\FELetterInDrop2.wav
cbee18f9edf3262561d6f288819180d6  Data\Audio\sfx\FELetterInFlip.wav
d9dbadad2a4c5ff0ac885810b6aba8d0  Data\Audio\sfx\FELetterInHard.wav
4cb796b85581850d81679efa11b26c36  Data\Audio\sfx\FELetterInRotate.wav
88f81fd0c04cff2cf9a66713d4e2ead5  Data\Audio\sfx\FELetterOutFly.wav
b5f6f92869758b37912ca4679b6e767a  Data\Audio\sfx\FELetterOutRoll.wav
73dc98ba48a253a0ea7982966f987918  Data\Audio\sfx\FELetterOutRotate.wav
e614c3a94b36e2aa5e50fc2acee0c3e5  Data\Audio\sfx\FEMenuDown.wav
31384dce64e6a10712bbfc493cb5db8d  Data\Audio\sfx\FESliderDown.wav
9844f0fd2bd41b6dc6f1cd7249b282aa  Data\Audio\sfx\FESliderUp.wav
306c29692137e0b808e7468c0b9f689f  Data\Audio\sfx\FETooltipIn1.wav
6de6395a35c399534902ac7964b5e7fd  Data\Audio\sfx\FETooltipIn2.wav
082021378c568ed64376092d386b5645  Data\Audio\sfx\FETooltipIn3.wav
a47831764dd75a9b74a775147e8ffbe1  Data\Audio\sfx\FETooltipOut1.wav
a47831764dd75a9b74a775147e8ffbe1  Data\Audio\sfx\FETooltipOut2.wav
0dc0e9992467edd28a5e7c9f8a62dddc  Data\Audio\sfx\FETooltipOut3.wav
cb5c4ba8fceabb0c27bf103875849bbf  Data\Audio\sfx\FireLoop.wav
ef98a0396c6175a60284b624234fc54d  Data\Audio\sfx\FireNuke.wav
4ccf2eab6abb0201f68f37a2f6b5a504  Data\Audio\sfx\FireScales.wav
9596e12b9d8e02918a2b3c4496110b0c  Data\Audio\sfx\FlipGrenade.wav
ab5fbd74bb63dbc5b9e4b979b5983d25  Data\Audio\sfx\fuse.wav
def4984830633f9ef516e5db0dab832f  Data\Audio\sfx\GasLoop.wav
052d4331bb76d5dae073adc87de22b68  Data\Audio\sfx\GirderMove.wav
89b1110348718c08c5d688c387045edd  Data\Audio\sfx\GirderPlace.wav
e0e9427a95a6b5a42f898f54eb46ca91  Data\Audio\sfx\GRENADEIMPACT.WAV
ab82b6ba9f43e06138b153732bb6a526  Data\Audio\sfx\hitswing.wav
c36ae24cc03bb6fc5cf14f62b012e2e3  Data\Audio\sfx\HOLYGRENADE.WAV
0c0e4f097f0fc772be461bd326f3249a  Data\Audio\sfx\HOLYGRENADEIMPACT.WAV
5edf308d0a1038672f7a31cbbf979cf2  Data\Audio\sfx\JetPackFinish.wav
9489d52af11319d79711764faaa3f014  Data\Audio\sfx\JetPackLoop1.wav
9e3a92ffafd535b5ce45477d755ee205  Data\Audio\sfx\JetPackLoop2.wav
e6b0b95ed2097b6c2aa81754d2dba6a8  Data\Audio\sfx\JetPackStart.wav
081b07769430817cdc6b11bb18f1388c  Data\Audio\sfx\jetsuper.wav
4388e67cc2dae60cd2ee6d5747f00c8b  Data\Audio\sfx\MegaMineImpact.wav
e53104ee8daffaabfee43b5c1404cb79  Data\Audio\sfx\MINEARM.WAV
81bb54ceae2e63369b9abcfecbe82770  Data\Audio\sfx\MineDud.wav
98eec7121d853cf52261f15868f1b458  Data\Audio\sfx\MINETICK.WAV
ee0720e36c51df1f5f857d403572786a  Data\Audio\sfx\MinigunEnd.wav
5a0be1f0ba22ff442b16189d674d7fcb  Data\Audio\sfx\MiniGunFire.wav
7c3dc379b7a3a6f15801bea22fdb2c85  Data\Audio\sfx\Minigunstart.wav
0fefc8c58c766285b09e15c4743ff7b1  Data\Audio\sfx\Missile.wav
d95d9117c8f1c3ff9e3c8d259b47e359  Data\Audio\sfx\NinjaRopeFire.wav
d8f2bb36a04c236b96f6811d5ccf11f3  Data\Audio\sfx\NinjaRopeImpact.wav
376f15395db03a01642211173d237227  Data\Audio\sfx\oildrumexplosion.wav
208612e702d18f26e8174a508ecc6db0  Data\Audio\sfx\OldWoman.wav
9e522719775e028322e11559324b006a  Data\Audio\sfx\PetrolBombImpact.wav
bd1fa7dbd6e153f11ba439f954d3e4c3  Data\Audio\sfx\PigeonFlying.wav
55cd5366567857e85bd9a3d79c919a9f  Data\Audio\sfx\PigeonImpact.wav
4cc21fc2d838747f41d553b794449c52  Data\Audio\sfx\PigeonRelease.wav
f08f412538788228c5eb9593efd22581  Data\Audio\sfx\RainLoop.wav
1796646dca47d8633ee5b28dc72cef8f  Data\Audio\sfx\Recover.wav
11cf44eb4ced660569e3747f631112cc  Data\Audio\sfx\RedbullRelease.wav
597afcae27e6df924bc7240e262bb340  Data\Audio\sfx\ROCKETPOWERUP.WAV
74213234edd704aa3d991e1224d3232c  Data\Audio\sfx\ROCKETRELEASE.WAV
8cc596dc62ee23f2125acdc54a32ccbe  Data\Audio\sfx\SHEEPBAA.WAV
5eb55c6ef8d8858d5f82f9be0f64b7e4  Data\Audio\sfx\SheepJump.wav
17aed5d666194ec9d8dd5aa8eeb8175e  Data\Audio\sfx\ShotGunFire.wav
2e749f8af220d303a2cbf14a494effc7  Data\Audio\sfx\SHOTGUNRELOAD.WAV
5b2fc31abb60b86941a6d3dccb84cef4  Data\Audio\sfx\Splash.wav
12afc2eb93fc8296c8eb25da2c93d8d0  Data\Audio\sfx\Splish.wav
b287a07bd6276894e3a27fec1fff7df3  Data\Audio\sfx\StickyBombImpact.wav
b787f18e10faf75094da0060f1e87516  Data\Audio\sfx\SuicideDraw.wav
b22edfe508a9d3205f6fca547afb86ce  Data\Audio\sfx\SUPERSHEEPRELEASE.WAV
149af687d5648efb3752578ef1b94714  Data\Audio\sfx\SUPERSHEEPWHOOSH.WAV
067a8930400b6b4d7e43335774cb987c  Data\Audio\sfx\TargetHit.wav
a48de17eda2f316f19c6b446768475b9  Data\Audio\sfx\telephone.wav
ec260fdd90390611d012765c84a4f970  Data\Audio\sfx\Teleport.wav
4682705d52ecf3779a7ee4c6106cece7  Data\Audio\sfx\Throw.wav
12345486cd84ce37f2d87c708f92080f  Data\Audio\sfx\TIMERTICK.wav
6089ed4d1ec065865013f2a3b92c42ca  Data\Audio\sfx\UziEnd.wav
649f6a028744ee88604344793635c75e  Data\Audio\sfx\UZIFIRE.WAV
262cceaabf80755ea75139a9f16b736c  Data\Audio\sfx\Walk.wav
dd92b96f5cdbbbb13f8e3580197e22f8  Data\Audio\sfx\WEAPONHOMING.wav
6027ec57f2d17a1efd727917a2ec446d  Data\Audio\sfx\winloop.wav
6a201bfcfe33de6c591b9b3d9bfff397  Data\Audio\sfx\WormExplode.wav
668aa45339fcb0cca68f9d510f9f201e  Data\Audio\sfx\wormknocked1.wav
94db20ad856f8c106d1f09a9e9aba97d  Data\Audio\sfx\wormknocked2.wav
92075cc7274ee5f2036db325a2da535b  Data\Audio\sfx\wormknocked3.wav
8339906d95dacb74d83aea508108766d  Data\Audio\sfx\wormknocked4.wav
cc862bbe103f9e81983c7cd64623e3a5  Data\Audio\sfx\wormlandback.wav
9efaf7b86d0c6ddd988d64f8bf03ff5f  Data\Audio\sfx\wormlandflip.wav
98ec15e2bf9779ec787b3103aca6e0aa  Data\Audio\sfx\wormlandfront.wav
881f2e62854df1d2d048aaf7eb809bbb  Data\Audio\sfx\wormlandup.wav
60ce1b77672665b64e31b961864c0ad7  Data\Audio\sfx\Wormpot_button.wav
46470921bdd77184e5a3e433477a00d3  Data\Audio\sfx\Wormpot_handle_pull.wav
92cf613357a29e0e7af7026c78e504ba  Data\Audio\sfx\Wormpot_intro.wav
d49cdc668bc6cc34752e6f84bb4ff2b7  Data\Audio\sfx\Wormpot_nudge.wav
8a4f353e9542ac87bc836371e248cd0c  Data\Audio\sfx\Wormpot_outro.wav
6cdc7bd52c4f75b587a2b2097569f39a  Data\Audio\sfx\Wormpot_spin_loop.wav
522cb9cd7289897759673f0bc3fe84ed  Data\Audio\sfx\Wormpot_spin_start.wav
65c7d060ba1c6a571f4d298d2cd32691  Data\Audio\sfx\Wormpot_spin_stop.wav
a309f69e93be419c2956acb21889c64a  Data\Audio\sfx\WORMSPRING.wav
fd3f72c6b1a7914aa82e7960f8f09bbd  Data\Audio\speech\Alien\amazing.wav
b902cff79bd212eb40b94bb6f2698207  Data\Audio\speech\Alien\angry.wav
4e03d6e18ce0a21d5900a3abb822228e  Data\Audio\speech\Alien\angry2.wav
307f77e794efb39e3c9244c4bbd97fad  Data\Audio\speech\Alien\boring.wav
bb1236d9eedc909f39fe563f7bc99b19  Data\Audio\speech\Alien\brilliant.wav
dcec64cdf5013dbb9f852990a3e67c0e  Data\Audio\speech\Alien\bummer.wav
9fd9912845fa7cd48897d5b8d6e1600c  Data\Audio\speech\Alien\byebye.wav
15c6d81f328e54587e42ea353b2b85d5  Data\Audio\speech\Alien\collect.wav
6114ed5e97d4b59a662733854228ab49  Data\Audio\speech\Alien\comeonthen.wav
50f72cd1e653493746cf44f9f8cab49f  Data\Audio\speech\Alien\coward.wav
bcafd2bff0f13a7be44b4c5d50bf2a6a  Data\Audio\speech\Alien\dragonpunch.wav
cdbd7239b7e685bdd6baa5c68a29cb0c  Data\Audio\speech\Alien\drop.wav
bb56b91c70481ea515b8c4f62b9377ec  Data\Audio\speech\Alien\excellent.wav
81d2e57129e32344ef1f0b2c0ad720ab  Data\Audio\speech\Alien\fatality.wav
eb4f85dfc5de1cdf3cb77d8873e76737  Data\Audio\speech\Alien\fire.wav
a062daa490d7589feba4b8269d9ae8e6  Data\Audio\speech\Alien\fireball.wav
c91d44ae19833e7f80045acae7b228e4  Data\Audio\speech\Alien\firstblood.wav
d95f4a4489463e00f438644241591574  Data\Audio\speech\Alien\flawless.wav
45b5e93b1ef6eb66b87d95ad97720ef3  Data\Audio\speech\Alien\goaway.wav
c709253ccc457604465ab0e2f2559cfb  Data\Audio\speech\Alien\grenade.wav
5316d2376b80c5a617fbb3ba83a55770  Data\Audio\speech\Alien\happy2.wav
e44bfe2907f5186a99f8147328f73fba  Data\Audio\speech\Alien\happy3.wav
c262ca90bdce1b118a63d61ed687977d  Data\Audio\speech\Alien\hello.wav
1820df87693931d6a72b6ec63008b15a  Data\Audio\speech\Alien\hurry.wav
22972819b566698980b1f738def58ded  Data\Audio\speech\Alien\idle1.wav
45b64d34d221da33731bc4b86d85b406  Data\Audio\speech\Alien\idle2.wav
2aea6dc511a6add9b61867e0c78971e0  Data\Audio\speech\Alien\idle4.wav
bbf0ef116d0d7b898b4d6ef3cdf31398  Data\Audio\speech\Alien\illgetyou.wav
36a4bf9ff47460ef055c569ea4430a76  Data\Audio\speech\Alien\incoming.wav
f9830bce664644d767eee96d7d48687f  Data\Audio\speech\Alien\jump1.wav
7f4ea96d9d72ec5c90e598b5c8b2e81b  Data\Audio\speech\Alien\jump2.wav
d3d0ae4890795e4431c326132cb8c4cc  Data\Audio\speech\Alien\justyouwait.wav
0ae0810e40d2271a79ccb16e91c85911  Data\Audio\speech\Alien\kamikaze.wav
8269841eca5fcbf298f581c3d0c80b1d  Data\Audio\speech\Alien\laugh.wav
3c45710bd14262814428ddb142a5b545  Data\Audio\speech\Alien\leavemealone.wav
df66eb485b00d59df78bc13167bbcc0b  Data\Audio\speech\Alien\loseloop.wav
f434746e000647722d8740d513984fcf  Data\Audio\speech\Alien\missed.wav
dc1bc80b936fb67f9e15994d72a48ee6  Data\Audio\speech\Alien\no.wav
30951328e7f0e1c37edfdafd2603706b  Data\Audio\speech\Alien\ohdear.wav
f662d4547341f39ba74fcf20f722bf6f  Data\Audio\speech\Alien\oinutter.wav
22997d73dd4b9f7b462d2472040401ad  Data\Audio\speech\Alien\oof1.wav
07bf558d584728253730b96f978bc6af  Data\Audio\speech\Alien\oof2.wav
15784ceff39ea6b27ae0d877c7f0e944  Data\Audio\speech\Alien\oops.wav
5e8801dfb9d73113f2638d27c2b733e3  Data\Audio\speech\Alien\orders.wav
04fd3a9588235754949133f83a837445  Data\Audio\speech\Alien\ouch.wav
355e7680f934fd198f9024445d63798e  Data\Audio\speech\Alien\ow1.wav
17eaf2d5a7bed1392175466c7bbc2db0  Data\Audio\speech\Alien\ow2.wav
d2cf1b2396a62082795f81374c7518c4  Data\Audio\speech\Alien\perfect.wav
a65d0f2957a9eb5177ffa378e8ab5a7f  Data\Audio\speech\Alien\pray.wav
fe2f6edf011031ee67e819b6324c5f12  Data\Audio\speech\Alien\relief.wav
94647dac3e6df89aca88fce816a2d67a  Data\Audio\speech\Alien\revenge.wav
61e62d0485f71d0732114c5e8a435e65  Data\Audio\speech\Alien\runaway.wav
a9f2b91edb78a00fd43285e665e4000e  Data\Audio\speech\Alien\sad1.wav
7fb87d180dc65fc1e7ac6df1e6ea1b47  Data\Audio\speech\Alien\sad2.wav
0b6edb9979f850d9e8127be4b2c4da6b  Data\Audio\speech\Alien\scared1.wav
f8f49e352aa648191ac58c05ac5e6055  Data\Audio\speech\Alien\scared2.wav
51dee925e92521379f279061a385bfdd  Data\Audio\speech\Alien\stupid.wav
c3220db81858c157475f16e75be38125  Data\Audio\speech\Alien\takecover.wav
e866a7cf62774a10c5e2c218b8fef5d8  Data\Audio\speech\Alien\taunt1.wav
c8e8ad49f563fcb5dc6e951c18bfd43f  Data\Audio\speech\Alien\traitor.wav
42c4d71cdd942b645039ad4a3c9f082b  Data\Audio\speech\Alien\uhoh.wav
8cec1f90a17d755d0f37455ef81b5db4  Data\Audio\speech\Alien\victory.wav
dc56794ee542ad23bcda8ac80e257982  Data\Audio\speech\Alien\watchthis.wav
05a296e461e9f36eb08b39a7dcc1df40  Data\Audio\speech\Alien\whatthe.wav
c52d15f21179789b188127ce38099874  Data\Audio\speech\Alien\yessir.wav
b8f7a31057211220e9677a92865893ad  Data\Audio\speech\Alien\youllregretthat.wav
20eddfa62c45e1708b664e44e54e9934  Data\Audio\speech\American Wrestler\amazing.wav
d9ffcaa22d0d38294f7ca95a443c5495  Data\Audio\speech\American Wrestler\angry.wav
6e82e060043a23090ae7fdb93fa19f1a  Data\Audio\speech\American Wrestler\angry2.wav
a62581f21c066a7642cb869c5ff35823  Data\Audio\speech\American Wrestler\boring.wav
dcae17c09d1348af2e0ff368c5f34cd5  Data\Audio\speech\American Wrestler\brilliant.wav
9599cbcb25e5a93c7ca48a4583d740ae  Data\Audio\speech\American Wrestler\bummer.wav
4f6d013d5e245675622f252cbe0ba896  Data\Audio\speech\American Wrestler\byebye.wav
f88839b56311ca5d4377b0cf00a1c7fa  Data\Audio\speech\American Wrestler\collect.wav
47d00acb0d0d7207b80bd872f939f48c  Data\Audio\speech\American Wrestler\comeonthen.wav
4652ee19bf8a206adab7d2f095b9d849  Data\Audio\speech\American Wrestler\coward.wav
4a1de3d89f9539c0c97157edee7e143b  Data\Audio\speech\American Wrestler\dragonpunch.wav
db2b6e79e909a98711a45baadaae629a  Data\Audio\speech\American Wrestler\drop.wav
b9c9b3299d2c4db79123cd848c58b251  Data\Audio\speech\American Wrestler\excellent.wav
cc490c078e641ad37b37ed446034cc01  Data\Audio\speech\American Wrestler\fatality.wav
945dc7df09c9cd19df043af26c485829  Data\Audio\speech\American Wrestler\fire.wav
5989187fd088dde790dfa0d7903bd0bf  Data\Audio\speech\American Wrestler\fireball.wav
b6b448be6576afdd05df7e074b3062d9  Data\Audio\speech\American Wrestler\firstblood.wav
48dc703d0c3500011351e7d3dadccda2  Data\Audio\speech\American Wrestler\flawless.wav
9c00b511b4e1965ebadee3276b1b885d  Data\Audio\speech\American Wrestler\goaway.wav
cab2fcbe9112194c69b06d48c2fd4f11  Data\Audio\speech\American Wrestler\grenade.wav
9bba9b35d6da1b7ebbd97188aef1a104  Data\Audio\speech\American Wrestler\happy2.wav
eb65526bb11a3f97cc9bbb3b856d7e7f  Data\Audio\speech\American Wrestler\happy3.wav
2e37322ca09fb3bc519fadad9f7250ba  Data\Audio\speech\American Wrestler\hello.wav
235116750e63ae4f04c66640ec82940d  Data\Audio\speech\American Wrestler\hurry.wav
35e4fea19a19e4222df6d69b72f3d784  Data\Audio\speech\American Wrestler\idle1.wav
8eddc504fea380de07ac6c32bfab66f8  Data\Audio\speech\American Wrestler\idle2.wav
b606dd6ce51af0670ae8f9b733da9bff  Data\Audio\speech\American Wrestler\idle4.wav
d617de99f1032d04533c5860f7944321  Data\Audio\speech\American Wrestler\illgetyou.wav
497923bf1cef70cd32fe0766e3ed3215  Data\Audio\speech\American Wrestler\incoming.wav
0fb74c4c2fa65f8076c17cbc11bac700  Data\Audio\speech\American Wrestler\jump1.wav
379f4f993886695a7825ebedc2fae6f1  Data\Audio\speech\American Wrestler\jump2.wav
6f2dc531bd80c89d1b1b7062c9751b9a  Data\Audio\speech\American Wrestler\justyouwait.wav
070d4de9f9451f20051a37fb98eb38d9  Data\Audio\speech\American Wrestler\kamikaze.wav
f3e641f47de6c368f339ceabf18c09c5  Data\Audio\speech\American Wrestler\laugh.wav
925e0aab1be3a1b6e00a37e3cc4e68b5  Data\Audio\speech\American Wrestler\leavemealone.wav
5d68d9270b8a761b88ea4267f50511e2  Data\Audio\speech\American Wrestler\loseloop.wav
575f883cbbebe6c0b95a623f9b5f75cf  Data\Audio\speech\American Wrestler\missed.wav
100b3e368b6b605ac5b65f7638af08cb  Data\Audio\speech\American Wrestler\no.wav
a8dd80b447e6ed8897405b9c67f8623f  Data\Audio\speech\American Wrestler\ohdear.wav
0bacf8ba55645129f601bd415fd38715  Data\Audio\speech\American Wrestler\oinutter.wav
dee6718a0c9d1e3bf5b72c39f8bac519  Data\Audio\speech\American Wrestler\oof1.wav
eaff7b37ab2ee6d25d707b853b10f166  Data\Audio\speech\American Wrestler\oof2.wav
a2b2f482943a706bec6ca3b9da1e787a  Data\Audio\speech\American Wrestler\oops.wav
5b8fedbe254480827a36a9d8e3a77ff3  Data\Audio\speech\American Wrestler\orders.wav
c28317b4698b26c06790430de51172ea  Data\Audio\speech\American Wrestler\ouch.wav
788a60786567cc20c6aa33ab0f2fec42  Data\Audio\speech\American Wrestler\ow1.wav
b9d64c13c445b6357ba291ab9a65bb7d  Data\Audio\speech\American Wrestler\ow2.wav
4a9e1f5452644a50013645c6a63e7a9b  Data\Audio\speech\American Wrestler\perfect.wav
e6d0d22dbc720915ffba97e532f0934b  Data\Audio\speech\American Wrestler\pray.wav
240a0ae518378ad18e970bd76d822b15  Data\Audio\speech\American Wrestler\relief.wav
df56b87e31868ac9a8e05ee21e56791f  Data\Audio\speech\American Wrestler\revenge.wav
2292cd28a5e43d03d24784ec95ba1b7e  Data\Audio\speech\American Wrestler\runaway.wav
6339c70c4236244cb6fdc1485ac6b83a  Data\Audio\speech\American Wrestler\sad1.wav
d7def00d8026b0c10ced88ae532aaee3  Data\Audio\speech\American Wrestler\sad2.wav
a66859965a1ebd228f69c254b7765bfb  Data\Audio\speech\American Wrestler\scared1.wav
ed17c0d80c0e1711d8425e083224f8c0  Data\Audio\speech\American Wrestler\scared2.wav
c20f3339d9382d786e706335919e735b  Data\Audio\speech\American Wrestler\stupid.wav
c0ea6d6c1e745a869de555e8d7616885  Data\Audio\speech\American Wrestler\takecover.wav
bf7281cd4ffb674aab8a31601cc3e7d7  Data\Audio\speech\American Wrestler\taunt1.wav
c001d047de480b23c84402446e6caffb  Data\Audio\speech\American Wrestler\traitor.wav
86089fb1e50938e4b8d79ea431147c7a  Data\Audio\speech\American Wrestler\uhoh.wav
3d58486591ec90bc9fbd9dc8acaccedb  Data\Audio\speech\American Wrestler\victory.wav
2595aa515b5acbc0c4c090502befac95  Data\Audio\speech\American Wrestler\watchthis.wav
7256f17608c3e0aa991d5c3f90feae7d  Data\Audio\speech\American Wrestler\whatthe.wav
274b39d86d28479c32f5c4d8d2848d4d  Data\Audio\speech\American Wrestler\yessir.wav
7e2cf32fbb978c2e7fd234ff9ce6c58c  Data\Audio\speech\American Wrestler\youllregretthat.wav
4258e0213c31149315577735d9b1d2cf  Data\Audio\speech\Biggles\amazing.wav
59b0807f359061f1c7fc8865713562f5  Data\Audio\speech\Biggles\angry.wav
99badc9cfc89b53498e6134e752f148e  Data\Audio\speech\Biggles\angry2.wav
378bde2095072afdd0392b4c7534adae  Data\Audio\speech\Biggles\boring.wav
48be5502bcdf4c72d4ee8a79a29e79d2  Data\Audio\speech\Biggles\brilliant.wav
11074e258357522d332a366d8e82da80  Data\Audio\speech\Biggles\bummer.wav
3681bd9e8d0bb98a87592548153419f5  Data\Audio\speech\Biggles\byebye.wav
37acc5bc298b58430eabe223072ac283  Data\Audio\speech\Biggles\collect.wav
f4a4ebca3e84bee41a8c3567e7d428ff  Data\Audio\speech\Biggles\comeonthen.wav
d42f9e86d3b6f89e74073f92c539314d  Data\Audio\speech\Biggles\coward.wav
7f2e194cd26255abdc95f14de2ce3ce8  Data\Audio\speech\Biggles\dragonpunch.wav
c29d84c745347125a9ac5453e97a3115  Data\Audio\speech\Biggles\drop.wav
058f6928c210985c57380c5f77714a72  Data\Audio\speech\Biggles\excellent.wav
5069d5875fe54400d45f7145557d7506  Data\Audio\speech\Biggles\fatality.wav
77f55512fa7d2ff325e0958cfa08c0b1  Data\Audio\speech\Biggles\fire.wav
328625a36a9c17300a86a3a2bf8f2568  Data\Audio\speech\Biggles\fireball.wav
30c3030a89d764db035ccede4639492a  Data\Audio\speech\Biggles\firstblood.wav
33c0f52b04c84b4c476c8d18650b54f9  Data\Audio\speech\Biggles\flawless.wav
03edbf6585e2af01e9c42055258201b6  Data\Audio\speech\Biggles\goaway.wav
5b14060a0926f948958f60cc98f14c47  Data\Audio\speech\Biggles\grenade.wav
db75e4392476da21cd7c91b3ad95b0bf  Data\Audio\speech\Biggles\happy2.wav
ac457bf58b03a05dc9347379e511c20b  Data\Audio\speech\Biggles\happy3.wav
370d66c2f4390213a935f947e2abfb08  Data\Audio\speech\Biggles\hello.wav
38d37e64df22caca9e458a73f6e6d4f0  Data\Audio\speech\Biggles\hurry.wav
fc68e4e6e8d86ad6941e69fc7b073590  Data\Audio\speech\Biggles\idle1.wav
e3230503a6ca108a515193798a969216  Data\Audio\speech\Biggles\idle2.wav
65e543e629f82223021c1c7a625ff748  Data\Audio\speech\Biggles\idle4.wav
9732df30f3019c399a1f8c49961114c4  Data\Audio\speech\Biggles\illgetyou.wav
6a2925dbcf034933bdd6e1d6ba3ce6d9  Data\Audio\speech\Biggles\incoming.wav
1f945bcb7e38ba4451e784e073326ce6  Data\Audio\speech\Biggles\jump1.wav
598f0cbcd66df013d79616791574ca6f  Data\Audio\speech\Biggles\jump2.wav
23cbee890a7fa0d2d90458e5993a7021  Data\Audio\speech\Biggles\justyouwait.wav
eb2ac2a7d2888e92cacb37e93128c4bf  Data\Audio\speech\Biggles\kamikaze.wav
9c1620d568519f161bba6bfac21473ac  Data\Audio\speech\Biggles\laugh.wav
af8afea607056c0485465d372d716ca2  Data\Audio\speech\Biggles\leavemealone.wav
927f6a783c139b8a648db0afdf3ab444  Data\Audio\speech\Biggles\loseloop.wav
99838aafab9870d739bea5c20702b6d1  Data\Audio\speech\Biggles\missed.wav
b14bb80dc97acb64d8f20e2e8f139ab0  Data\Audio\speech\Biggles\no.wav
1bba1ade6bc494ad70991e50a044ebbf  Data\Audio\speech\Biggles\ohdear.wav
0c2490c8e4cb2627a061b2c004744fdf  Data\Audio\speech\Biggles\oinutter.wav
6e9b63b158d45225e6fcbf4bddda562e  Data\Audio\speech\Biggles\oof1.wav
f811263e74099aa0f6e8c0b2d12e005e  Data\Audio\speech\Biggles\oof2.wav
1a6b41197941621898fd331836d3d449  Data\Audio\speech\Biggles\oops.wav
974714fb5a85f69310fad614f1bb9ebf  Data\Audio\speech\Biggles\orders.wav
0cf9d7b5ae3dd378fd6c0070d66741fa  Data\Audio\speech\Biggles\ouch.wav
5b46b68d4c4f0ec1bc135893274c2eae  Data\Audio\speech\Biggles\ow1.wav
4147c7396b3b3940f471bdb6dce33972  Data\Audio\speech\Biggles\ow2.wav
1865e6f99137605be4944796abe9babf  Data\Audio\speech\Biggles\perfect.wav
c739a8ff925d7faa3addfbc25123606a  Data\Audio\speech\Biggles\pray.wav
469294611d616f77071d1e609c421898  Data\Audio\speech\Biggles\relief.wav
0197a9b2c8dd1d7a8cd3c16f43693375  Data\Audio\speech\Biggles\revenge.wav
0710e01443fe83e4c4c867f319e45322  Data\Audio\speech\Biggles\runaway.wav
107f6f2835e6e8cb7e878c32df6c973c  Data\Audio\speech\Biggles\sad1.wav
8b421697c9424fb4c0eba22e46a509cb  Data\Audio\speech\Biggles\sad2.wav
983a40a14b3cfb6334683f078150fcbb  Data\Audio\speech\Biggles\scared1.wav
12ae75706596b8320fa1904b4b9f1623  Data\Audio\speech\Biggles\scared2.wav
8e7a9b6d2f81aac52782fa1fb2af2614  Data\Audio\speech\Biggles\stupid.wav
217742b1fb772c75c37c88ba48dfdcfe  Data\Audio\speech\Biggles\takecover.wav
b9a16da2460b4fc93af630c0dc643e71  Data\Audio\speech\Biggles\taunt1.wav
bdd064485f8e55ce01e8b55a47b0f2ce  Data\Audio\speech\Biggles\traitor.wav
b7914cd6ef0e5d1aced33a740dc62248  Data\Audio\speech\Biggles\uhoh.wav
7a3651111dc32f12b0a88279af4e130b  Data\Audio\speech\Biggles\victory.wav
1dce6d73031bc4bd54dfef18fdf300e2  Data\Audio\speech\Biggles\watchthis.wav
e5ec7aa681f1e106901735fb18244d6c  Data\Audio\speech\Biggles\whatthe.wav
6be11f990fdb1fb157a181180173864a  Data\Audio\speech\Biggles\yessir.wav
c4cbc4032dcfb3f2181e7cde4a3d9649  Data\Audio\speech\Biggles\youllregretthat.wav
e4179310737c9473409f8ae22c44b29d  Data\Audio\speech\Blues Man\amazing.wav
8a100e0cb2ae47dae3152ff674a29d09  Data\Audio\speech\Blues Man\angry.wav
ed52e2cf2c392226455ee23709401cc4  Data\Audio\speech\Blues Man\angry2.wav
32a5a84f561986789b3e5667b244421c  Data\Audio\speech\Blues Man\boring.wav
c86dd649fc76d770fd06f0be85c8cf7d  Data\Audio\speech\Blues Man\brilliant.wav
b66b37bdca171a7ccbfc3bfd8b4fda59  Data\Audio\speech\Blues Man\bummer.wav
a186975d845720b9f18396a6529a2610  Data\Audio\speech\Blues Man\byebye.wav
f862878ad100ec9516d74f4ee8b9b8f5  Data\Audio\speech\Blues Man\collect.wav
5c492589b043123c1eda8355a5cff3e2  Data\Audio\speech\Blues Man\comeonthen.wav
b86a4e4bf08d26753e5d6ff60666b173  Data\Audio\speech\Blues Man\coward.wav
1f59dd7bfbbcbed3c85042344fb88618  Data\Audio\speech\Blues Man\dragonpunch.wav
0a36f4d0cc94ba7fc653365a9e12cbbc  Data\Audio\speech\Blues Man\drop.wav
c1a148aa3e4ea806f23121057a91f65d  Data\Audio\speech\Blues Man\excellent.wav
e3173117e1fac27381006ea1680ccf07  Data\Audio\speech\Blues Man\fatality.wav
4d1142e64b708d9fe94a2af5ee551015  Data\Audio\speech\Blues Man\fire.wav
e419da5e62629eca63fdf74ad288bbc8  Data\Audio\speech\Blues Man\fireball.wav
61fa5f9a591b54a3500c5d3fbe1f5353  Data\Audio\speech\Blues Man\firstblood.wav
5b74cec95617fb1c5ce590919f4d7e74  Data\Audio\speech\Blues Man\flawless.wav
37e2f19e89e8f08ac0ba3daf845cd924  Data\Audio\speech\Blues Man\goaway.wav
dca7a6acd3fb1927b504d667bc9aa32b  Data\Audio\speech\Blues Man\grenade.wav
e4301faefb05738e2cb74130372cefc3  Data\Audio\speech\Blues Man\happy2.wav
4476b4f5eba4694dadc1a885fd6bbfc4  Data\Audio\speech\Blues Man\happy3.wav
24c91eee13cb170241702f61c3bf9ca0  Data\Audio\speech\Blues Man\hello.wav
be1106a27feeb586ee9fb05f92618ac7  Data\Audio\speech\Blues Man\hurry.wav
d80478816937f16d5d20aca70607494c  Data\Audio\speech\Blues Man\idle1.wav
9b6f8b0d17614b43f88eae91ce0771a5  Data\Audio\speech\Blues Man\idle2.wav
4e9f2ea6b5f40ebd5b360a335f93269e  Data\Audio\speech\Blues Man\idle4.wav
8dc1d72b33e725015a03e4a34c60e927  Data\Audio\speech\Blues Man\illgetyou.wav
d358367e7a76b1f131cafd36d4bc8f76  Data\Audio\speech\Blues Man\incoming.wav
98f9708171427e9ba8ad6025a5b6b32a  Data\Audio\speech\Blues Man\jump1.wav
fd31c9d2266b249e5a821094c5bbcd48  Data\Audio\speech\Blues Man\jump2.wav
bdd3ce39534db40b7f3c2c6cb5bcedec  Data\Audio\speech\Blues Man\justyouwait.wav
ac4faac3e8eaf994a4ffb2f7dc274f90  Data\Audio\speech\Blues Man\kamikaze.wav
2ceee1a313752dd8f8af524b546fd962  Data\Audio\speech\Blues Man\laugh.wav
1002ddd3837ecba5b42ebc5f269ba750  Data\Audio\speech\Blues Man\leavemealone.wav
021b220ab41d144be7ea4c9607e7fa7c  Data\Audio\speech\Blues Man\loseloop.wav
31a868be5377a83e45913923f847ed44  Data\Audio\speech\Blues Man\missed.wav
f6d076aed1d948f49caecb93639ea993  Data\Audio\speech\Blues Man\no.wav
1f958ac356345037d2a8cb8d0ba69b0a  Data\Audio\speech\Blues Man\ohdear.wav
9af693ca69a47de9c264f67a4fce4284  Data\Audio\speech\Blues Man\oinutter.wav
e724a685ba0f88ab3cf867dbed66f178  Data\Audio\speech\Blues Man\oof1.wav
a0c753970e4a66f93ac7d3e898a307e6  Data\Audio\speech\Blues Man\oof2.wav
0bf2f1fae2b02082bae8175bed1efbb0  Data\Audio\speech\Blues Man\oops.wav
a43342af7ed5a07407583fc1ead427dc  Data\Audio\speech\Blues Man\orders.wav
a48e93907767b02e356f6fb9b878b930  Data\Audio\speech\Blues Man\ouch.wav
a7082b7617680eb3302c51ebaeacdc8b  Data\Audio\speech\Blues Man\ow1.wav
3657d9359980fe894f6b109fa9e1c046  Data\Audio\speech\Blues Man\ow2.wav
d7a6b4508741fb1eb757f9ff9500b675  Data\Audio\speech\Blues Man\perfect.wav
cc07cf7e27391271b1d787ed25a61ae6  Data\Audio\speech\Blues Man\pray.wav
90dc7c5ead1d9d9cf454b4e300d87768  Data\Audio\speech\Blues Man\relief.wav
b1e0063f6ed0480ece21be21d8f32ac0  Data\Audio\speech\Blues Man\revenge.wav
b8e2f19a25a11d3292069a00c0449871  Data\Audio\speech\Blues Man\runaway.wav
68ca5314ae6d8f68d8776e332d94a7ff  Data\Audio\speech\Blues Man\sad1.wav
2cd8ed93443f806a718fa537e5cdfcf8  Data\Audio\speech\Blues Man\sad2.wav
6bda04bee40fcdb74e170bda02fc4da3  Data\Audio\speech\Blues Man\scared1.wav
8a0dc4ae1c0c2efed22100b6b241ddee  Data\Audio\speech\Blues Man\scared2.wav
d8eb189a10e814be89f43c8b9d011062  Data\Audio\speech\Blues Man\stupid.wav
5903f0a6e436a46fff2e536d3bb7650d  Data\Audio\speech\Blues Man\takecover.wav
1ae9e664989821f5862a090613ce3a9a  Data\Audio\speech\Blues Man\taunt1.wav
dcc6be733a14e5086ffeed3d87b4d004  Data\Audio\speech\Blues Man\traitor.wav
d2b78b6eb353d56858197997bf9c5c94  Data\Audio\speech\Blues Man\uhoh.wav
b8cd95fa5fdc9e75fbc5f800dc98a0bd  Data\Audio\speech\Blues Man\victory.wav
033271baf8f586b0e928b5c1a5864520  Data\Audio\speech\Blues Man\watchthis.wav
7cff679af40289dac067719e46a1f933  Data\Audio\speech\Blues Man\whatthe.wav
865a32f70a5812adb98acde264492713  Data\Audio\speech\Blues Man\yessir.wav
49a7fca7150471cf9c211c3bf32d3165  Data\Audio\speech\Blues Man\youllregretthat.wav
084b62bdd43ad970f3e4b2f3b3aac350  Data\Audio\speech\Capone\amazing.wav
9d8635341f365ec1b263fd61592d146e  Data\Audio\speech\Capone\angry.wav
0d03196aba806ffa66187db9fe4a277f  Data\Audio\speech\Capone\angry2.wav
41d27e33b09556171c59d6a3daabbf6d  Data\Audio\speech\Capone\boring.wav
ff39548da5e868b7853791354495e887  Data\Audio\speech\Capone\brilliant.wav
ddd03d88bb6a063b0347504bd957a9f4  Data\Audio\speech\Capone\bummer.wav
0c7e971cecf273510beccfd585560b2c  Data\Audio\speech\Capone\byebye.wav
41d506c51ae4d7a9769de37818f41f83  Data\Audio\speech\Capone\collect.wav
8525246bb0d4d4751b7e574333558c21  Data\Audio\speech\Capone\comeonthen.wav
a29a0a688c785b7bffb60d4ae56bd3a6  Data\Audio\speech\Capone\coward.wav
54d42ede75bc667f77fcc8edaa966889  Data\Audio\speech\Capone\dragonpunch.wav
2a013b782104e83b89b1bbf2b2677e6f  Data\Audio\speech\Capone\drop.wav
c7ecd487829388703ad670337aea68dd  Data\Audio\speech\Capone\excellent.wav
10e85a0c41fe1eb9515d42a52a82007b  Data\Audio\speech\Capone\fatality.wav
b60b77ca158e32fa6f117d685aa21213  Data\Audio\speech\Capone\fire.wav
d59b6be53b3961ad246060607f0666eb  Data\Audio\speech\Capone\fireball.wav
f0af34a4871581b28eef8c59729983ab  Data\Audio\speech\Capone\firstblood.wav
72672091979ce75e095f8f50d8885feb  Data\Audio\speech\Capone\flawless.wav
58d6ddbf45bdaa4372d766ceac49f464  Data\Audio\speech\Capone\goaway.wav
bd6affb23517599ba3bd567ae3813374  Data\Audio\speech\Capone\grenade.wav
ac31599c019bd502b176e6461006a816  Data\Audio\speech\Capone\happy2.wav
4efa416c4c66314c9b6a87ebce5098fc  Data\Audio\speech\Capone\happy3.wav
da3e1f53990588fd36099dd934e6aec5  Data\Audio\speech\Capone\hello.wav
93f1bf470dc8b5b504515cc79cd89162  Data\Audio\speech\Capone\hurry.wav
9ef74c564aebba3440130391a3809dab  Data\Audio\speech\Capone\idle1.wav
101679d49a91017ada52d61d14040f0f  Data\Audio\speech\Capone\idle2.wav
bbd3b5a487e3c665dcb1e79207ac6b30  Data\Audio\speech\Capone\idle4.wav
5c82fab0252f7ec02a6379957d3d0de4  Data\Audio\speech\Capone\illgetyou.wav
40740afd2af8d2c3341acdc61192e377  Data\Audio\speech\Capone\incoming.wav
533bd7fc81a4e28c0b2204c64d8cc22b  Data\Audio\speech\Capone\jump1.wav
0b472be4c988d671edd8fc971b0212bb  Data\Audio\speech\Capone\jump2.wav
2b6eb1119d22ed21715a8d0d992759b1  Data\Audio\speech\Capone\justyouwait.wav
dc4268021d98275100c1d4aa00dfbd46  Data\Audio\speech\Capone\kamikaze.wav
77c9ee0a9bd2adce94813f3c8180b62c  Data\Audio\speech\Capone\laugh.wav
9bb7eeeb0255ce33e84a184be847af68  Data\Audio\speech\Capone\leavemealone.wav
d0a683ae7fc6c324da21617e372f151e  Data\Audio\speech\Capone\loseloop.wav
9b0c9bf3a158755daf892b4c069f222d  Data\Audio\speech\Capone\missed.wav
ef5415293992dfd5717c98f7079b3f3c  Data\Audio\speech\Capone\no.wav
d9901cbc464de3e044c00352b4c9f866  Data\Audio\speech\Capone\ohdear.wav
aca0e2f5d5e16347ebacef8e522e581e  Data\Audio\speech\Capone\oinutter.wav
ab9a30a4360886b7abc86c75ee1533ee  Data\Audio\speech\Capone\oof1.wav
b8cade0db0d7f1f7e3c79057ef357735  Data\Audio\speech\Capone\oof2.wav
37dc8986df86cef363adbaae796439b1  Data\Audio\speech\Capone\oops.wav
6570dd19243e0ecb467d829c75e80025  Data\Audio\speech\Capone\orders.wav
7c60a88cf00badef49016106e05fc824  Data\Audio\speech\Capone\ouch.wav
8b430268ededdee5783f49c015a145ef  Data\Audio\speech\Capone\ow1.wav
2d4e61c1678a340465487affbfdabe6c  Data\Audio\speech\Capone\ow2.wav
91e91f056bfef350e14bcd969b79a4ca  Data\Audio\speech\Capone\perfect.wav
1bdb253888a9e2e2b04397bef846dedf  Data\Audio\speech\Capone\pray.wav
f080e1e5ba1ebf812a7f6a0c7aa0e4eb  Data\Audio\speech\Capone\relief.wav
da5b959e2579fb0697e64756e9b5de46  Data\Audio\speech\Capone\revenge.wav
92a63569f0694ec908d1cb59e220f4b0  Data\Audio\speech\Capone\runaway.wav
426c09e54b69b0e29100b5af74b202da  Data\Audio\speech\Capone\sad1.wav
233d80bc244551e57a7f02e2133d2517  Data\Audio\speech\Capone\sad2.wav
847642d57b7fedc0c68291590636a1ee  Data\Audio\speech\Capone\scared1.wav
4b330315c5ae98dc8d48cf8b332b581d  Data\Audio\speech\Capone\scared2.wav
f4682beaf8aba5d4b542030af25550ee  Data\Audio\speech\Capone\stupid.wav
1ce9ddb4c975891af0b9e0f605c15297  Data\Audio\speech\Capone\takecover.wav
b28fdebc05a753969aee56baf28f9e72  Data\Audio\speech\Capone\taunt1.wav
f1d65ac96dc66a54a721f0e3bd0c422a  Data\Audio\speech\Capone\traitor.wav
095f9b0e3a886c2fffe2062c4ad14dde  Data\Audio\speech\Capone\uhoh.wav
8de70f949407bb33f9cb58fdb30d7d2f  Data\Audio\speech\Capone\victory.wav
1834309af0ab526f8032a8efb9a18ac4  Data\Audio\speech\Capone\watchthis.wav
c47906126defa9ce64a9275770e4cbc8  Data\Audio\speech\Capone\whatthe.wav
14363f0e39850670f84cd8f9e30f2dfe  Data\Audio\speech\Capone\yessir.wav
346d3a28f462e1c555ee516dc73b6f75  Data\Audio\speech\Capone\youllregretthat.wav
55d6517428cd98d104e3436052d0b728  Data\Audio\speech\Classic\amazing.wav
7cd723faf2e1d43e3a861042c48a80de  Data\Audio\speech\Classic\angry.wav
e2693d860a6a4d98b4c08cef75a935ea  Data\Audio\speech\Classic\angry2.wav
8876ba29200769a37bbb653561a3b26a  Data\Audio\speech\Classic\boring.wav
025afdb77f1c5cb18b04f52f76496d3b  Data\Audio\speech\Classic\brilliant.wav
6397dd840b865c8db847ac8bd6cc6967  Data\Audio\speech\Classic\bummer.wav
9219248217c11462a634e518b0269e1e  Data\Audio\speech\Classic\byebye.wav
bae3f563938cf0ef81f6b05ae153d96b  Data\Audio\speech\Classic\collect.wav
8fc1be56d118be90393466238bf837a6  Data\Audio\speech\Classic\comeonthen.wav
7c846b9c38a7ecbb8b43afe56e94edad  Data\Audio\speech\Classic\coward.wav
e2d5ac484349bafe859a22cce318563d  Data\Audio\speech\Classic\dragonpunch.wav
f4aade2458c109bd62f3c7523a2ea613  Data\Audio\speech\Classic\drop.wav
dc751d94f2eb42a922aa8b4b89138658  Data\Audio\speech\Classic\excellent.wav
93d35ab82aabfc4ba66364f31d541951  Data\Audio\speech\Classic\fatality.wav
af8ee5be74a184fb656feb5fd7ba1438  Data\Audio\speech\Classic\fire.wav
35e1a9fffb4e45977b6ceeb1bbdd1441  Data\Audio\speech\Classic\fireball.wav
75c9162f22d0f47117b14927758a8c9b  Data\Audio\speech\Classic\firstblood.wav
207e66adcd4a3eba489e1f147f6f10d9  Data\Audio\speech\Classic\flawless.wav
25f7a41f554862df08cd0c262895295d  Data\Audio\speech\Classic\goaway.wav
2eb81d2073352d27debf844c66ca36b5  Data\Audio\speech\Classic\grenade.wav
405c5be466fec91bee2e411cee4187cb  Data\Audio\speech\Classic\happy2.wav
e150afb130dac0b479a61a87d83df0cf  Data\Audio\speech\Classic\happy3.wav
2b1000a0c0b55cf6cbe3eba732bf468f  Data\Audio\speech\Classic\hello.wav
112aba64cc2041656bbe69b6b2a3d785  Data\Audio\speech\Classic\hurry.wav
095cb83de344aaf43416fd514913661f  Data\Audio\speech\Classic\idle1.wav
b39dbc260d3a8af14061f69f1f3a02dd  Data\Audio\speech\Classic\idle2.wav
7b1ccea17bf074a4d55de2f1acd058fc  Data\Audio\speech\Classic\idle4.wav
01697810da9b0aabb7d38fa21a3e2e79  Data\Audio\speech\Classic\illgetyou.wav
8cf27b9995604fac39808a044ef0753a  Data\Audio\speech\Classic\incoming.wav
18fc0e3bf4b30a676e3223792b8c0732  Data\Audio\speech\Classic\jump1.wav
5ad8aac430690f870cdb06a13d4bba16  Data\Audio\speech\Classic\jump2.wav
0ecf746dd8ef18bd8f81bef5131c7080  Data\Audio\speech\Classic\justyouwait.wav
dc335d16dace37fd280a0ab56122764e  Data\Audio\speech\Classic\kamikaze.wav
e9974eb71223a8955eca14b0e43759d4  Data\Audio\speech\Classic\laugh.wav
af4cd14b9163028c0fa90e0d7a8534a5  Data\Audio\speech\Classic\leavemealone.wav
9becc155716a6fb5395e492e0f6659e3  Data\Audio\speech\Classic\loseloop.wav
2edaeadaa6a7b915518876e56366821b  Data\Audio\speech\Classic\missed.wav
2d59401932292af736616b3d857f5133  Data\Audio\speech\Classic\no.wav
67e2b5542d6bc23a57cb9908dbf78ef3  Data\Audio\speech\Classic\ohdear.wav
c5c58eac45c5416785c099bee5cc7cc7  Data\Audio\speech\Classic\oinutter.wav
c54c8535afe6ac77d8c20c7daf20ab71  Data\Audio\speech\Classic\oops.wav
646293f98162fa45bea0d3f191c569ed  Data\Audio\speech\Classic\orders.wav
e8256266d260c0cfd8974403f66433f0  Data\Audio\speech\Classic\ouch.wav
7d0be15000a7237e5325dd433a841f30  Data\Audio\speech\Classic\ow1.wav
9285a7d2972e28585618b0bc8ac490be  Data\Audio\speech\Classic\ow2.wav
ac36ef7d2763e5a0192053286eb9dcfd  Data\Audio\speech\Classic\perfect.wav
bd2ddb368ab332413ee45b58aacfba97  Data\Audio\speech\Classic\pray.wav
af0eb6be8c2cb028b0602e97eb266558  Data\Audio\speech\Classic\relief.wav
4b29a810796c59568468ebd25d9018da  Data\Audio\speech\Classic\revenge.wav
db86dfdb9aa5198aed897e7191079b24  Data\Audio\speech\Classic\runaway.wav
a300f28e6c49faed0f191c9fead4a8b0  Data\Audio\speech\Classic\sad1.wav
1ebfa0cc18a3cbf12ed37c9a1749f2a4  Data\Audio\speech\Classic\sad2.wav
fca4220366768a06c36cc5df04174050  Data\Audio\speech\Classic\scared1.wav
cef96aacec4866a0622894e500f62e82  Data\Audio\speech\Classic\scared2.wav
1541a91c6f7222071a8910c22007f7c0  Data\Audio\speech\Classic\stupid.wav
e0c933c76899e56bd227a7a30979c4e3  Data\Audio\speech\Classic\takecover.wav
286504ae3eab926980939062c84778e9  Data\Audio\speech\Classic\taunt1.wav
cfb13db4e7c65442fb946a620d25bb33  Data\Audio\speech\Classic\traitor.wav
a9e439ce7593b1b48dc65ba8f09ca624  Data\Audio\speech\Classic\uhoh.wav
b01648013b9ee9fda8e1c590da1a73a1  Data\Audio\speech\Classic\victory.wav
63b1bb6cae1dd0bd820dc56ed527ba19  Data\Audio\speech\Classic\watchthis.wav
485146b4018deecbb4929e3328749aa8  Data\Audio\speech\Classic\whatthe.wav
e878d8d7a846708165174a9633c30db0  Data\Audio\speech\Classic\yessir.wav
1e135de5c47d87cb89c8c9a91c8c8a58  Data\Audio\speech\Classic\youllregretthat.wav
33863f08b69d8602e72d04f6ab79321c  Data\Audio\speech\Confucious\amazing.wav
2cd168a2266000d7ed8c398b7b250c05  Data\Audio\speech\Confucious\angry.wav
f05eb26f0ed5d58f3a4ba99819ca1c4f  Data\Audio\speech\Confucious\angry2.wav
9d9870e6f6ca91f2e1167db792f0782c  Data\Audio\speech\Confucious\boring.wav
fe7e9e0d83f5b9956d6099b60683b2bc  Data\Audio\speech\Confucious\brilliant.wav
9cc72f9ac758e206f49f7227945d8a18  Data\Audio\speech\Confucious\bummer.wav
f376f5a3a5c3e324162c8c788745434c  Data\Audio\speech\Confucious\byebye.wav
163072dd2583284f7bd411c3c4344385  Data\Audio\speech\Confucious\collect.wav
c6c854da74cc84d9505564008bffaabe  Data\Audio\speech\Confucious\comeonthen.wav
242550f4adc245fc372ae00395209206  Data\Audio\speech\Confucious\coward.wav
f3c4d1ce6c5a168d47e9691917d00246  Data\Audio\speech\Confucious\dragonpunch.wav
14b9988b49e4e79aadd505a40e540181  Data\Audio\speech\Confucious\drop.wav
8ede6220b1f58f915b9e889a747a42c6  Data\Audio\speech\Confucious\excellent.wav
9480928178fe20ef3262fa46141161e1  Data\Audio\speech\Confucious\fatality.wav
f59eaac1b29d6f38d5af89dcccb22dda  Data\Audio\speech\Confucious\fire.wav
d22bab39f991d957e6fbbf308eda7630  Data\Audio\speech\Confucious\fireball.wav
5a0608155f4682f51445cdae672d20fc  Data\Audio\speech\Confucious\firstblood.wav
24d6ea6e9baa6cdf69eebe10b0a9f38a  Data\Audio\speech\Confucious\flawless.wav
913a84ed9c2b5fcec1ae66f79ee9cad6  Data\Audio\speech\Confucious\goaway.wav
473807372a03e7bc6f3cb76f6b40b1fe  Data\Audio\speech\Confucious\grenade.wav
7fed46354d15b677f4006918fc372e0d  Data\Audio\speech\Confucious\happy2.wav
0bf9e716802c44c8569ed0273ad96dbd  Data\Audio\speech\Confucious\happy3.wav
eabb531f150669f453b68347dd1f6e94  Data\Audio\speech\Confucious\hello.wav
a0aa4797f4523aa6d046e704af486c94  Data\Audio\speech\Confucious\hurry.wav
5f737b92299a7ef99fcf6be37eed79ba  Data\Audio\speech\Confucious\idle1.wav
9ca5f4d544600ff25dda7e9bc7fec921  Data\Audio\speech\Confucious\idle2.wav
3016faefc7e33083686d58003b3393f7  Data\Audio\speech\Confucious\idle4.wav
48358166d3398a91c8c208181274a17a  Data\Audio\speech\Confucious\illgetyou.wav
c900f201d9f75c00dfabf58f5727c941  Data\Audio\speech\Confucious\incoming.wav
da0cca03f6fd12c604d0787649ef83be  Data\Audio\speech\Confucious\jump1.wav
3ed146d5d4a69d784df57839e4018aae  Data\Audio\speech\Confucious\jump2.wav
69c1fab211d42ea2710c44e8da1917a5  Data\Audio\speech\Confucious\justyouwait.wav
a5e900f12180ed435fb9eae544042363  Data\Audio\speech\Confucious\kamikaze.wav
f2105378db82a8bd45ebcef56f660305  Data\Audio\speech\Confucious\laugh.wav
e47d8cf45e40f11908ab84c48aa29f0c  Data\Audio\speech\Confucious\leavemealone.wav
e38062f2c9be83598325936b4dab53db  Data\Audio\speech\Confucious\loseloop.wav
5cf3e94ff9bbbda004ff62ca1593aa12  Data\Audio\speech\Confucious\missed.wav
f7d7685f9c11105737d23aecca3fc3db  Data\Audio\speech\Confucious\no.wav
337e0171d86fbbd0dc2c9c50d0576377  Data\Audio\speech\Confucious\ohdear.wav
e546fa269892f70bb7721784793138a6  Data\Audio\speech\Confucious\oinutter.wav
2b2d620d775df0514329cd00876c08ed  Data\Audio\speech\Confucious\oof1.wav
f8bc3beb2e32bd98ea374dce49d52044  Data\Audio\speech\Confucious\oof2.wav
325dc60d74390d810afa7cd6c59cd366  Data\Audio\speech\Confucious\oops.wav
d15323e20c442c011bf3504c66e12232  Data\Audio\speech\Confucious\orders.wav
f0e0f32a27881c7874e2414c2188efa7  Data\Audio\speech\Confucious\ouch.wav
e8053e788cb5bace356041bd87ad0d5b  Data\Audio\speech\Confucious\ow1.wav
2a913a1c9ff7bbd49c578b5e3ac14289  Data\Audio\speech\Confucious\ow2.wav
9d5b7bd613bdfc4e62827615f676d3fd  Data\Audio\speech\Confucious\perfect.wav
6cf1d9a6f514617c61b971a745b7c98c  Data\Audio\speech\Confucious\pray.wav
706707e40a1b8501ec16a6d1274a2519  Data\Audio\speech\Confucious\relief.wav
03bc3bf61fe75c9960b6ef7fd2676982  Data\Audio\speech\Confucious\revenge.wav
19616c4a847c959d56ba988f6db7a0a9  Data\Audio\speech\Confucious\runaway.wav
50a1b2f255bbfa6fec5db2621d3f0fbc  Data\Audio\speech\Confucious\sad1.wav
bb0e637768dfa3748d6756e9b595a40c  Data\Audio\speech\Confucious\sad2.wav
c0200988300cbea2dc5a9a5210f027f7  Data\Audio\speech\Confucious\scared1.wav
d582ec290c23944ef69cffa9df16594f  Data\Audio\speech\Confucious\scared2.wav
c98efc1d91d15cfb7a0163fb7cd4e52d  Data\Audio\speech\Confucious\stupid.wav
2367bafa783ec7bc952d18430ebc26f0  Data\Audio\speech\Confucious\takecover.wav
6e0dfad7ccf66377c817a70eb5f92d5c  Data\Audio\speech\Confucious\taunt1.wav
8e921df4cebdd6fcc4bb31f999850e27  Data\Audio\speech\Confucious\traitor.wav
30fb9b8c5707f647a2163e5a767adfe8  Data\Audio\speech\Confucious\uhoh.wav
74be56714c729d031875d286936540a7  Data\Audio\speech\Confucious\victory.wav
535153a69f3dd7504aa70c0bab72fdab  Data\Audio\speech\Confucious\watchthis.wav
84db74059d663c8dc532cbbbd8201e4a  Data\Audio\speech\Confucious\whatthe.wav
c226436c0d2379da17ad0d2178ee1b06  Data\Audio\speech\Confucious\yessir.wav
0f71ef679151187fd51521deaa79f3be  Data\Audio\speech\Confucious\youllregretthat.wav
7d048267eeb3351af63ec7b7cdfcded7  Data\Audio\speech\Conscience\amazing.wav
624d85993925421b33156f72787b369c  Data\Audio\speech\Conscience\angry.wav
9cf1c5bd19e10f14cdec6e01a2f20fb8  Data\Audio\speech\Conscience\angry2.wav
9e940b9990e45fae68128cc8a10dcdb9  Data\Audio\speech\Conscience\boring.wav
b80c7d6d0e68f56984f4c153f5cd1096  Data\Audio\speech\Conscience\brilliant.wav
808d4ac45440f438ed688660c011f455  Data\Audio\speech\Conscience\bummer.wav
1c47bec6314f50af4ecd6d6fd51c1b1a  Data\Audio\speech\Conscience\byebye.wav
48e1839e9be17e22f295563256f061a5  Data\Audio\speech\Conscience\collect.wav
e390068de1f81b0d9368aafddd36b4c0  Data\Audio\speech\Conscience\comeonthen.wav
7366667dc5467a6a43801d366d61a4ae  Data\Audio\speech\Conscience\coward.wav
2f6dbcd25c4cc6398c2db51b8af179c9  Data\Audio\speech\Conscience\dragonpunch.wav
e4ae6ea6f435d9287dc5bea2f218d5e7  Data\Audio\speech\Conscience\drop.wav
397d005a0547798e5d24a1a88d64bd6c  Data\Audio\speech\Conscience\excellent.wav
c28ca545c95a47b8cc2c7f4aed1897c7  Data\Audio\speech\Conscience\fatality.wav
c3a6c8b264c5567ed5a3d49a166cc3e6  Data\Audio\speech\Conscience\fire.wav
912a519ec0c7adef821647a5abca7576  Data\Audio\speech\Conscience\fireball.wav
11d771e24f27fea18535342163f891b9  Data\Audio\speech\Conscience\firstblood.wav
22f386c96bef0568921e5bba6d2f441d  Data\Audio\speech\Conscience\flawless.wav
1430fb49dd6a7e4ae3a207b36d28c922  Data\Audio\speech\Conscience\goaway.wav
03c465f7316207df502c43f49a4a2b42  Data\Audio\speech\Conscience\grenade.wav
6414574f49f205171e13ed20f6b88bd2  Data\Audio\speech\Conscience\happy2.wav
64c4874b3b461e047a4341f1b5df25b6  Data\Audio\speech\Conscience\happy3.wav
d0d19cca2a8003ecc4213f62639c3416  Data\Audio\speech\Conscience\hello.wav
9e2e140b182915b1fe9a57931c9189bd  Data\Audio\speech\Conscience\hurry.wav
d361e6f63bd50175af631affd1a2213e  Data\Audio\speech\Conscience\idle1.wav
1f972741dc9f55531c21894ce1c8f477  Data\Audio\speech\Conscience\idle2.wav
34f382a4ace9832c1f0fa1d5703b11aa  Data\Audio\speech\Conscience\idle4.wav
b4b5ff5a18afb0d26c0e8f117c1cd213  Data\Audio\speech\Conscience\illgetyou.wav
391510be8f30880f949946d86777596e  Data\Audio\speech\Conscience\incoming.wav
a65b489c2eab733fc3ecf8016ffa7dc7  Data\Audio\speech\Conscience\jump1.wav
db9163fa04c5d7416174365e9caa1289  Data\Audio\speech\Conscience\jump2.wav
0012461cec6c22b6b5fd6514fcaf5c70  Data\Audio\speech\Conscience\justyouwait.wav
f8ce66619f8625459fd17624b11f36d0  Data\Audio\speech\Conscience\kamikaze.wav
7685c49572dde8528a6fb4d04d7faf1d  Data\Audio\speech\Conscience\laugh.wav
030781d59b2afc4e7038446b79c2c006  Data\Audio\speech\Conscience\leavemealone.wav
921f21ca527f4ec36ab5e3bcc759fc22  Data\Audio\speech\Conscience\loseloop.wav
cc5bde6d275cee5127e313b036496243  Data\Audio\speech\Conscience\missed.wav
190067cbdfc22cae9ef23c5e03881241  Data\Audio\speech\Conscience\no.wav
1fbee1c172e48dfc5fd362c527602df4  Data\Audio\speech\Conscience\ohdear.wav
8932ceddd0ec9dc57c0849e6d5ab36c3  Data\Audio\speech\Conscience\oinutter.wav
2aeac67a74831a8c88c9303e2f6fb248  Data\Audio\speech\Conscience\oof1.wav
2e75f399a049115cd698b584c5223556  Data\Audio\speech\Conscience\oof2.wav
f73ba3c1a2e2bce798e023f067672c43  Data\Audio\speech\Conscience\oops.wav
e61b5d539154eb4cfa07bbe512c34080  Data\Audio\speech\Conscience\orders.wav
678bbbd37e3d828eea687cef77a83f7d  Data\Audio\speech\Conscience\ouch.wav
872c9daf2e13df2471f0e9f56be64fa1  Data\Audio\speech\Conscience\ow1.wav
b8124acecbb8b0c4830b64ec0c4da468  Data\Audio\speech\Conscience\ow2.wav
1fea8e86c58267ad9f4406369f2660b9  Data\Audio\speech\Conscience\perfect.wav
6b983ccbfb5e69917980fe2d8b07a7af  Data\Audio\speech\Conscience\pray.wav
9b8559aa04245a73a5998ac0e75fc7f0  Data\Audio\speech\Conscience\relief.wav
67979fa8092f72729464abbe99371f78  Data\Audio\speech\Conscience\revenge.wav
5d4a2bae96f952ef9b9cc13c751461d3  Data\Audio\speech\Conscience\runaway.wav
78dbd359e8ef0e2593e5281f2cb56d1f  Data\Audio\speech\Conscience\sad1.wav
37ea80c40ec48a47c011f65af13bf752  Data\Audio\speech\Conscience\sad2.wav
dab67a4639cbf26f2492d12f86ffbda6  Data\Audio\speech\Conscience\scared1.wav
e0096b853404654a2184cea4d3b2e22a  Data\Audio\speech\Conscience\scared2.wav
f1da039de9d53d3444a804a1020fd33c  Data\Audio\speech\Conscience\stupid.wav
dda72241754e9625ef9c60dfb35774a4  Data\Audio\speech\Conscience\takecover.wav
04828fe2d44aa9301bb629643bfc582f  Data\Audio\speech\Conscience\taunt1.wav
a552cd326ced8dd2e05b6ced9fd73bb0  Data\Audio\speech\Conscience\traitor.wav
4d71f6944ad3cf839919c7ccf7d9f7a0  Data\Audio\speech\Conscience\uhoh.wav
4167634208afe42d6c52e9b58d6e64f3  Data\Audio\speech\Conscience\victory.wav
cbe706aef3c24afec2af102e9a084542  Data\Audio\speech\Conscience\watchthis.wav
f44665fb1d45717f48dcd41ffb44738c  Data\Audio\speech\Conscience\whatthe.wav
ccaccff9930c8328473bd299260749ed  Data\Audio\speech\Conscience\yessir.wav
5754b5fb1bcb08f305f6415dac82fe94  Data\Audio\speech\Conscience\youllregretthat.wav
242200db30c41f863c3d1f4e770c1035  Data\Audio\speech\Cowgirl\amazing.wav
730e119b27821df363a723a61f9edadb  Data\Audio\speech\Cowgirl\angry.wav
8b9af60a4ecd605ba91f9fb48959f080  Data\Audio\speech\Cowgirl\angry2.wav
d4d19034ed1023eeb02941240cda1e6f  Data\Audio\speech\Cowgirl\boring.wav
968bb363977156c2be3884a75ef8b087  Data\Audio\speech\Cowgirl\brilliant.wav
182e0138ce1facbb76f8c02c4d4b36f4  Data\Audio\speech\Cowgirl\bummer.wav
35acd78d21bb2a6aaf168aab17523955  Data\Audio\speech\Cowgirl\byebye.wav
c5f2a7d8987305133c286f833ce82ec7  Data\Audio\speech\Cowgirl\collect.wav
6c63cede2a4175823739ba39d60de586  Data\Audio\speech\Cowgirl\comeonthen.wav
139eef5c4650ee56d396c52777b3e14e  Data\Audio\speech\Cowgirl\coward.wav
3cfceea7bc61a825972bd996eff86007  Data\Audio\speech\Cowgirl\dragonpunch.wav
cd6cfcf8842bd1b7c5d4d647911c6b47  Data\Audio\speech\Cowgirl\drop.wav
d36071d83c55d914cab5a1642384cb94  Data\Audio\speech\Cowgirl\excellent.wav
02f4a17a56e84f40d7fd204e7818a96e  Data\Audio\speech\Cowgirl\fatality.wav
08046ad8e080f22bf4fc659624428c30  Data\Audio\speech\Cowgirl\fire.wav
90bb6ae2e2be21c0a36124d7687d77e9  Data\Audio\speech\Cowgirl\fireball.wav
9f301ececfa0183c2d3025f5e93308f1  Data\Audio\speech\Cowgirl\firstblood.wav
2d49e8e9a21863f4f31b43d927a62107  Data\Audio\speech\Cowgirl\flawless.wav
e7d041addf7c8a82d5f08b967f1b480f  Data\Audio\speech\Cowgirl\goaway.wav
a354c9e40ffcadbeabe703c2c2cad242  Data\Audio\speech\Cowgirl\grenade.wav
4f149253292b2b5eba6b8dfbfa6e9f34  Data\Audio\speech\Cowgirl\happy2.wav
b07c184d717aa982605d3335266ac683  Data\Audio\speech\Cowgirl\happy3.wav
2fc38b5e8a0b3ec3f7523d827209a826  Data\Audio\speech\Cowgirl\hello.wav
dbde60c4d8cd733b88dfb215dc2f01a1  Data\Audio\speech\Cowgirl\hurry.wav
5616b7be099e8a4ecd1ee8c56887e9bd  Data\Audio\speech\Cowgirl\idle1.wav
d0684721adaf3212c8452c6fd5e359d9  Data\Audio\speech\Cowgirl\idle2.wav
edb624965ecd4f9a15053cdc279f4e9a  Data\Audio\speech\Cowgirl\idle4.wav
3d50988d7f9c2b91bd4fa72247c404ca  Data\Audio\speech\Cowgirl\illgetyou.wav
eeb62595ffe9f1296ef072f0f971c323  Data\Audio\speech\Cowgirl\incoming.wav
3071801d3c37685e1672eac716b681d0  Data\Audio\speech\Cowgirl\jump1.wav
66ef2959eb5940328a53295c4c43abcd  Data\Audio\speech\Cowgirl\jump2.wav
3cdb74407b698653f52525869a3fa2d1  Data\Audio\speech\Cowgirl\justyouwait.wav
24dd31893eedb5d3d82e76ba901afb4b  Data\Audio\speech\Cowgirl\kamikaze.wav
67557edb79c520efee5aedfd7ae673b1  Data\Audio\speech\Cowgirl\laugh.wav
8549392aa5adea016775d069d687e866  Data\Audio\speech\Cowgirl\leavemealone.wav
0d338bc569b3efaee59bfd55c47b639d  Data\Audio\speech\Cowgirl\loseloop.wav
bd0857ce842b3253866d4a971f74acfd  Data\Audio\speech\Cowgirl\missed.wav
80e8e90bd6560d749d291a841d567299  Data\Audio\speech\Cowgirl\no.wav
20b7e532f51e0b734f951d55f8020ca9  Data\Audio\speech\Cowgirl\ohdear.wav
db99458aae7f873410652ac5b11c8f8e  Data\Audio\speech\Cowgirl\oinutter.wav
5a347372b7dde0062b75e5cb20cc96ee  Data\Audio\speech\Cowgirl\oof1.wav
fc85f31634c3673912bf7aef4bea423a  Data\Audio\speech\Cowgirl\oof2.wav
ca0363a3612b447f463ffa7c9acd9a80  Data\Audio\speech\Cowgirl\oops.wav
5819243ed04491180237cb9d16e72134  Data\Audio\speech\Cowgirl\orders.wav
89cd6620791cf51e2ee0c98617c60e1d  Data\Audio\speech\Cowgirl\ouch.wav
3bbb5cf2e35d3667500195bc3e090634  Data\Audio\speech\Cowgirl\ow1.wav
a446031c2289294e9591d1d42b53d46a  Data\Audio\speech\Cowgirl\ow2.wav
19540f8cb95bbccdfff776c89883a9b0  Data\Audio\speech\Cowgirl\perfect.wav
0c5f8a91b88c05a4abf1ca5474ed5147  Data\Audio\speech\Cowgirl\pray.wav
127a83f00e3a5198f7df31c1fb8e2a17  Data\Audio\speech\Cowgirl\relief.wav
2470b0b8177a2af929c3361a58c42ecd  Data\Audio\speech\Cowgirl\revenge.wav
a9587a3ac263284f189772e8ec5dbe7a  Data\Audio\speech\Cowgirl\runaway.wav
41b52e78d44f170cda213979b86ffb29  Data\Audio\speech\Cowgirl\sad1.wav
4b4dcb816261593fd4e925f7bbed7bee  Data\Audio\speech\Cowgirl\sad2.wav
f84d2e9defdac653592ff96c5448087c  Data\Audio\speech\Cowgirl\scared1.wav
909d490b3b536f3b8cd7b65fc91ba9b2  Data\Audio\speech\Cowgirl\scared2.wav
ed0a17d43b42e3ce3e79efa022c9923c  Data\Audio\speech\Cowgirl\stupid.wav
7027c5235d02545072651270a2160ef5  Data\Audio\speech\Cowgirl\takecover.wav
2583f70043c07c3b7f1b0d234e7b3d95  Data\Audio\speech\Cowgirl\taunt1.wav
235dc028309ba2a195179bb07694eabf  Data\Audio\speech\Cowgirl\traitor.wav
bfbfb60fb413a323e241490ec43e360d  Data\Audio\speech\Cowgirl\uhoh.wav
1bc815e6c6d72f02443b8d8beb50f374  Data\Audio\speech\Cowgirl\victory.wav
df98c36b3d54d0777598b1897ec5813d  Data\Audio\speech\Cowgirl\watchthis.wav
dbd55734905dbca60e0f5be058cc4c7e  Data\Audio\speech\Cowgirl\whatthe.wav
3444423f835eced35e84f8871d6d19d9  Data\Audio\speech\Cowgirl\yessir.wav
739ee622ab7be2d8ce9c314279831b8a  Data\Audio\speech\Cowgirl\youllregretthat.wav
403cf98c24c28f0f8217d793e4045989  Data\Audio\speech\Cyberworms\amazing.wav
9a05f1f199dd49dc1f5132eb1c239ead  Data\Audio\speech\Cyberworms\angry.wav
cf784085afd11b7591a40f706a25bde5  Data\Audio\speech\Cyberworms\angry2.wav
13c58c9e6e1b7a013c06f320c027f479  Data\Audio\speech\Cyberworms\boring.wav
83702d38fab5476b1513b2b604b6ace8  Data\Audio\speech\Cyberworms\brilliant.wav
159f3ccc2c8de02e377bd068cbfe0591  Data\Audio\speech\Cyberworms\bummer.wav
a8e37e9b053193057a076f83486a090e  Data\Audio\speech\Cyberworms\byebye.wav
730633dbc9bfe462f34f7fd5fbbdeb9b  Data\Audio\speech\Cyberworms\collect.wav
3036e399fae925ab4e93dbd9f9b28f33  Data\Audio\speech\Cyberworms\comeonthen.wav
45e435cf4a491f34bffd4606eb8103d9  Data\Audio\speech\Cyberworms\coward.wav
50e5bde7bbec9b7f5246cc3a475458a6  Data\Audio\speech\Cyberworms\dragonpunch.wav
5042e72b2264b96474b1c4c03ea21a1b  Data\Audio\speech\Cyberworms\drop.wav
184d101247e45a59d08b711fbac02a8c  Data\Audio\speech\Cyberworms\excellent.wav
81ca00e26f622cadc8a33fa9686fc570  Data\Audio\speech\Cyberworms\fatality.wav
02e170001972b520fe4aa4f168e3a000  Data\Audio\speech\Cyberworms\fire.wav
4827b8c2f7f26e00ed6471096ccabe53  Data\Audio\speech\Cyberworms\fireball.wav
0cd120297380d005f4c914dd8783eece  Data\Audio\speech\Cyberworms\firstblood.wav
9e876aac99f84f7fdb4baa61b2cc1b10  Data\Audio\speech\Cyberworms\flawless.wav
09fd146ece6f5136f5e7e113acaa5e1e  Data\Audio\speech\Cyberworms\goaway.wav
7d4b264b3b8311b539647c2ca2c28821  Data\Audio\speech\Cyberworms\grenade.wav
99ac304d85f51af730685855be42da81  Data\Audio\speech\Cyberworms\happy2.wav
88eae772131eb22cb67d2dcda3c427d3  Data\Audio\speech\Cyberworms\happy3.wav
cc1b2aac4ba38ffe5e4a66af9b7806cf  Data\Audio\speech\Cyberworms\hello.wav
6debfef91496b71e065db87c0567da80  Data\Audio\speech\Cyberworms\hurry.wav
15093de791ceb520e9a2d289f5512267  Data\Audio\speech\Cyberworms\idle1.wav
4b273fb31fb6fcd494c6ef2f5322e535  Data\Audio\speech\Cyberworms\idle2.wav
a4684ceea31896e1345ebba6b11b35b6  Data\Audio\speech\Cyberworms\idle4.wav
a36b526fe72feb96738c090d938272f4  Data\Audio\speech\Cyberworms\illgetyou.wav
2b129ecb2d324c37f6e9cac905f7bebf  Data\Audio\speech\Cyberworms\incoming.wav
c686042de06575d7dcc61891ef67284d  Data\Audio\speech\Cyberworms\jump1.wav
001c9534d50f807ec06525f1a6abd919  Data\Audio\speech\Cyberworms\jump2.wav
ab0fcc5bb4836f6077e72ec1d8b64b6c  Data\Audio\speech\Cyberworms\justyouwait.wav
436e44fd96cc47c6a8b7a064621812ea  Data\Audio\speech\Cyberworms\kamikaze.wav
949fbe7291410a5836a5335948e6919a  Data\Audio\speech\Cyberworms\laugh.wav
0ca4e133c4c13bfaa76499fdde3e9720  Data\Audio\speech\Cyberworms\leavemealone.wav
06c80e625a12b34f2d5089b82ad1502c  Data\Audio\speech\Cyberworms\loseloop.wav
e44041bce3835c66ff73db28017791b0  Data\Audio\speech\Cyberworms\missed.wav
29a381f10b6da3bf00ad35ba72f15400  Data\Audio\speech\Cyberworms\no.wav
d65e853a6a3e7684ee0532d5e240f508  Data\Audio\speech\Cyberworms\ohdear.wav
9f96cfa4d15a5229c8da8da55cf5edbb  Data\Audio\speech\Cyberworms\oinutter.wav
9363d7ba7926a0781f65f922f4db36ca  Data\Audio\speech\Cyberworms\oof1.wav
b3cd689c411548be90237b6f698a3455  Data\Audio\speech\Cyberworms\oof2.wav
7fdbd063b336c928a006fb3f1419621a  Data\Audio\speech\Cyberworms\oops.wav
a2173a9424c332de2a3a61bdc71c2714  Data\Audio\speech\Cyberworms\orders.wav
c4e3b1d8313ae1a8f297223abc0b4a72  Data\Audio\speech\Cyberworms\ouch.wav
a938d503ea0aaff335c53622936a164d  Data\Audio\speech\Cyberworms\ow1.wav
e50bc614a575351410bb940a8a00adbe  Data\Audio\speech\Cyberworms\ow2.wav
e373d402865f1d98430b2e67726cef24  Data\Audio\speech\Cyberworms\perfect.wav
817c10f5d24344d685d15084c7479664  Data\Audio\speech\Cyberworms\pray.wav
317124b61406e1f21e49b2e90e76694c  Data\Audio\speech\Cyberworms\relief.wav
2591bd37cf7adb72f48c57931dc508ec  Data\Audio\speech\Cyberworms\revenge.wav
395f493b6935cd7506f64e35dca0d605  Data\Audio\speech\Cyberworms\runaway.wav
3b2ebe5c8a01fe2ee9f907b887a20ade  Data\Audio\speech\Cyberworms\sad1.wav
d5005dd234f4d945512d9cacf6c12b1a  Data\Audio\speech\Cyberworms\sad2.wav
93fa37d15e1de069bc6400e10c411266  Data\Audio\speech\Cyberworms\scared1.wav
1dd062cb186cc4f3aa267aed55e8a642  Data\Audio\speech\Cyberworms\scared2.wav
f417bb6df4ab02ea35c2536ef275bb96  Data\Audio\speech\Cyberworms\stupid.wav
d65c7e5e72ffa209f60009118608cd68  Data\Audio\speech\Cyberworms\takecover.wav
69b7bbfbb832ca660828e4c5ab61017d  Data\Audio\speech\Cyberworms\taunt1.wav
6bbc77deec0a9c1e8f20247917f59ffb  Data\Audio\speech\Cyberworms\traitor.wav
0ade249186986900f780bb1e50d594be  Data\Audio\speech\Cyberworms\uhoh.wav
510c99d7858aecbba116b06bc85ff8b2  Data\Audio\speech\Cyberworms\victory.wav
a23acafa53bd94ba1eedcaef513a4feb  Data\Audio\speech\Cyberworms\watchthis.wav
e1f497ed848b16662a55fce3cd2caa28  Data\Audio\speech\Cyberworms\whatthe.wav
a209ab904e81f69e8f8fd38dd2d1e32c  Data\Audio\speech\Cyberworms\yessir.wav
9ff58c9e4028a87c5872f04168c84466  Data\Audio\speech\Cyberworms\youllregretthat.wav
e4945f0f230b890f9a9bc5e02daf8df4  Data\Audio\speech\Drill Sergeant\amazing.wav
9360edbcc0eb53901380d4631d2453d8  Data\Audio\speech\Drill Sergeant\angry.wav
3fc2d253e9f34f82b6425eab3c4fe030  Data\Audio\speech\Drill Sergeant\angry2.wav
a9a155043d8f39615ee681333286a9cd  Data\Audio\speech\Drill Sergeant\boring.wav
deb6d9b2a4eaf2d0513bef4f6c88e3d8  Data\Audio\speech\Drill Sergeant\brilliant.wav
b7459bd7a53339f3b6fd92fbdd8f7d4f  Data\Audio\speech\Drill Sergeant\bummer.wav
229d2e80e75719c2597c2d4f8cd53a35  Data\Audio\speech\Drill Sergeant\byebye.wav
d5dde5ba5166b53b30e4917a63d8400a  Data\Audio\speech\Drill Sergeant\collect.wav
f54ca659d3b5ac73d352ff5014a5c9d7  Data\Audio\speech\Drill Sergeant\comeonthen.wav
c7056b4a944e9f9721f6bf6f249671bc  Data\Audio\speech\Drill Sergeant\coward.wav
d419249f9b544ef912f6113086b4c412  Data\Audio\speech\Drill Sergeant\dragonpunch.wav
57a9af3ae935a98f5efac1f71b38608b  Data\Audio\speech\Drill Sergeant\drop.wav
e37ae0ba3e56c01e803921f00fd7da98  Data\Audio\speech\Drill Sergeant\excellent.wav
db0a7f261caf127478ee5e9e2dbca7d8  Data\Audio\speech\Drill Sergeant\fatality.wav
878be83a0108c6b798d41c0b67ffa37a  Data\Audio\speech\Drill Sergeant\fire.wav
3d835908927b7762242efa5b83e25487  Data\Audio\speech\Drill Sergeant\fireball.wav
ad0ec6220f401725cb35c690e699d6b0  Data\Audio\speech\Drill Sergeant\firstblood.wav
79826c7dc1c4606aacc20bc5b8d25141  Data\Audio\speech\Drill Sergeant\flawless.wav
73485ba527502aa8fa7a88d38cfa1b59  Data\Audio\speech\Drill Sergeant\goaway.wav
032e21707a1bf748d34d469621379b32  Data\Audio\speech\Drill Sergeant\grenade.wav
35b57ca58fe251811c609853a956541c  Data\Audio\speech\Drill Sergeant\happy2.wav
256b97819d102cbb3d826d92b72de909  Data\Audio\speech\Drill Sergeant\happy3.wav
208e8d582486072ef1b8aaa78ebe5530  Data\Audio\speech\Drill Sergeant\hello.wav
42eebaa7aa8e9e7f53d2ecfc94a25265  Data\Audio\speech\Drill Sergeant\hurry.wav
0318539ae7891a6ebb6f36de5fc94913  Data\Audio\speech\Drill Sergeant\idle1.wav
6c9be875c52bfea1721ff6aa1bdaf2dd  Data\Audio\speech\Drill Sergeant\idle2.wav
ede5f1fe3d869c625885c28143c390f2  Data\Audio\speech\Drill Sergeant\idle4.wav
3eb82a00d919a67175b9150077132189  Data\Audio\speech\Drill Sergeant\illgetyou.wav
d7c02980762890007e16f9266f475919  Data\Audio\speech\Drill Sergeant\incoming.wav
ae638ddb4626e2e56970c5a7566e2618  Data\Audio\speech\Drill Sergeant\jump1.wav
9e9a11fb3af7124013f3e1c1249b4962  Data\Audio\speech\Drill Sergeant\jump2.wav
147b0374d724bf693f433e34ae705e54  Data\Audio\speech\Drill Sergeant\justyouwait.wav
1652025e4ae45e94b120b70d9af8f26d  Data\Audio\speech\Drill Sergeant\kamikaze.wav
d74258bab4f8f3a793624219fb4346f7  Data\Audio\speech\Drill Sergeant\laugh.wav
f3292645f6a0d19748f9c77f833ee405  Data\Audio\speech\Drill Sergeant\leavemealone.wav
86b03ab82fb88f5f3a49cbc23853ebe4  Data\Audio\speech\Drill Sergeant\loseloop.wav
ca25ea0c8b9803bfd410bb5837dfb155  Data\Audio\speech\Drill Sergeant\missed.wav
08a8f9b32f35295554b0ba8417a683e2  Data\Audio\speech\Drill Sergeant\no.wav
f9068439cf8f266a7cb77a2993463b79  Data\Audio\speech\Drill Sergeant\ohdear.wav
1bdbedd9308438f0ed2d7679e8117db0  Data\Audio\speech\Drill Sergeant\oinutter.wav
1083a9530e55562e8f49a2755cd3059b  Data\Audio\speech\Drill Sergeant\oof1.wav
8544c64d1cb03fb26b65064511368d24  Data\Audio\speech\Drill Sergeant\oof2.wav
0acbd09fa352cc9818ef433310adab1d  Data\Audio\speech\Drill Sergeant\oops.wav
98ee57ffc73a6320b86477e4c865bb4f  Data\Audio\speech\Drill Sergeant\orders.wav
f0d62ef2ff6ab067476e1b1eb37451b9  Data\Audio\speech\Drill Sergeant\ouch.wav
54da59327c196862f672ba2bfba5f2c3  Data\Audio\speech\Drill Sergeant\ow.wav
a4b0e66b30c45a7cb874cb5b29882798  Data\Audio\speech\Drill Sergeant\ow1.wav
385650e763c91e0d61b1713656f3c285  Data\Audio\speech\Drill Sergeant\ow2.wav
58c2ee5978df3dbe120450a9c61b72d6  Data\Audio\speech\Drill Sergeant\perfect.wav
eec1b0d72744b2ac60c55cad49492fc0  Data\Audio\speech\Drill Sergeant\pray.wav
19ec2f1258eb6da025e99eedd5af0d5e  Data\Audio\speech\Drill Sergeant\relief.wav
db9c1c60fddd51f692e643f5fd7f3032  Data\Audio\speech\Drill Sergeant\revenge.wav
4f3225c9ba964b74c552625fa5a47804  Data\Audio\speech\Drill Sergeant\runaway.wav
c961fc8f0e2e109323017685a3347606  Data\Audio\speech\Drill Sergeant\sad1.wav
5cb4882e2d0680d818f3ef730c82ee63  Data\Audio\speech\Drill Sergeant\sad2.wav
9d5a552bbbccead3457ecaf5805215fb  Data\Audio\speech\Drill Sergeant\scared1.wav
9b1bc0160db06f473f836ad104bf8009  Data\Audio\speech\Drill Sergeant\scared2.wav
81bffe844b85fa68a5fa21530bf159f0  Data\Audio\speech\Drill Sergeant\stupid.wav
18ed7a634802c0a0a5f1c3f59b988cf2  Data\Audio\speech\Drill Sergeant\takecover.wav
e8e7cafd20e36d07e7bb0b8ba07f814d  Data\Audio\speech\Drill Sergeant\taunt1.wav
0a4a72245f4d0bab0828b1dd2b900086  Data\Audio\speech\Drill Sergeant\traitor.wav
90dbe892339aa24479b466cf447b6660  Data\Audio\speech\Drill Sergeant\uhoh.wav
0d9c61efadb65e96a674eddfff479612  Data\Audio\speech\Drill Sergeant\victory.wav
ad1de5a8050193a08e6b13c3ae3a3ae5  Data\Audio\speech\Drill Sergeant\watchthis.wav
2c547d463026ad6ee292b049eab41ab1  Data\Audio\speech\Drill Sergeant\whatthe.wav
beceab94595d3242c9bbd1b7c35f4992  Data\Audio\speech\Drill Sergeant\yessir.wav
50b21a268fd5cde6744dd45f91028efb  Data\Audio\speech\Drill Sergeant\youllregretthat.wav
de84b424b765af3bb4aa2a5cb4a7d699  Data\Audio\speech\Footy Fan\amazing.wav
f041362e076f9bceb8527882d8c73a47  Data\Audio\speech\Footy Fan\angry.wav
967a749ecede81bb5d22bd3f5a3fd7f7  Data\Audio\speech\Footy Fan\angry2.wav
8e825fe254bafea8f625e69c4e3c9d26  Data\Audio\speech\Footy Fan\boring.wav
72087a3f202e1814b6d1c5974a14931b  Data\Audio\speech\Footy Fan\brilliant.wav
d59dba564eebd6a07f2b5690b75d57e7  Data\Audio\speech\Footy Fan\bummer.wav
7eb44b12361c1c6ad0728431268ee8c2  Data\Audio\speech\Footy Fan\byebye.wav
e754dbf851c80c0346e07af915403ecd  Data\Audio\speech\Footy Fan\collect.wav
f8a66887428307e8d1f53131d07d07e0  Data\Audio\speech\Footy Fan\comeonthen.wav
6443e75fefdb14879579cb3ea2f156a4  Data\Audio\speech\Footy Fan\coward.wav
a75aec6de29bb95ca855f368eaf8d331  Data\Audio\speech\Footy Fan\dragonpunch.wav
8f7efddec3f3432e9f4bbf658dde7684  Data\Audio\speech\Footy Fan\drop.wav
920a83f86bc482300f3eaec8f9c1e04d  Data\Audio\speech\Footy Fan\excellent.wav
2cfc1a161ba65fb131944767423bda3e  Data\Audio\speech\Footy Fan\fatality.wav
98c2e843861b700eb45d4fc9dd4ab84c  Data\Audio\speech\Footy Fan\fire.wav
e43ef51d266471b64ba220f68703b82a  Data\Audio\speech\Footy Fan\fireball.wav
03e7afdc7913e405900de14434454c10  Data\Audio\speech\Footy Fan\firstblood.wav
ecb36a3f2a683ffef07200b0c70f4cea  Data\Audio\speech\Footy Fan\flawless.wav
d7aa8dadf5db252d9524c7d0c34ff2ba  Data\Audio\speech\Footy Fan\goaway.wav
07f4f3d8857b5c0a3b55881ba29c00a7  Data\Audio\speech\Footy Fan\grenade.wav
250784c201ec4172c9856417472036ad  Data\Audio\speech\Footy Fan\happy2.wav
c89fad6815a923958ab89d855a268ee0  Data\Audio\speech\Footy Fan\happy3.wav
ae4bd051da31c6281a3c204100f4fd65  Data\Audio\speech\Footy Fan\hello.wav
df8c34f8d5cd9240c51d11a6f8881a77  Data\Audio\speech\Footy Fan\hurry.wav
faeb0a61278f544e68e784cd79690fc4  Data\Audio\speech\Footy Fan\idle1.wav
8a1716034f18739b4611c15bb6af924a  Data\Audio\speech\Footy Fan\idle2.wav
725127cbe6ffec2037b26ed254c38926  Data\Audio\speech\Footy Fan\idle4.wav
478604cf59d7576c51354d8a023f39f8  Data\Audio\speech\Footy Fan\illgetyou.wav
92c59702366a88235e4d94f23ebda175  Data\Audio\speech\Footy Fan\incoming.wav
141076c0f519e27e75f34a35e9415a2e  Data\Audio\speech\Footy Fan\jump1.wav
6f6fe3e56f4167d26e5a8c21d88338a4  Data\Audio\speech\Footy Fan\jump2.wav
824396a1198e4b57154dbc973660a167  Data\Audio\speech\Footy Fan\justyouwait.wav
42f5d0629a4ce5196d9366bd81d2c40f  Data\Audio\speech\Footy Fan\kamikaze.wav
1b45e2c53bd11c942962e37be92821bb  Data\Audio\speech\Footy Fan\laugh.wav
a1313954aece04248f35465bccb6cb76  Data\Audio\speech\Footy Fan\leavemealone.wav
2b4f65794466116aaf3b0213a37453e2  Data\Audio\speech\Footy Fan\loseloop.wav
654b8ff1b3653474317acdb5ecf353ec  Data\Audio\speech\Footy Fan\missed.wav
b8bb6d07248a52b13a77c59269344a55  Data\Audio\speech\Footy Fan\no.wav
9f9cdc3886a8c9d6bcfd5d8d3794b30f  Data\Audio\speech\Footy Fan\ohdear.wav
165520ffa135c34b20f47eb877436527  Data\Audio\speech\Footy Fan\oinutter.wav
69a846932db6c20a2bf2dc137b3afe56  Data\Audio\speech\Footy Fan\oof1.wav
aea627965d5999bccb36306c4dbf4de6  Data\Audio\speech\Footy Fan\oof2.wav
9b6f40bcd26b1a8d4a36cf5b6c2c9d77  Data\Audio\speech\Footy Fan\oops.wav
73283e43b234e132f76c09e0165e41aa  Data\Audio\speech\Footy Fan\orders.wav
c411d0ea97c8e8705dc69453643634f3  Data\Audio\speech\Footy Fan\ouch.wav
7ba9b0fcfff56fd5e0f1334d275cda5c  Data\Audio\speech\Footy Fan\ow1.wav
417ff6441f00639f97a3189c78abb8b4  Data\Audio\speech\Footy Fan\ow2.wav
12693d8ff4f227e089321002711b0dc8  Data\Audio\speech\Footy Fan\perfect.wav
27611a1383cb0a26b88ad47a7ffff842  Data\Audio\speech\Footy Fan\pray.wav
e1fbe4e5d98e00a9756ce5f1f637d47d  Data\Audio\speech\Footy Fan\relief.wav
8f6629e9ab470386512dfb8cb0bac95b  Data\Audio\speech\Footy Fan\revenge.wav
486394201d9079b993658f8bce9183b5  Data\Audio\speech\Footy Fan\runaway.wav
d28aa5740b747574e3d79635168cde36  Data\Audio\speech\Footy Fan\sad1.wav
3ce310c21f1b65d71166d51d42b81e7f  Data\Audio\speech\Footy Fan\sad2.wav
05b755f006ba14f5f28697a863336b01  Data\Audio\speech\Footy Fan\scared1.wav
e6c6f3709b9e9b7d7c9e40dd4f658761  Data\Audio\speech\Footy Fan\scared2.wav
68efdca86fcbce1f4b0b38b267fd8f77  Data\Audio\speech\Footy Fan\stupid.wav
b42106740bd0f605f3ffd91c206bfe10  Data\Audio\speech\Footy Fan\takecover.wav
4c14e8fac5bbe29057702bbf4dd4ebfb  Data\Audio\speech\Footy Fan\taunt1.wav
2855d9f978557ac631222c90b799a36e  Data\Audio\speech\Footy Fan\traitor.wav
16b7d7f8ee389527e87c3974dfac17c1  Data\Audio\speech\Footy Fan\uhoh.wav
c4fbc00105b091dfaf146bc93153b949  Data\Audio\speech\Footy Fan\victory.wav
7eacf5b0972f85472581674ffbee8495  Data\Audio\speech\Footy Fan\watchthis.wav
f418ee65f9de7acc04caed2b817faf9d  Data\Audio\speech\Footy Fan\whatthe.wav
634f0c0b0fdc562d6b5108f76b72547c  Data\Audio\speech\Footy Fan\yessir.wav
58950297416a9a28e4539d65e1bebdbb  Data\Audio\speech\Footy Fan\youllregretthat.wav
2ba2b0e698701771aa85fc7d5c1a0590  Data\Audio\speech\French\amazing.wav
b1a1fadfec08966c8a7cde3511e6a930  Data\Audio\speech\French\angry.wav
b19fed2fc96e6da29a641e78fc7864af  Data\Audio\speech\French\angry2.wav
30e2807e01d89e96b306bcddfd6813c5  Data\Audio\speech\French\boring.wav
91fbfa58fa5f4eb9277c879cae6f8fbe  Data\Audio\speech\French\brilliant.wav
f232ec95a718f1bea1d0e31ee4cedfb9  Data\Audio\speech\French\bummer.wav
6c3b6acf94e27c04b9e4aaa76c310673  Data\Audio\speech\French\byebye.wav
e987ec4ab4e7fb40a816453bcc40e3ea  Data\Audio\speech\French\collect.wav
7cd460d89f7e16b23368603d8d259785  Data\Audio\speech\French\comeonthen.wav
777e410d00c695322b5dd37c5d5a3b5f  Data\Audio\speech\French\coward.wav
a972a62fbea4e4fbf3f85be798c65ce5  Data\Audio\speech\French\dragonpunch.wav
32e5e44b74ba9bd643141f651ca5537f  Data\Audio\speech\French\drop.wav
b2f9b260a034ba187e12eac58a98797e  Data\Audio\speech\French\excellent.wav
218c2a9c0c3ab5bb1dc3f9fceec15341  Data\Audio\speech\French\fatality.wav
8b92fb69ef269d62ddc1e5dd984b0782  Data\Audio\speech\French\fire.wav
ad8ef384a633959c9eb8b6885a579779  Data\Audio\speech\French\fireball.wav
d273204fac44cd0a65438c68f24b364f  Data\Audio\speech\French\firstblood.wav
df75beaf86d6b1cdbbaa1682821435ea  Data\Audio\speech\French\flawless.wav
f5bb2c7a65c198e880323867f3b01e3f  Data\Audio\speech\French\goaway.wav
1e5b893ec17649c973f58b41a25c715d  Data\Audio\speech\French\grenade.wav
e438c1190971c46ca80b00a4afa96e86  Data\Audio\speech\French\happy2.wav
e32b5288c0c64a2165d77e67b2c8d33c  Data\Audio\speech\French\happy3.wav
1fa6cce6fb893b39701271eb5eda935a  Data\Audio\speech\French\hello.wav
f5c99015dd068a91ce0b7999fa3d38f5  Data\Audio\speech\French\hurry.wav
726ba4647760a64419d012735e4ec3b3  Data\Audio\speech\French\idle1.wav
a929e63d206655163fa319316c991dfc  Data\Audio\speech\French\idle2.wav
8e8c508f5aa5d8057aec3a7c072067d7  Data\Audio\speech\French\idle4.wav
0ae8e27bf27ee3063136f5321576d93e  Data\Audio\speech\French\illgetyou.wav
5cce38a19c7c991fb4e00f79ab31dd02  Data\Audio\speech\French\incoming.wav
3729626fbab3fc4542eff28f7823c91b  Data\Audio\speech\French\jump1.wav
491b6993f8924b13af9de7e2ff179463  Data\Audio\speech\French\jump2.wav
09d1bc80f6429c3530794c29ce87510f  Data\Audio\speech\French\justyouwait.wav
68b908d6487786c7c303ba45ea8cbf7d  Data\Audio\speech\French\kamikaze.wav
e88919663d546994f38043544e1c959a  Data\Audio\speech\French\laugh.wav
d4efbdc279b5fdeb846736a4d87c0714  Data\Audio\speech\French\leavemealone.wav
43064de2572d101aa2f1511db4405468  Data\Audio\speech\French\loseloop.wav
35271a38caa21a2d508f5a8f49673431  Data\Audio\speech\French\missed.wav
9058a1b31dc28928d18c9c9f6236b93a  Data\Audio\speech\French\no.wav
b9e4d7575f6382a9f16c87592b57b87f  Data\Audio\speech\French\ohdear.wav
512f506a3a0317d2816cb9ecef381438  Data\Audio\speech\French\oinutter.wav
1f130ec7c6dcba77bcfc988cb7b542c0  Data\Audio\speech\French\oof1.wav
06fcb7457b5fc22b1f5ded16c0cf266e  Data\Audio\speech\French\oof2.wav
cdff85adbb22b166411167b9de77e0b3  Data\Audio\speech\French\oops.wav
c9c211267dc77e85d907efbf1c0e0c87  Data\Audio\speech\French\orders.wav
31828a1774d2909ba3411d51d139cc7f  Data\Audio\speech\French\ouch.wav
aeb4982d9b3f30b8466b6e2aa1a54ff4  Data\Audio\speech\French\ow1.wav
8e90f6d02c75cebba0cb4d13dce5c8c2  Data\Audio\speech\French\ow2.wav
8a7d504ab253b3c248af97946f5e6dfa  Data\Audio\speech\French\perfect.wav
cd7b275317fc8d433e436d9a97e79bbb  Data\Audio\speech\French\pray.wav
56d43646efc97be2e9e128fc9143e4d8  Data\Audio\speech\French\relief.wav
27e37d29a97234ed618ef25a0ca956a2  Data\Audio\speech\French\revenge.wav
20d4358cf8c7cf18e789d4cf14dc28ec  Data\Audio\speech\French\runaway.wav
6a2bc0c9136ab076fa97180e030dd748  Data\Audio\speech\French\sad1.wav
45b57e2e1b1e3b031af5e364bb20ef6c  Data\Audio\speech\French\sad2.wav
c8969722f96d78699591b6539973517f  Data\Audio\speech\French\scared1.wav
edc9639d1e3540aae75f98562c795560  Data\Audio\speech\French\scared2.wav
676e336dc36fc85b6e71ce574b5e349d  Data\Audio\speech\French\stupid.wav
43514f6b62ab47cebba80c743b069449  Data\Audio\speech\French\takecover.wav
3c647c35cb543dd0ecec28ee0496874b  Data\Audio\speech\French\taunt1.wav
30d3c5bde8e1f21bfb5963171e114743  Data\Audio\speech\French\traitor.wav
94bca7249e62413b546cef198d496a6f  Data\Audio\speech\French\uhoh.wav
d3ba35003937de91cd9dc455cb441780  Data\Audio\speech\French\victory.wav
fb002e123b8bf2977b0f4d6cc45ca525  Data\Audio\speech\French\watchthis.wav
4a86c4dc87e5ca0f463e971e6fe2a897  Data\Audio\speech\French\whatthe.wav
a66b7624618ed25cf979ecbfa3d17653  Data\Audio\speech\French\yessir.wav
6476acca44d9c1982ea588ca030553a2  Data\Audio\speech\French\youllregretthat.wav
9194e40183784ba66b2144e4bbf450f3  Data\Audio\speech\French Lover\amazing.wav
4c4dae9e9ef7f767076c2c2784f1024a  Data\Audio\speech\French Lover\angry.wav
3bff3b462b30b7ae85896e8fcf351c92  Data\Audio\speech\French Lover\angry2.wav
d25ddae5fd0fc4f5f92f4df87c81b770  Data\Audio\speech\French Lover\boring.wav
3744fac2e75f2e92774a7ea9d31bb3e7  Data\Audio\speech\French Lover\brilliant.wav
03db3dcae680eec6ca0d39c23db54561  Data\Audio\speech\French Lover\bummer.wav
a482aa4c4a42106d59c03b3a27f6cc37  Data\Audio\speech\French Lover\byebye.wav
ba78ca79054da08d497e5887ffc8deb7  Data\Audio\speech\French Lover\collect.wav
d306e0647e6821438c72f4fad0ef66dc  Data\Audio\speech\French Lover\comeonthen.wav
718d00cfe5ab12a038ed16a53f491223  Data\Audio\speech\French Lover\coward.wav
c4037fb352f242921f8cc24ba69be79b  Data\Audio\speech\French Lover\dragonpunch.wav
6aede54f028c12b194a226263c124914  Data\Audio\speech\French Lover\drop.wav
dfacd5bc2781dcece182c3c9b339e501  Data\Audio\speech\French Lover\excellent.wav
0396e20bc77617ad226547d0a3a4af62  Data\Audio\speech\French Lover\fatality.wav
dc650f2cd3e372441b9d490184abd4fa  Data\Audio\speech\French Lover\fire.wav
133cb5e04c8db52fdcdcc296ff690aa0  Data\Audio\speech\French Lover\fireball.wav
6ce3ce3d6be92ba2622274a0973ab94e  Data\Audio\speech\French Lover\firstblood.wav
4e58f367e1f6789dc1cfb554fbc0ed68  Data\Audio\speech\French Lover\flawless.wav
153f57f49ffb0b68bcbca623c1734ce8  Data\Audio\speech\French Lover\goaway.wav
3bf1787063affcd406541ab7d709b4c2  Data\Audio\speech\French Lover\grenade.wav
d8e00e47b4d0cf509ca39bdcf640f9ca  Data\Audio\speech\French Lover\happy2.wav
6084a4ed69a0eb646fd1fd320a2a45f6  Data\Audio\speech\French Lover\happy3.wav
3fbae4ffbbd87e8125f7d6a6e0466577  Data\Audio\speech\French Lover\hello.wav
1cb355f3dddff3500d95b0e0f316b9a2  Data\Audio\speech\French Lover\hurry.wav
5bd6f31aa31305f8dd1264b2953d8478  Data\Audio\speech\French Lover\idle1.wav
b5e75192974b315758b02b9f66f1dc2e  Data\Audio\speech\French Lover\idle2.wav
a58dc44c741ce06843132bfa067b9fed  Data\Audio\speech\French Lover\idle4.wav
1eb729b5b85cd42087478718b5887ba4  Data\Audio\speech\French Lover\illgetyou.wav
afec97d2c86e681af33203e3c22b7708  Data\Audio\speech\French Lover\incoming.wav
fc825f6592664842e31ef3c5cfab35cc  Data\Audio\speech\French Lover\jump1.wav
8cb20e341135a0f1c7b44d056bf11106  Data\Audio\speech\French Lover\jump2.wav
453a1457d834b5e39cc1fcdc65cfb1e4  Data\Audio\speech\French Lover\justyouwait.wav
f15267baada17fc151cebb542f0fafa4  Data\Audio\speech\French Lover\kamikaze.wav
1608134913953f0766447bae9f321f07  Data\Audio\speech\French Lover\laugh.wav
02f8d8c5b8edd38d32ad76b118038151  Data\Audio\speech\French Lover\leavemealone.wav
f57e34c7a98fb58b13edc13dc23fdcca  Data\Audio\speech\French Lover\loseloop.wav
218cb6a5758d422630e221c1e7334854  Data\Audio\speech\French Lover\missed.wav
ffb4fe423764083608d84ed165a511f1  Data\Audio\speech\French Lover\no.wav
c7204325e8d6d7a1455611b2856c4752  Data\Audio\speech\French Lover\ohdear.wav
9bb5e6fdf0d1924162c2f253eea04c63  Data\Audio\speech\French Lover\oinutter.wav
10873af3823d431571b269456c705a9a  Data\Audio\speech\French Lover\oof1.wav
7b3e7a10aa46c75795a2a43b90f46e87  Data\Audio\speech\French Lover\oof2.wav
633d72923c0a07385a6f2808fca0b840  Data\Audio\speech\French Lover\oops.wav
b7d990e345c0c47e3bfea073e7ef5287  Data\Audio\speech\French Lover\orders.wav
b2e9bd9fc4dad994fdca0c4cfe035a15  Data\Audio\speech\French Lover\ouch.wav
15f12ce4995c7a63b53cdbe5246b6d20  Data\Audio\speech\French Lover\ow1.wav
8ac92452d7c693c216164842f338ac32  Data\Audio\speech\French Lover\ow2.wav
ed5c260d110a6346cc770246646b09f3  Data\Audio\speech\French Lover\perfect.wav
823abae1a9fad2ab86ec09bcc48a0fed  Data\Audio\speech\French Lover\pray.wav
1789b9142336a18fc91129cfaea7622e  Data\Audio\speech\French Lover\relief.wav
712d2eef1943dfa18193796bf97ca4ba  Data\Audio\speech\French Lover\revenge.wav
d0fe94b9848bbc4d51c91fcf9e47e211  Data\Audio\speech\French Lover\runaway.wav
6f58e968fc183d21b08dd1cad526bc29  Data\Audio\speech\French Lover\sad1.wav
54e7b77b7388d414dd78f33e52e0f656  Data\Audio\speech\French Lover\sad2.wav
64e4918212befc96f8d4b01da0e2c526  Data\Audio\speech\French Lover\scared1.wav
b8a59c37e44d15a63ec67c1b36cd5f20  Data\Audio\speech\French Lover\scared2.wav
8769d1770118fa0e37f3107937bb2c74  Data\Audio\speech\French Lover\stupid.wav
c9297c0bf1b03998cb121a4e5a2511f4  Data\Audio\speech\French Lover\takecover.wav
eb5cc321897cd9b856d791ac35c627f9  Data\Audio\speech\French Lover\taunt1.wav
42496cb3f7dd59ebfa5bf5d8f7150fa7  Data\Audio\speech\French Lover\traitor.wav
a6192a0fd02ef2a3e59bd0401f8fb8e4  Data\Audio\speech\French Lover\uhoh.wav
d013d66ed71af3981d1dc34f66a43ff0  Data\Audio\speech\French Lover\victory.wav
9af5ccfa0ad3283fbc0fbe33f4a7c59b  Data\Audio\speech\French Lover\watchthis.wav
f9c90b3ca230345dde9ce0757dd0aa5b  Data\Audio\speech\French Lover\whatthe.wav
b67338de162b30cfa587021bf60d4cb8  Data\Audio\speech\French Lover\yessir.wav
c69ed8b08e12e80a787423366a438143  Data\Audio\speech\French Lover\youllregretthat.wav
2d419459028bf0050ab00b7c2075f2cd  Data\Audio\speech\Gangsta\amazing.wav
fef2c5d744248bfe4871047d53eb2684  Data\Audio\speech\Gangsta\angry.wav
b14dd7eff16c4ce2df4527b3b87641dd  Data\Audio\speech\Gangsta\angry2.wav
6e5fa88578e9de51862f809c0285d572  Data\Audio\speech\Gangsta\boring.wav
a86314b50002b533fcf4e6b9700af830  Data\Audio\speech\Gangsta\brilliant.wav
637942143d1a837b2ccddf7de579810e  Data\Audio\speech\Gangsta\bummer.wav
d4e4b85e9f3e8de38ea9fb3d320fb31b  Data\Audio\speech\Gangsta\byebye.wav
4193d5a28a8dcfae741fb1961df61c76  Data\Audio\speech\Gangsta\collect.wav
7e89fa531ef267a660b2032a9ebb5663  Data\Audio\speech\Gangsta\comeonthen.wav
5b6553144d31264c07a1fd7214b10623  Data\Audio\speech\Gangsta\coward.wav
0f825103177c401481da721cac99cc06  Data\Audio\speech\Gangsta\dragonpunch.wav
db4a97d318bb58befb283bd9018bd2ca  Data\Audio\speech\Gangsta\drop.wav
975febbfc03699a771a4d991f77b1ebc  Data\Audio\speech\Gangsta\excellent.wav
b2cc54311be8a550dd7dfa211e18cc99  Data\Audio\speech\Gangsta\fatality.wav
517c582ac3b99f515a8f50064c8b5044  Data\Audio\speech\Gangsta\fire.wav
500c4a209f578cd118daf1ab58c79668  Data\Audio\speech\Gangsta\fireball.wav
9f301ececfa0183c2d3025f5e93308f1  Data\Audio\speech\Gangsta\firstblood.wav
74652a4aab5626bbea06d323d56419c1  Data\Audio\speech\Gangsta\flawless.wav
40dbff52753440dc55433158f3783e82  Data\Audio\speech\Gangsta\goaway.wav
1b4a770fd0692376c1a16ce5eea681ab  Data\Audio\speech\Gangsta\grenade.wav
682c701071c6a6ef7aa04d03b897f57e  Data\Audio\speech\Gangsta\happy2.wav
0d43b63cee7b338cf55cbf51fd23ca2c  Data\Audio\speech\Gangsta\happy3.wav
281616a7f4408b1df26c3555efbdc394  Data\Audio\speech\Gangsta\hello.wav
00b6ba85a2b9ec8aa8e1dad2c11661ef  Data\Audio\speech\Gangsta\hurry.wav
464954077c42fe3f0b7eeaa8c9d9cec9  Data\Audio\speech\Gangsta\idle1.wav
30cc7520e622ed7abdad7b06b7c563bb  Data\Audio\speech\Gangsta\idle2.wav
1a8b62096c4ee87f1b2ec08137ded586  Data\Audio\speech\Gangsta\idle4.wav
dc514cba19f5407fb50b98aa4ae56c5b  Data\Audio\speech\Gangsta\illgetyou.wav
5f504fcf0fae9b8c4cf1dac66a3ea34b  Data\Audio\speech\Gangsta\incoming.wav
200c464c53b9f2ade6d6956c0c0d4942  Data\Audio\speech\Gangsta\jump1.wav
b730e62ceeabd21eed766ce6fb994a1c  Data\Audio\speech\Gangsta\jump2.wav
358f166b1018258948c235164cb9c06d  Data\Audio\speech\Gangsta\justyouwait.wav
7ecfcdbfd01e59f989a4ccce5b802628  Data\Audio\speech\Gangsta\kamikaze.wav
fc2cdb433a72f1c79f49fd7574856831  Data\Audio\speech\Gangsta\laugh.wav
11da732f4f4dd5f67c988ea6d8aab489  Data\Audio\speech\Gangsta\leavemealone.wav
67257f0b22f3dde49cdcf34acb3dcfeb  Data\Audio\speech\Gangsta\loseloop.wav
d68f5eac1adf2125c630bc5830e9daad  Data\Audio\speech\Gangsta\missed.wav
32db6e9562053ef271b8e52aedaf48e0  Data\Audio\speech\Gangsta\no.wav
62e11682087e747404b383e006a88117  Data\Audio\speech\Gangsta\ohdear.wav
0153da0012e874327cfb41f1cedc3f0d  Data\Audio\speech\Gangsta\oinutter.wav
37ede16548fcbfcd58bb69a11cf64579  Data\Audio\speech\Gangsta\oof1.wav
8710397d6952ccd14361c6fc876da40e  Data\Audio\speech\Gangsta\oof2.wav
c97ed0c1f8da5d0be7c233c571c77106  Data\Audio\speech\Gangsta\oops.wav
a5ede0a33a8fef37bba1a5e3d1acb842  Data\Audio\speech\Gangsta\orders.wav
f51f6d9e2c15ce7eeb9914a968654ad6  Data\Audio\speech\Gangsta\ouch.wav
f1944e0899fc36563a039a2d4a3c9710  Data\Audio\speech\Gangsta\ow1.wav
3710935717ccbece9c524a4da8c8f6b3  Data\Audio\speech\Gangsta\ow2.wav
204feaa85dd9e6fea5e64b87aeea2e04  Data\Audio\speech\Gangsta\perfect.wav
312077c35ed0742be0d4de00eaec3503  Data\Audio\speech\Gangsta\pray.wav
51650db7f6d19859dbc016f86abc781b  Data\Audio\speech\Gangsta\relief.wav
63ab1d2971608ef4602151099a268bb0  Data\Audio\speech\Gangsta\revenge.wav
57bd9bb930dfe2efd43fe43c1bab41f5  Data\Audio\speech\Gangsta\runaway.wav
70ab98162eafea33e61942eb1cd6a6f5  Data\Audio\speech\Gangsta\sad1.wav
932835a3f52a7c11ee17cdd361a120fa  Data\Audio\speech\Gangsta\sad2.wav
8a82901fe7345dc1b745fbc9d35f589a  Data\Audio\speech\Gangsta\scared1.wav
1aa9cf592569713196ac8f56a48d1ae2  Data\Audio\speech\Gangsta\scared2.wav
9c99350ed93b9a3323eab852c8bce4f9  Data\Audio\speech\Gangsta\stupid.wav
76739853a427df2b80e39ca8e7b44d04  Data\Audio\speech\Gangsta\takecover.wav
3ea2dad92be77c8a463e98ccc7d9956a  Data\Audio\speech\Gangsta\taunt1.wav
04a8e1460075b6dd4d6f6351a3dc84b3  Data\Audio\speech\Gangsta\traitor.wav
bfbb03f1c28ada067aa503acc571b1f2  Data\Audio\speech\Gangsta\uhoh.wav
afe0d0d92a8581d21a12b5d2284b6ee0  Data\Audio\speech\Gangsta\victory.wav
7d01b0e00efba82445237cc90eb8c0bb  Data\Audio\speech\Gangsta\watchthis.wav
43755b6e15a96bd85b4fc11c5d0f5fef  Data\Audio\speech\Gangsta\whatthe.wav
e9f9c17b757b1e69b37ff9c9101a9420  Data\Audio\speech\Gangsta\yessir.wav
c18a8f6c998024118536fa6ca2dddac0  Data\Audio\speech\Gangsta\youllregretthat.wav
ce0d5e2367e3193fa0fcc0d8b75620f0  Data\Audio\speech\Geordie\amazing.wav
81755cd484ea5eb69843d77a3569fe9a  Data\Audio\speech\Geordie\angry.wav
6dd862572ee810cffab2b8e945a836d6  Data\Audio\speech\Geordie\angry2.wav
6e05ad8146ee64b182f090d117dfd2d4  Data\Audio\speech\Geordie\boring.wav
2b84f2a8bf6335f86422b5ef8c9fe9b0  Data\Audio\speech\Geordie\brilliant.wav
c8ca4a36c1eeb3c886c480dee04d5250  Data\Audio\speech\Geordie\bummer.wav
ed71d3b23295b27ae91f6c445d5390ca  Data\Audio\speech\Geordie\byebye.wav
0910bbf039f5dfb051f3e8563e6bcd42  Data\Audio\speech\Geordie\collect.wav
365887b721bfbc2375a0c9c0c8406b23  Data\Audio\speech\Geordie\comeonthen.wav
d0e92a7ac0d8d1e82c6b2e9d3ceda737  Data\Audio\speech\Geordie\coward.wav
9e6386a3e17fa698cc630a19b9c71d0f  Data\Audio\speech\Geordie\dragonpunch.wav
10290336f3dc07ad2c2b7441f58edc31  Data\Audio\speech\Geordie\drop.wav
9b647c1652c1ff38454f62b1d5432b35  Data\Audio\speech\Geordie\excellent.wav
905cfecf7a9e4fbba11d2f7027e41099  Data\Audio\speech\Geordie\fatality.wav
ecd95758055117998a6bfb8f62e1767b  Data\Audio\speech\Geordie\fire.wav
c4e4b5965afdb390b5ae07341722ee24  Data\Audio\speech\Geordie\fireball.wav
214fbb554636f661a1c9dca6acc118f7  Data\Audio\speech\Geordie\firstblood.wav
7a10ea1be7f9cd2917cf8423237beec3  Data\Audio\speech\Geordie\flawless.wav
c48309fd244a6a6f575ce0b6bd4828da  Data\Audio\speech\Geordie\goaway.wav
53258e90fb42414740cae9f445700307  Data\Audio\speech\Geordie\grenade.wav
c4e2de4be5ee7a22d679f70a5ae89046  Data\Audio\speech\Geordie\happy2.wav
7679b77269c44bbb8b6759758721724f  Data\Audio\speech\Geordie\happy3.wav
443e7791b147fc3650e4f19139f679f5  Data\Audio\speech\Geordie\hello.wav
e1f7c707fb7deba477d051678182fa10  Data\Audio\speech\Geordie\hurry.wav
963c41913a10ce6720b293b6cd6f7db9  Data\Audio\speech\Geordie\idle1.wav
58739c01194567b9f2746043b48a54d8  Data\Audio\speech\Geordie\idle2.wav
f7bd5ac62f8556aec8a1d3730c46c4d2  Data\Audio\speech\Geordie\idle4.wav
481ba0906fb9027e15a645b706b8c3c1  Data\Audio\speech\Geordie\illgetyou.wav
2ba5ee591dabbaf5382fe1912092ba73  Data\Audio\speech\Geordie\incoming.wav
1dc68261e7329089abf6143c8b6eb47d  Data\Audio\speech\Geordie\jump1.wav
683a5fcdb742097b3480471b83360069  Data\Audio\speech\Geordie\jump2.wav
0146e97edd37b61a6d7bc6e9d6f3e236  Data\Audio\speech\Geordie\justyouwait.wav
a7dbcfad7c6e2a07fa8732e072be77ce  Data\Audio\speech\Geordie\kamikaze.wav
33868a404274642719bb7b7faf8439d8  Data\Audio\speech\Geordie\laugh.wav
c46488dcddd0c86ee2b11ada644d430a  Data\Audio\speech\Geordie\leavemealone.wav
943bde8cb17ac648c7321136331178ac  Data\Audio\speech\Geordie\loseloop.wav
721fd41e39f970d85f8d341f7ab91f9b  Data\Audio\speech\Geordie\missed.wav
50431e86e5bc9a38cab249fd35ce9524  Data\Audio\speech\Geordie\no.wav
3f9254d6dd9ea316886c81c392264cb0  Data\Audio\speech\Geordie\ohdear.wav
36ad8277b61f152220cc6f6d4490ca70  Data\Audio\speech\Geordie\oinutter.wav
a2daab4cf47ba64b2856663416a27b87  Data\Audio\speech\Geordie\oof1.wav
c17031a1cf0d643ef832f825852ddab7  Data\Audio\speech\Geordie\oof2.wav
f902b761aaed8746cf3b65aefb6c5fe5  Data\Audio\speech\Geordie\oops.wav
9e70763127b507abe81c621b37f69529  Data\Audio\speech\Geordie\orders.wav
31cdb879f2b94d3336161602614c3aef  Data\Audio\speech\Geordie\ouch.wav
54dfce03b6aafea786b948a50bfa5065  Data\Audio\speech\Geordie\ow1.wav
27294605f53f8f1c38278700b4332f38  Data\Audio\speech\Geordie\ow2.wav
1fc452db0d9e9df72d01fea902f613e8  Data\Audio\speech\Geordie\perfect.wav
8a9a15305e2f99a3f5f040e2444c8fd1  Data\Audio\speech\Geordie\pray.wav
ab57624af287f02cf2f452af57b8151c  Data\Audio\speech\Geordie\relief.wav
31427eb7151bd2979e2e321c98f3fef1  Data\Audio\speech\Geordie\revenge.wav
2a48bc389f193174b025495d840b50ae  Data\Audio\speech\Geordie\runaway.wav
840eac6dd60475838265ba65aace1505  Data\Audio\speech\Geordie\sad1.wav
449d725c49d08a152b0b12f003f30251  Data\Audio\speech\Geordie\sad2.wav
2fb52a57cd40decd3bbb312756ba972e  Data\Audio\speech\Geordie\scared1.wav
120e19ac007d8ea30155b16aa5ab779e  Data\Audio\speech\Geordie\scared2.wav
0d78cc36b919d48758a34f11051ba73d  Data\Audio\speech\Geordie\stupid.wav
06266cc9a871aa9a9880284989597f18  Data\Audio\speech\Geordie\takecover.wav
61a97dfdd5c2fa912dcdb0cf436e6e06  Data\Audio\speech\Geordie\taunt1.wav
1fd671ef4bf090024c75109d422e2812  Data\Audio\speech\Geordie\traitor.wav
d96147764c4681cc9f579d2b94739265  Data\Audio\speech\Geordie\uhoh.wav
9ecd2c90e9adcba4669bf7d78c20e0e7  Data\Audio\speech\Geordie\victory.wav
6668129bb4be18065876f76e2e095437  Data\Audio\speech\Geordie\watchthis.wav
924cbd8a03a1a16b3816209890f91a17  Data\Audio\speech\Geordie\whatthe.wav
f1d6974b25a46588e6c96349f7362283  Data\Audio\speech\Geordie\yessir.wav
89398f80f95a595ea8484bc4d62ba59f  Data\Audio\speech\Geordie\youllregretthat.wav
c24da597d45ce773da0ed13598fd549d  Data\Audio\speech\German\amazing.wav
3561ba5bb958334a5130aeeeed3b4d6d  Data\Audio\speech\German\angry.wav
e89f68171d8093e953894e91477644fc  Data\Audio\speech\German\angry2.wav
587e95d72a3526be421b0e1e296ebd5c  Data\Audio\speech\German\boring.wav
55e66d10ac51c2cca7085ca039191894  Data\Audio\speech\German\brilliant.wav
9a7734dd85a8e8414285a699b6ca1e21  Data\Audio\speech\German\bummer.wav
06052236c3a524a9f40268b93fffbf57  Data\Audio\speech\German\byebye.wav
2cbe5492654a94df96fa4591e6027bbe  Data\Audio\speech\German\collect.wav
ccdd73b0f15820f94626f827b90bb841  Data\Audio\speech\German\comeonthen.wav
96fd72b5f5b079efdfc291c2ab36f0c6  Data\Audio\speech\German\coward.wav
dd62e858a42afb90bf6b9fb2f1962677  Data\Audio\speech\German\dragonpunch.wav
c2723db9cc69e9da1d4f642be345beb4  Data\Audio\speech\German\drop.wav
615ad100d1e1e26db7291b4d32526bc1  Data\Audio\speech\German\excellent.wav
0871d71c8bb47ad52c7413f6d0c0fad2  Data\Audio\speech\German\fatality.wav
c9900a524ec86bf9a7f30584f8b4ef1e  Data\Audio\speech\German\fire.wav
a3f35d3a4cacb7da6c6b21159e0eddb4  Data\Audio\speech\German\fireball.wav
23c1f6182c30d911ebb2af0fe4c89685  Data\Audio\speech\German\firstblood.wav
59f3362b27f00cf80c5d185a4f700399  Data\Audio\speech\German\flawless.wav
431bce1d2dbdc9a6b3860fca01ab4adf  Data\Audio\speech\German\goaway.wav
b4201599d233ec399d834450984f27c9  Data\Audio\speech\German\grenade.wav
30a67e61d4054f671fb1ed74f2b62564  Data\Audio\speech\German\happy2.wav
0aed976aad52e0253902160eac8f61d0  Data\Audio\speech\German\happy3.wav
32043dc68fa67921e942944a91d98987  Data\Audio\speech\German\hello.wav
b28f6a3d3677c036182124eeb2689cb8  Data\Audio\speech\German\hurry.wav
500a67bc6898d55936f67ff4904420d3  Data\Audio\speech\German\idle1.wav
091459b08a6223e9d2b7dc14c3a38a45  Data\Audio\speech\German\idle2.wav
ef0b15b3f3c4faf0ddb12bcbc94ff6a2  Data\Audio\speech\German\idle4.wav
133c1b8cef997dc1abc43e14f43b66d4  Data\Audio\speech\German\illgetyou.wav
cdcc65ac83d23eaea60dcb6b2258695b  Data\Audio\speech\German\incoming.wav
ca4b09fe45afe878bd2a4e54c5c60c54  Data\Audio\speech\German\jump1.wav
786eafe976db42d6b78ff6081a3c86fc  Data\Audio\speech\German\jump2.wav
8457c852251506a6412d8c05fd37b04b  Data\Audio\speech\German\justyouwait.wav
89363b4c4e9beff0b235d2950b09ab84  Data\Audio\speech\German\kamikaze.wav
d3ba5925809243de177cbdc3fb8674cc  Data\Audio\speech\German\laugh.wav
047e1bd84e6274b8896bee57a2136ed8  Data\Audio\speech\German\leavemealone.wav
8ec1858e02a347d84dfeda52368c8c25  Data\Audio\speech\German\loseloop.wav
612b90b81483f05b20e679eec7112ce7  Data\Audio\speech\German\missed.wav
3846f5053c8b22782c644b77af6d4903  Data\Audio\speech\German\no.wav
011160d448050fa983271371c7728545  Data\Audio\speech\German\ohdear.wav
63410357838da2202e19332a373980a7  Data\Audio\speech\German\oinutter.wav
2c9a05d31f35d686cdb6266717dd3058  Data\Audio\speech\German\oof1.wav
bc3b9496faa7def3af0cfc8fe2e017aa  Data\Audio\speech\German\oof2.wav
d3c5138926306c4d4328ca0a4d266442  Data\Audio\speech\German\oops.wav
4687f909162ea759c6249e96975202e0  Data\Audio\speech\German\orders.wav
435794458bc056f91a54a1f4d3c22f79  Data\Audio\speech\German\ouch.wav
dcaa52cf47fa7aca1d12307fbb24d490  Data\Audio\speech\German\ow1.wav
9f8fe45bb85ecb41dc3a4f250b936d19  Data\Audio\speech\German\ow2.wav
f0460dd9bb5ab7d525a7b278e54e374d  Data\Audio\speech\German\perfect.wav
27f53b9ce933500c6bd0b1c3ac1ca08b  Data\Audio\speech\German\pray.wav
5d7c8c7c10738dc665c5f9f9efb54f91  Data\Audio\speech\German\relief.wav
448d4f52b106b315f52e5f57b50e9dd1  Data\Audio\speech\German\revenge.wav
5879bd21ab3e9343db1f92ac8685e987  Data\Audio\speech\German\runaway.wav
f7584a723d4a16466fae94e363787545  Data\Audio\speech\German\sad1.wav
f9f980aa30241679b3529a8cc0e2e738  Data\Audio\speech\German\sad2.wav
19c8329add2adaaa39e8eac0c3df78b7  Data\Audio\speech\German\scared1.wav
aec7444918003b62ffd39e475192fb08  Data\Audio\speech\German\scared2.wav
c0b6d0f1dbbaaefef39169458b8b038b  Data\Audio\speech\German\stupid.wav
ee86251f5ba55862caa02bc26be04a0e  Data\Audio\speech\German\takecover.wav
b8a039a7b9081b070c14865298210824  Data\Audio\speech\German\taunt1.wav
e67b2865f1e01062c081745802588a5c  Data\Audio\speech\German\traitor.wav
2b4abda11365ffbf8b79195fda477593  Data\Audio\speech\German\uhoh.wav
9e7398015cd4602967222bbe6c84c043  Data\Audio\speech\German\victory.wav
65e036cfb3c03f57e5f671da78b55396  Data\Audio\speech\German\watchthis.wav
3af2723858bd87fc6e06d12441b87755  Data\Audio\speech\German\whatthe.wav
3717685e98702700280ade3a0b29a619  Data\Audio\speech\German\yessir.wav
b522824fc3b28fc19368b9d8ce4c5c9e  Data\Audio\speech\German\youllregretthat.wav
2087f72e1fb7ebb77a4153bb1ec35978  Data\Audio\speech\Grandpa\amazing.wav
4933369a0d65ac065c201ed4532e8203  Data\Audio\speech\Grandpa\angry.wav
94108014404de24df1320539dcaefa6c  Data\Audio\speech\Grandpa\angry2.wav
76b107c8db40cfde4311a2c69838e231  Data\Audio\speech\Grandpa\boring.wav
13e0347e89b29d83f3ed45eea57c618d  Data\Audio\speech\Grandpa\brilliant.wav
08eebe93fdeeb151a9ff8ce845cef244  Data\Audio\speech\Grandpa\bummer.wav
dc38f16bf20877f0a2da57bb74a64a22  Data\Audio\speech\Grandpa\byebye.wav
3eb7f3e766113068c29e4b1cd6010354  Data\Audio\speech\Grandpa\collect.wav
321c374da0a43b30ec92c5a5c092a9ff  Data\Audio\speech\Grandpa\comeonthen.wav
ea2433954ae1e18e83b58f79ef6ceffb  Data\Audio\speech\Grandpa\coward.wav
ab39aa13a46a2975739e3c3c9bd16ef9  Data\Audio\speech\Grandpa\dragonpunch.wav
7125d21dc9dd4d052af18d75ab1678a1  Data\Audio\speech\Grandpa\drop.wav
4634523ccf0fb47033897e1c5c01af54  Data\Audio\speech\Grandpa\excellent.wav
73e67beb6856b89fcff2e790bad245da  Data\Audio\speech\Grandpa\fatality.wav
6514325f4423e7199726fb168b973e58  Data\Audio\speech\Grandpa\fire.wav
6bb7d3bee8733e54dcfdaf86febff3d3  Data\Audio\speech\Grandpa\fireball.wav
b8c4798e49a0203ccd720c0ec7c1aa41  Data\Audio\speech\Grandpa\firstblood.wav
7f4d9844166ce288c17f3058112e2862  Data\Audio\speech\Grandpa\flawless.wav
0d5377779fbc5442717569f5d08b3693  Data\Audio\speech\Grandpa\goaway.wav
2462ef9d134326dd137012fbc0e4a955  Data\Audio\speech\Grandpa\grenade.wav
3ae4740e0f818d04fcf7b4557d51ec1c  Data\Audio\speech\Grandpa\happy2.wav
3c2f7333fb722fc786e718178b113417  Data\Audio\speech\Grandpa\happy3.wav
7f6e2d883cc2d6403250863286fb7ef0  Data\Audio\speech\Grandpa\hello.wav
ed266f09711a2e184ccc52b2a7002df1  Data\Audio\speech\Grandpa\hurry.wav
f5de309c457b48ca90996703440d4591  Data\Audio\speech\Grandpa\idle1.wav
93ec347ca9ff2f9fe3e6ec4249c25770  Data\Audio\speech\Grandpa\idle2.wav
32edf9dcaee4f2358d7cb373453b63d5  Data\Audio\speech\Grandpa\idle4.wav
2c27d3c9a86d4c46225d3c82c9a1dbdf  Data\Audio\speech\Grandpa\illgetyou.wav
3fc256d299314538f9d37c7542907efe  Data\Audio\speech\Grandpa\incoming.wav
d586393048bd24b729531b3b50dcbb23  Data\Audio\speech\Grandpa\jump1.wav
92aa6672087f5e4a82cf2bcc3ce1c750  Data\Audio\speech\Grandpa\jump2.wav
c493a06655f2dddf701ef2cb7bcc0e83  Data\Audio\speech\Grandpa\justyouwait.wav
1223b06d9e047dd43fb6024c176d51f0  Data\Audio\speech\Grandpa\kamikaze.wav
68cc2c75924459d59ab957f2ee4cba8a  Data\Audio\speech\Grandpa\laugh.wav
08483a7afc1632995627c27cfcf12f77  Data\Audio\speech\Grandpa\leavemealone.wav
74420c2ff3f45bb97eab977b5c058d49  Data\Audio\speech\Grandpa\loseloop.wav
98ec2f05f777fc1ad00c0df381bd0a80  Data\Audio\speech\Grandpa\missed.wav
31708a3f922e351cf10781dff89f2ac7  Data\Audio\speech\Grandpa\no.wav
faac135d692eadad6b5fba759274b4ff  Data\Audio\speech\Grandpa\ohdear.wav
ec3a24aa4edfd0b00e6f50a23af2201b  Data\Audio\speech\Grandpa\oinutter.wav
960f49c2b5f9ed39fcdebde4045c7bbe  Data\Audio\speech\Grandpa\oof1.wav
5374807ea4e3c0ac1a21b7942ab22982  Data\Audio\speech\Grandpa\oof2.wav
c92312077ebffad022d376ac5f18377f  Data\Audio\speech\Grandpa\oops.wav
6e677b0826743ec4bd6ee978b9fc3cfa  Data\Audio\speech\Grandpa\orders.wav
3f39af8c4d432ccdb646d104a0539307  Data\Audio\speech\Grandpa\ouch.wav
9cdbc6a26c543a6fa382c833ac181dde  Data\Audio\speech\Grandpa\ow1.wav
2780896c3de63c5ff534bc41963cef95  Data\Audio\speech\Grandpa\ow2.wav
8a3d394acbfe7593fc69446cbf493aaf  Data\Audio\speech\Grandpa\perfect.wav
1e28340540d4a1cc60e33700f8e47815  Data\Audio\speech\Grandpa\pray.wav
c12632a58df797d7df7fd2ba71f66298  Data\Audio\speech\Grandpa\relief.wav
69b123bbe6004cdbae6f233eff9acea1  Data\Audio\speech\Grandpa\revenge.wav
89078018389fc47330460e7492ab1e7f  Data\Audio\speech\Grandpa\runaway.wav
85c309c79e834980aa21048dc364b5d9  Data\Audio\speech\Grandpa\sad1.wav
b0d2f8d73b30235afb36c55b0129e6cc  Data\Audio\speech\Grandpa\sad2.wav
5c0bd71ee0b505b922074758f42050f9  Data\Audio\speech\Grandpa\scared1.wav
2a6e5ef8fc5aaef052b06d012341183a  Data\Audio\speech\Grandpa\scared2.wav
b06e80f0b1ed167c52b488e3ab4d7d85  Data\Audio\speech\Grandpa\stupid.wav
827ffdbfd83a58e04b237ee9fc1e7525  Data\Audio\speech\Grandpa\takecover.wav
39ff3e11f43327f3ad206943a39beb77  Data\Audio\speech\Grandpa\taunt1.wav
6449ab03f3813b2e989f59b1d6174d06  Data\Audio\speech\Grandpa\traitor.wav
c5a297541d62cb6d6dfac9bffe59e764  Data\Audio\speech\Grandpa\uhoh.wav
370b5f6dd28f18a95e5e2044b301784e  Data\Audio\speech\Grandpa\victory.wav
a28d22be21dcb70b48af154dc3430ec2  Data\Audio\speech\Grandpa\watchthis.wav
a5afd82e1ab93cc2db74f88efe0ae19b  Data\Audio\speech\Grandpa\whatthe.wav
bc82916c956ba42a00afbcfdd4e2ffd0  Data\Audio\speech\Grandpa\yessir.wav
f4a0ad29fd17bc72a8652303f1689147  Data\Audio\speech\Grandpa\youllregretthat.wav
7297d40cc17d44958ab611410792cc3a  Data\Audio\speech\Happy Days\amazing.wav
d8da68ae3ee3c260baa52e7356abe770  Data\Audio\speech\Happy Days\angry.wav
6d3ca357e372012be83ec4320ef8eed7  Data\Audio\speech\Happy Days\angry2.wav
598f4e87832dc101ac428a4ba4d03b4e  Data\Audio\speech\Happy Days\boring.wav
d2b2dc5826a2d1fd12e214705aa996c7  Data\Audio\speech\Happy Days\brilliant.wav
33dacc3f7438b2b8953b0de065df28d5  Data\Audio\speech\Happy Days\bummer.wav
267b92d13c9faacd122885004bb200c9  Data\Audio\speech\Happy Days\byebye.wav
6c6b525ef6175ef1cc23a33ef8d9086e  Data\Audio\speech\Happy Days\collect.wav
51a224d114ac2bc43103a3d5e0cb1efe  Data\Audio\speech\Happy Days\comeonthen.wav
3e0aad2bfa2cd1cc9e9c6ed95c5c991b  Data\Audio\speech\Happy Days\coward.wav
671476a7303a30c62a067f81bcf9b70c  Data\Audio\speech\Happy Days\dragonpunch.wav
49a4f1c63015e9e1d8e22a8e4fada2f2  Data\Audio\speech\Happy Days\drop.wav
cf576f0531128ef856d8518cc46eb79b  Data\Audio\speech\Happy Days\excellent.wav
c785d43ba10cfcfd7efdddcd252c9742  Data\Audio\speech\Happy Days\fatality.wav
83b12fa7c197a027c39f4959b313983d  Data\Audio\speech\Happy Days\fire.wav
345fcf7725a990e0a90acc8279b72a51  Data\Audio\speech\Happy Days\fireball.wav
a7f4c8ea469be087089ded8ea3edb9c9  Data\Audio\speech\Happy Days\firstblood.wav
c032b6146bfd8bbdc757d528b8d27696  Data\Audio\speech\Happy Days\flawless.wav
37735e0d9a4d1ea8972c3c29248c7bbf  Data\Audio\speech\Happy Days\goaway.wav
a447baa6c49a9fb37acdb40ac9a272f0  Data\Audio\speech\Happy Days\grenade.wav
b756c0c6aadee0168189700b95b8cf3c  Data\Audio\speech\Happy Days\happy2.wav
969da61c452750cee38a16bab56411bb  Data\Audio\speech\Happy Days\happy3.wav
8daabdecc8b20b261ea5910d76fc1eb8  Data\Audio\speech\Happy Days\hello.wav
e53aae5189ac218dd63fb47e3bd71bed  Data\Audio\speech\Happy Days\hurry.wav
ab6969c9ff7acb92c329f8ca6a9e5031  Data\Audio\speech\Happy Days\idle1.wav
0feeff1973d8806a4e2f83e1f484b85c  Data\Audio\speech\Happy Days\idle2.wav
cf1e9b39f474129ceb43b5cd20d190f1  Data\Audio\speech\Happy Days\idle4.wav
2c098c7f7417bf8d1c3f416c218b42d6  Data\Audio\speech\Happy Days\illgetyou.wav
f6989bdec749a64062c632f2551ec325  Data\Audio\speech\Happy Days\incoming.wav
561706eb5422e09a6c92d8e4e2976644  Data\Audio\speech\Happy Days\jump1.wav
1b89ec974b955c6b7c6f4cc27304342c  Data\Audio\speech\Happy Days\jump2.wav
88e5118e6d4cff7275fe7f0f5b77c50f  Data\Audio\speech\Happy Days\justyouwait.wav
cd8373370e7a2e2eebf02b5d1c43d5d1  Data\Audio\speech\Happy Days\kamikaze.wav
5eaba233f38f0bed7d7ffd3806d03b02  Data\Audio\speech\Happy Days\laugh.wav
1e12b73345080f7023be56a44fbb84fc  Data\Audio\speech\Happy Days\leavemealone.wav
92715f6d9b6c08ddb914ada8e46570d8  Data\Audio\speech\Happy Days\loseloop.wav
28218c0eec06f549d4bac3f2e1996945  Data\Audio\speech\Happy Days\missed.wav
b9429d77d340f8462e7ab0eb64a20f5b  Data\Audio\speech\Happy Days\no.wav
2ff7b851e63b46d318022ebd544c2beb  Data\Audio\speech\Happy Days\ohdear.wav
3107b57515b8fe339d432685af1c0657  Data\Audio\speech\Happy Days\oinutter.wav
53632f8acc2abb2cf5ddd142356b68f7  Data\Audio\speech\Happy Days\oof1.wav
a9826d7c937348d3260e20deffff25f0  Data\Audio\speech\Happy Days\oof2.wav
979ba18200966b97943f8957c0def8ba  Data\Audio\speech\Happy Days\oops.wav
53a19d072b2742c3ddef56ad90187e42  Data\Audio\speech\Happy Days\orders.wav
8231d7f352beb5d89d0dc75f4fa19115  Data\Audio\speech\Happy Days\ouch.wav
cbf5cfab16b398e7796d23565509f60d  Data\Audio\speech\Happy Days\ow1.wav
42aeb20aafb00d74277bddadc9e9cf5e  Data\Audio\speech\Happy Days\ow2.wav
2a90cc00efbcea2fef9f376d1d9232de  Data\Audio\speech\Happy Days\perfect.wav
175f9854f06b3ba216a308bdf2156f47  Data\Audio\speech\Happy Days\pray.wav
86f083bd831142f92c601ec49b9ce063  Data\Audio\speech\Happy Days\relief.wav
ff3f8be41e652e8b5215acaa307a86ef  Data\Audio\speech\Happy Days\revenge.wav
9f7a09a8e2420367d98c7bb195c8a795  Data\Audio\speech\Happy Days\runaway.wav
0568e6ebd2499ec1c82d7683fe20a79e  Data\Audio\speech\Happy Days\sad1.wav
168fbb6fb15a511d247d5dbf3ae665c0  Data\Audio\speech\Happy Days\sad2.wav
4bf5b907f5227e8f90a2b34f90138576  Data\Audio\speech\Happy Days\scared1.wav
8380f0eec743fed659a2f30e0cbf4177  Data\Audio\speech\Happy Days\scared2.wav
d8d60d8fc773e65ce2820c7e28724731  Data\Audio\speech\Happy Days\stupid.wav
75449b0593c40dfbbe3cbbe850cc1ce7  Data\Audio\speech\Happy Days\takecover.wav
1994c379f34770c74ff84ba214d2b4c0  Data\Audio\speech\Happy Days\taunt1.wav
b9117fe73243f349f465fd3b6184dae7  Data\Audio\speech\Happy Days\traitor.wav
015b7b963a966debd82f0188be6cb2b1  Data\Audio\speech\Happy Days\uhoh.wav
e9bd64a36bd73d986038abb2dea8b683  Data\Audio\speech\Happy Days\victory.wav
40a627e30c24466b4c96371330a9069f  Data\Audio\speech\Happy Days\watchthis.wav
0b70bff628ded93e18c747438b072071  Data\Audio\speech\Happy Days\whatthe.wav
f10fbc608683c51258fe148094a3c079  Data\Audio\speech\Happy Days\yessir.wav
72ba70a704847a287261090080f2c404  Data\Audio\speech\Happy Days\youllregretthat.wav
c7f2aac3104d64eae19a02b332b5ee87  Data\Audio\speech\Hippy\amazing.wav
659531dfb03bab612baa0b6a7b083dfc  Data\Audio\speech\Hippy\angry.wav
a816cc99b3b974dc1cf1660cb91c5fb0  Data\Audio\speech\Hippy\angry2.wav
87b963d935e6b5eab8b81afb44cf9ccf  Data\Audio\speech\Hippy\boring.wav
ab21eb0229d99a50c5ad5b3dca553e6b  Data\Audio\speech\Hippy\brilliant.wav
7f1f4b1f0e1571a5b2a9d2c45d197aae  Data\Audio\speech\Hippy\bummer.wav
561de7810146bd3f352f7a1979254675  Data\Audio\speech\Hippy\byebye.wav
da2772ee8b2b62e4f549b22fb1e7ece8  Data\Audio\speech\Hippy\collect.wav
71e52ac44662c2a22f02edc721455869  Data\Audio\speech\Hippy\comeonthen.wav
fdec6dd61b1df3a8d2b043a66df12592  Data\Audio\speech\Hippy\coward.wav
8da20e253289674413c71b971b3c5143  Data\Audio\speech\Hippy\dragonpunch.wav
e8295648e2cf80168539d99c6e5a4e7f  Data\Audio\speech\Hippy\drop.wav
1ddb9677b9923dccf260738a9eeca5f6  Data\Audio\speech\Hippy\excellent.wav
40ac982118853525a534409addd4898c  Data\Audio\speech\Hippy\fatality.wav
03ce59051056a73046261712b339eaea  Data\Audio\speech\Hippy\fire.wav
49940848bb570ad79d3cf5687d8f356b  Data\Audio\speech\Hippy\fireball.wav
47f03ad605dd4dad5f387f7df624627c  Data\Audio\speech\Hippy\firstblood.wav
9d92af93537a2d916816d0daa00ff2fb  Data\Audio\speech\Hippy\flawless.wav
99ad519836daaf648e9ef2a002fde207  Data\Audio\speech\Hippy\goaway.wav
6feac600e9ba6f2fb24aa4d3c878525f  Data\Audio\speech\Hippy\grenade.wav
cab3762f1b11bb334d8e19b1292440cd  Data\Audio\speech\Hippy\happy2.wav
1b12b688c1742bcca24bdddcf0db7412  Data\Audio\speech\Hippy\happy3.wav
91eb83f79f11aaf6a65f890493d70a2f  Data\Audio\speech\Hippy\hello.wav
384fa59823c1dba975c00fd26f3b4310  Data\Audio\speech\Hippy\hurry.wav
1cc239a79925348f4ef8b4893686c906  Data\Audio\speech\Hippy\idle1.wav
5959f09f0244e4faec3e614d9a0ebf68  Data\Audio\speech\Hippy\idle2.wav
aba8bd2f03eb0a1e2627e398638dc63f  Data\Audio\speech\Hippy\idle4.wav
2d31e6235851e00e8c10b8097635c58b  Data\Audio\speech\Hippy\illgetyou.wav
b966655d7f836c363fcd2c4f7025993d  Data\Audio\speech\Hippy\incoming.wav
d4d341397504452d23b40e249a77bae1  Data\Audio\speech\Hippy\jump1.wav
8871a33492a6bdc26c4f01229eacb4a1  Data\Audio\speech\Hippy\jump2.wav
d1ac6999a6aa860467de89733460be43  Data\Audio\speech\Hippy\justyouwait.wav
36a4797a0e03a37113b46029ace5ed9d  Data\Audio\speech\Hippy\kamikaze.wav
62c0a55fe2cb3c432acfe5ec97a454b2  Data\Audio\speech\Hippy\laugh.wav
1224f39fbf2cf85ab45b040e58d8d46d  Data\Audio\speech\Hippy\leavemealone.wav
ab6badf31a980973c5885e14d66ae31f  Data\Audio\speech\Hippy\loseloop.wav
38caaf3c106c10c49d3cc5fc1edafb99  Data\Audio\speech\Hippy\missed.wav
cafb21eef05e9523dd3efb6b011c0008  Data\Audio\speech\Hippy\no.wav
fb67af29edeb8155c2a92669b1758bec  Data\Audio\speech\Hippy\ohdear.wav
282b5e37c06cc5749c96fd3e5a816dee  Data\Audio\speech\Hippy\oinutter.wav
c2838512a0e99d073232a6aded9a7840  Data\Audio\speech\Hippy\oof1.wav
3180af44ab43a6a3c05025fed5cb124f  Data\Audio\speech\Hippy\oof2.wav
d79d06a8fb4f1257013ea7499db49b72  Data\Audio\speech\Hippy\oops.wav
d2fafdebf9d9531226c5607c07e1eb02  Data\Audio\speech\Hippy\orders.wav
b2cbaa9fea8a8b2fb61c616a08ab4b8e  Data\Audio\speech\Hippy\ouch.wav
b923565dd4ad2fd8eade955e7c89769c  Data\Audio\speech\Hippy\ow1.wav
ffc9b0a4363d1f9cefe0b548242729e5  Data\Audio\speech\Hippy\ow2.wav
6206e348a34c4daf5e73630e93000927  Data\Audio\speech\Hippy\perfect.wav
fdd6e379e870771c9f60ce05b95f4901  Data\Audio\speech\Hippy\pray.wav
aa12afcd739463ad26016a27d828859c  Data\Audio\speech\Hippy\relief.wav
ec0c2d61b870a9927be4b5aae373ae3c  Data\Audio\speech\Hippy\revenge.wav
70fd25ec92ed0586f855f19cefc09761  Data\Audio\speech\Hippy\runaway.wav
c0ddde4bfd6841b3d2b2e5e95f3a9242  Data\Audio\speech\Hippy\sad1.wav
e954af5aeaa6fe5c59e0028b3a8af78b  Data\Audio\speech\Hippy\sad2.wav
f0b82c6af20cc3f68495886ebc3be9c1  Data\Audio\speech\Hippy\scared1.wav
eae59b61d2a43a17ac94d2249d99e2cb  Data\Audio\speech\Hippy\scared2.wav
b9e4767165c2d7af436b35d7e3022aab  Data\Audio\speech\Hippy\stupid.wav
996acea180b1aa396f22544e23aea925  Data\Audio\speech\Hippy\takecover.wav
ce75f79681904192576fc4b792d00c5c  Data\Audio\speech\Hippy\taunt1.wav
476494c5074d6740bb102dd541d852d6  Data\Audio\speech\Hippy\traitor.wav
20507bfac1ed26a20bc38bd867175772  Data\Audio\speech\Hippy\uhoh.wav
e9fad62587f7fc33f2e41b381e89d583  Data\Audio\speech\Hippy\victory.wav
d4657887cd2c6c222b043a0422050d8a  Data\Audio\speech\Hippy\watchthis.wav
94eee88ec9d2c5efe543b0898322d97e  Data\Audio\speech\Hippy\whatthe.wav
a72dab687e3415c0f056594b912b02f2  Data\Audio\speech\Hippy\yessir.wav
6092708c0e718112a8fbfceea72f32dd  Data\Audio\speech\Hippy\youllregretthat.wav
602245cd48a0f0a77eade817cefccf59  Data\Audio\speech\Horror\amazing.wav
45d1a051b4259759fbb6abf9dce61f7d  Data\Audio\speech\Horror\angry.wav
5a27685aad077996a5f632fcbe6583b1  Data\Audio\speech\Horror\angry2.wav
67de157cd92ed0f8ad4c4e975ba27a6d  Data\Audio\speech\Horror\boring.wav
132482af06c41583220f7448da9d58d9  Data\Audio\speech\Horror\brilliant.wav
4d5faa474cefae39b8b37c5bfcba0cae  Data\Audio\speech\Horror\bummer.wav
e1b57d119cb452cb6fda3e1274f0a6cb  Data\Audio\speech\Horror\byebye.wav
c46c6d4b5a49216305f8a2b60297d644  Data\Audio\speech\Horror\collect.wav
68c7246cfa2abb15e28d0c4a54e5df7a  Data\Audio\speech\Horror\comeonthen.wav
bcd329dc994204339fa56052a5b64d52  Data\Audio\speech\Horror\coward.wav
e298716bdc21c4a40284b840e3e3ffc5  Data\Audio\speech\Horror\dragonpunch.wav
78deabd356b607d28e092b4e3c1157e0  Data\Audio\speech\Horror\drop.wav
03aaf03a498a103df7d4f668a05a38a3  Data\Audio\speech\Horror\excellent.wav
0a2c36620bbe1f6dfce6dbf75b161a4b  Data\Audio\speech\Horror\fatality.wav
baaef9d92153ef23bcfbea185348b1e5  Data\Audio\speech\Horror\fire.wav
3a6d62af1d62e59f495dc81cecd77a95  Data\Audio\speech\Horror\fireball.wav
31c2e0034a98c515d4d1379331014773  Data\Audio\speech\Horror\firstblood.wav
975efc3405880ed65269585af9478e88  Data\Audio\speech\Horror\flawless.wav
fd19d8beeecbbd0194b7607ec7c7bb72  Data\Audio\speech\Horror\goaway.wav
f2dad3c403953c3a045d05b32ad1b9be  Data\Audio\speech\Horror\grenade.wav
71bc81205641a3caba52c99fea63e697  Data\Audio\speech\Horror\happy2.wav
c0a1c655beeb0759b796f1305c0fda02  Data\Audio\speech\Horror\happy3.wav
3816d268fecf361b646d6978a53a69e1  Data\Audio\speech\Horror\hello.wav
1be840a642cba9ba267d69b4dc4e9ec8  Data\Audio\speech\Horror\hurry.wav
be062996932635d3cda865d2e54ce2c2  Data\Audio\speech\Horror\idle1.wav
c41782fc1b915c18ad65eeda793e1732  Data\Audio\speech\Horror\idle2.wav
0a2aed6d8902717f693bdac3a5e2334f  Data\Audio\speech\Horror\idle4.wav
7cbc9112e0f5df2d011e3d3d76c66960  Data\Audio\speech\Horror\illgetyou.wav
e5b8048497dcab9f8f7db9b0ea368dbb  Data\Audio\speech\Horror\incoming.wav
4db2d9842a0aa77af2a8b6bf8c358a4b  Data\Audio\speech\Horror\jump1.wav
5dc0f7f30a238284e864f6cc06d542dc  Data\Audio\speech\Horror\jump2.wav
a2b06dade013cdaff1a41c7bee2cc1a4  Data\Audio\speech\Horror\justyouwait.wav
edf8eff33e4bd66f1c7bc59e8a430c8d  Data\Audio\speech\Horror\kamikaze.wav
8a52f6908a9ec9071867603481b6f656  Data\Audio\speech\Horror\laugh.wav
7ce85629b37461871257cebf82a0367c  Data\Audio\speech\Horror\leavemealone.wav
1f68f1271c26a31038f859de45c63f4f  Data\Audio\speech\Horror\loseloop.wav
9dafcfd44c2874dd2645ca3b488d3d0d  Data\Audio\speech\Horror\missed.wav
6b2539e02db4d92b935299d34d532d5a  Data\Audio\speech\Horror\no.wav
c3ba97648f8f8081858a364b50250ca7  Data\Audio\speech\Horror\ohdear.wav
f7ca2e579beefe6cd1d43f5f701a9a70  Data\Audio\speech\Horror\oinutter.wav
56ccf8b42412fb5dc42ce2085b9480be  Data\Audio\speech\Horror\oof1.wav
0e529b7500dd3a56e74f81fae000d5b9  Data\Audio\speech\Horror\oof2.wav
9b94354fbd7eb37463328437ddc45cd5  Data\Audio\speech\Horror\oops.wav
a17d2c2fa41c85f0aa9f205c17348192  Data\Audio\speech\Horror\orders.wav
7cbcd6a1797077d3c47638004494e819  Data\Audio\speech\Horror\ouch.wav
555cc3db46f8aedb2c6af0223d30f3f0  Data\Audio\speech\Horror\ow1.wav
8c6d313f40b992e4908bae361767b7fc  Data\Audio\speech\Horror\ow2.wav
b2185364f49a36e5123f364e45c26cd4  Data\Audio\speech\Horror\perfect.wav
66a020945200f01d5867bc28e41262b2  Data\Audio\speech\Horror\pray.wav
e47810574ba8f734c0556f995cb76628  Data\Audio\speech\Horror\relief.wav
3475a24456a60e3fd9b382e5458aa197  Data\Audio\speech\Horror\revenge.wav
ea778583c1565cbe3f478ef004e66c80  Data\Audio\speech\Horror\runaway.wav
6383589bf980f41803925e9f8fdab842  Data\Audio\speech\Horror\sad1.wav
a9f6c36c8cd96910035c884466867a26  Data\Audio\speech\Horror\sad2.wav
f706c3d6108a83397e3d93b76ced992e  Data\Audio\speech\Horror\scared1.wav
5f9c111db2ce1e49d7fe8ab443d4f397  Data\Audio\speech\Horror\scared2.wav
0e70554bbb32bc48b71b952f0fb4e767  Data\Audio\speech\Horror\stupid.wav
6bb371c0e278f8c81300547c548e37e3  Data\Audio\speech\Horror\takecover.wav
0b9e1384479526b3828072a7dbbd1975  Data\Audio\speech\Horror\taunt1.wav
b0c4c19a84937834809cb0d188ff071b  Data\Audio\speech\Horror\traitor.wav
f7890f07e046aff97bc428bc105af119  Data\Audio\speech\Horror\uhoh.wav
6319e793e9b97665de9fd74d65ce74ee  Data\Audio\speech\Horror\victory.wav
e7d303b595d7a5409ca1b7ac3699c1a9  Data\Audio\speech\Horror\watchthis.wav
2f528087c1d1c549a9dbeb1d88171652  Data\Audio\speech\Horror\whatthe.wav
46a850f7217f81611afc6de772ec4fe4  Data\Audio\speech\Horror\yessir.wav
4afce781a1364ad0eca3a10679b6a822  Data\Audio\speech\Horror\youllregretthat.wav
4c43942bdba7427573312172af98f786  Data\Audio\speech\Irish\amazing.wav
86ec9de5e4b717c3c0b31f2c4a93afdd  Data\Audio\speech\Irish\angry.wav
ff3606e86d60f0abdc2afac838196cb7  Data\Audio\speech\Irish\angry2.wav
53f9f0460c41342984dc580e611b4082  Data\Audio\speech\Irish\boring.wav
e7db6d21364163df6e58a5082c83f875  Data\Audio\speech\Irish\brilliant.wav
cfd908e3984f98ea4fc65de1aee3fa08  Data\Audio\speech\Irish\bummer.wav
f04830cd82588604a4bdef9e375e67c5  Data\Audio\speech\Irish\byebye.wav
2b96959e0e87c749979551f4b7c8c2f6  Data\Audio\speech\Irish\collect.wav
f8103d5c81c61130733b38042f201981  Data\Audio\speech\Irish\comeonthen.wav
c28260b8c1fb4d2cd9a0d9424ce3165a  Data\Audio\speech\Irish\coward.wav
7af5d0e751ff98a2a69def2ca9495c84  Data\Audio\speech\Irish\dragonpunch.wav
ae9c631bbf4c6e0e1a64c5320e0ff036  Data\Audio\speech\Irish\drop.wav
6c1823d42a0e4013f4d1e10bdf8fad8c  Data\Audio\speech\Irish\excellent.wav
67447a6d87edfe58ba1efe942f687bff  Data\Audio\speech\Irish\fatality.wav
9fde2ef13426fce2dda9f4dc0728321d  Data\Audio\speech\Irish\fire.wav
5b00715c80953dcb54d7c9cda2aa95a6  Data\Audio\speech\Irish\fireball.wav
5a52cbaa3c59629719dfc9219dbe8468  Data\Audio\speech\Irish\firstblood.wav
4b97e36fb80449c5232cbbdebfd3e467  Data\Audio\speech\Irish\flawless.wav
3535269a0470e2edcbb5c4f979f13eba  Data\Audio\speech\Irish\goaway.wav
4c808d77067d7bc0a35bad3dc2d035bf  Data\Audio\speech\Irish\grenade.wav
e5a7d2651b90230cc13e92d01cc95d2f  Data\Audio\speech\Irish\happy2.wav
a5ef4e3272f01082ed40295e54969789  Data\Audio\speech\Irish\happy3.wav
a32a7194b8468c4cd6a0f19777fcdddf  Data\Audio\speech\Irish\hello.wav
45fc85359b039a66b8d5ada736055fda  Data\Audio\speech\Irish\hurry.wav
64c1a93bd548b41ae3d3e5df3a3d145d  Data\Audio\speech\Irish\idle1.wav
755c7b2b9553579aa101a539b07fd493  Data\Audio\speech\Irish\idle2.wav
0bb875a986761062e62868a4b3a451cc  Data\Audio\speech\Irish\idle4.wav
e2ba99b1a3544de7df8f1cf3e09ec21f  Data\Audio\speech\Irish\illgetyou.wav
25619c47a0dca20dba81b3b0b7d41bf2  Data\Audio\speech\Irish\incoming.wav
bb8dd949e26beb633c74a553de3cd41b  Data\Audio\speech\Irish\jump1.wav
424c58ed3d8e59914d1ba226c829675c  Data\Audio\speech\Irish\jump2.wav
77b5a7a65f424c65a8fb1c60bc6cf03b  Data\Audio\speech\Irish\justyouwait.wav
94ce39c18928bebf440795ede211d9f3  Data\Audio\speech\Irish\kamikaze.wav
55f445d8fa0970fd5409d889c13d35b3  Data\Audio\speech\Irish\laugh.wav
aec672a8d72c682c35993233f7acaa30  Data\Audio\speech\Irish\leavemealone.wav
eace1e7d0eb297c7089ebf7095d592dd  Data\Audio\speech\Irish\loseloop.wav
ab4215f7fbabc1637f6e5bb9f160f91f  Data\Audio\speech\Irish\missed.wav
4d3ad62b3f8ec9494c9a62f8dc7e18bd  Data\Audio\speech\Irish\no.wav
1e8e6f1668a19c49ff96344d6c07c83e  Data\Audio\speech\Irish\ohdear.wav
af7bd7cbeba63c9a6c6db48c86387611  Data\Audio\speech\Irish\oinutter.wav
f13ab794264622b2b96a4ef4e697d739  Data\Audio\speech\Irish\oof1.wav
8d2f22ccd2e37339231e678eb9eced63  Data\Audio\speech\Irish\oof2.wav
8af879761878efbcaf9457962f16a8d8  Data\Audio\speech\Irish\oops.wav
b773199c8276d52ad539bbc37693c01c  Data\Audio\speech\Irish\orders.wav
73bd0972bf78033b4bfdeda10a81f597  Data\Audio\speech\Irish\ouch.wav
687a9f29cc79c00ca86e2942d51eeee0  Data\Audio\speech\Irish\ow1.wav
61d81806d3e3ccfd6485c77eb78eb4d9  Data\Audio\speech\Irish\ow2.wav
699a7548682d1d0ca8c705ad934288b8  Data\Audio\speech\Irish\perfect.wav
9ae49722c9c7d88f1dbbec1b2304ead3  Data\Audio\speech\Irish\pray.wav
2ad594fef121902fd623f1c8e9e19b94  Data\Audio\speech\Irish\relief.wav
ed308ac0a4721e2c81ef383e5f8c5b72  Data\Audio\speech\Irish\revenge.wav
e634c8a14cce3e09500be0c79d01f4e8  Data\Audio\speech\Irish\runaway.wav
bdfcd2bd2faca726d644055f0c62795d  Data\Audio\speech\Irish\sad1.wav
5c376a86eeba4dc6b62ed895b7d9700c  Data\Audio\speech\Irish\sad2.wav
6bb0ef5d097cfd3b2f8d154d80a99fca  Data\Audio\speech\Irish\scared1.wav
910da949024437e1725994edd523c90f  Data\Audio\speech\Irish\scared2.wav
03b24197def58595a012917f7d3905b4  Data\Audio\speech\Irish\stupid.wav
9c4e00b8a34933e54d3a6dd15a2be10e  Data\Audio\speech\Irish\takecover.wav
02994a9093ea3bbc25e6fb5e745bbdd1  Data\Audio\speech\Irish\taunt1.wav
96ca85c39152225e8d0e2238e91e58ec  Data\Audio\speech\Irish\traitor.wav
290ccb286e52ac71d71c61d5a7369bb9  Data\Audio\speech\Irish\uhoh.wav
a1b13e33233b5f8952f7eeee4cb21104  Data\Audio\speech\Irish\victory.wav
ef6c4b76ad0a5071d78ec1be58bbd75d  Data\Audio\speech\Irish\watchthis.wav
74e69edaa6e7c38f1f8f1b9c9675d66f  Data\Audio\speech\Irish\whatthe.wav
bb64ec23451d00f20f43ba5b3cbd9c4d  Data\Audio\speech\Irish\yessir.wav
fe889e165cd40c29c2f2b64b9d253ff1  Data\Audio\speech\Irish\youllregretthat.wav
67ea3378f036c8659b0afe51fc9d13e4  Data\Audio\speech\Italian\amazing.wav
c8ccbc63fc58eca060035f464fe970a3  Data\Audio\speech\Italian\angry.wav
b8067e0362605474d0f585af76c44523  Data\Audio\speech\Italian\angry2.wav
00b52d14a39e16ea58945fd5129f1510  Data\Audio\speech\Italian\boring.wav
3bdc5edad75f61df84a62fcf2879bf75  Data\Audio\speech\Italian\brilliant.wav
8648e9e5578c3d12059f0dc4aba70837  Data\Audio\speech\Italian\bummer.wav
a5e974731aa90ff987e5af5eeda37971  Data\Audio\speech\Italian\byebye.wav
201d17513ee786724aea930668e016f9  Data\Audio\speech\Italian\collect.wav
06ae5e1ed608f59d84b023de2ae24d58  Data\Audio\speech\Italian\comeonthen.wav
5634151d9d41ad40ff12b2aad2abf668  Data\Audio\speech\Italian\coward.wav
2e79e00d2d2a9f824a84665801a41830  Data\Audio\speech\Italian\dragonpunch.wav
241e21acbd8846e4b05eefad89662496  Data\Audio\speech\Italian\drop.wav
ed1ef90c42b5fc95f6211e28421e1421  Data\Audio\speech\Italian\excellent.wav
cc9be3e7fac95003436a9317d03e343a  Data\Audio\speech\Italian\fatality.wav
540953c72f6df8fc463f5cc9443a43f0  Data\Audio\speech\Italian\fire.wav
2a52079a14d06ceaf178b5d512446a7f  Data\Audio\speech\Italian\fireball.wav
2c11cdc5db832ce1013f812392159255  Data\Audio\speech\Italian\firstblood.wav
a37289cc9a45028f85f4897c48fe14ef  Data\Audio\speech\Italian\flawless.wav
44b8ae4fd44101a3231380b4c84152a3  Data\Audio\speech\Italian\goaway.wav
cb9032745cde8c28b719bb756cc41938  Data\Audio\speech\Italian\grenade.wav
87875399c14973e0bbaa2e8f29b484d6  Data\Audio\speech\Italian\happy2.wav
375d6ed5a320faf680b3f728cd54fc3c  Data\Audio\speech\Italian\happy3.wav
d291d3e3c7b8a2535545262937bbd572  Data\Audio\speech\Italian\hello.wav
55774e3fa4b0a8bc6c0882bbcf948b8d  Data\Audio\speech\Italian\hurry.wav
d74044cf04cf626f5279134a8f5fa83c  Data\Audio\speech\Italian\idle1.wav
a2eaea38bc402ddbb3fadc18091227f8  Data\Audio\speech\Italian\idle2.wav
9efa92871e933e8a9df54eead7920ce6  Data\Audio\speech\Italian\idle4.wav
031b67a8829e542e6e0996a754c5d662  Data\Audio\speech\Italian\illgetyou.wav
a5d76dea8c59d48dff9e075c9cf4d135  Data\Audio\speech\Italian\incoming.wav
c35b47835522c00ec1ad7cc414174a84  Data\Audio\speech\Italian\jump1.wav
0c92ec18c12c1fc96636eba6a6fbfdc2  Data\Audio\speech\Italian\jump2.wav
fc4dcd5a3938158e570bdc37824971fb  Data\Audio\speech\Italian\justyouwait.wav
8d5880a0a927e9076bd7a1ae12b9190b  Data\Audio\speech\Italian\kamikaze.wav
f874f36c50710b4333ca4db1feda1978  Data\Audio\speech\Italian\laugh.wav
06c4b432517a40b324beeb0d1cb6214e  Data\Audio\speech\Italian\leavemealone.wav
eaadac0830e0d0037c68e7a191f7614c  Data\Audio\speech\Italian\loseloop.wav
58cf3fa7725d94c75643949ba2845e20  Data\Audio\speech\Italian\missed.wav
834f5998a040fba624336f13a399d15d  Data\Audio\speech\Italian\no.wav
5d54356e054c794f4db95e0dccb6759e  Data\Audio\speech\Italian\ohdear.wav
44047673494acfed203849a27e02aef5  Data\Audio\speech\Italian\oinutter.wav
158af4c1a3c845dfa61d5fa55a873c81  Data\Audio\speech\Italian\oof1.wav
4073de3e4bbe4b64f0ab4614958067eb  Data\Audio\speech\Italian\oof2.wav
6e477b89575a38bdff6f3e02517a0fc0  Data\Audio\speech\Italian\oops.wav
cc9122c2510d39fd832b2e6ff54ac6da  Data\Audio\speech\Italian\orders.wav
c333f3709be999bff425a63a9f958e24  Data\Audio\speech\Italian\ouch.wav
325cee0e93cc6fac2a653e38871792b0  Data\Audio\speech\Italian\ow1.wav
1ba6cc20ca54a5bf07d3079ac7fcc0c4  Data\Audio\speech\Italian\ow2.wav
52388722fceff6f7d67000c9c5380e61  Data\Audio\speech\Italian\perfect.wav
ea2366d85e7cb516b933b3e0bf652d21  Data\Audio\speech\Italian\pray.wav
3400afacadf1d1d24046551614033667  Data\Audio\speech\Italian\relief.wav
680a5a601ae9f210fb39b984faf16441  Data\Audio\speech\Italian\revenge.wav
3be444dca2e7caefa21aa23790a1c5e4  Data\Audio\speech\Italian\runaway.wav
c7a2d5b5ad29b95c741bb9f6230c1c52  Data\Audio\speech\Italian\sad1.wav
eb1798916b3c68d59973d8eca11d658a  Data\Audio\speech\Italian\sad2.wav
83aa64012f068601392382d8afffeb6c  Data\Audio\speech\Italian\scared1.wav
77ead74534c8f293dfc8387b4cab3897  Data\Audio\speech\Italian\scared2.wav
f12a783b505121e7c6c69e2065a27346  Data\Audio\speech\Italian\stupid.wav
f50f755dc75ee9bd980d6c5b55ff818a  Data\Audio\speech\Italian\takecover.wav
f2a41fc3fc14b6a77affc88db723566b  Data\Audio\speech\Italian\taunt1.wav
24de5b28273d756c13b835262f8dba9e  Data\Audio\speech\Italian\traitor.wav
0547105306a7fe972e754ef3064c5319  Data\Audio\speech\Italian\uhoh.wav
0ca62084c3b13d8da0bd14298788efbd  Data\Audio\speech\Italian\victory.wav
ac5531ade301086224370dc5024feebc  Data\Audio\speech\Italian\watchthis.wav
40866ab72a562b088edd7188b9ceb2d9  Data\Audio\speech\Italian\whatthe.wav
ac7c9efb1ab20d87865700e275e8b055  Data\Audio\speech\Italian\yessir.wav
e703b5b43c8b980a7829b04bf11a25e6  Data\Audio\speech\Italian\youllregretthat.wav
7054bada5613f3b7df2a331d82718dc8  Data\Audio\speech\London Cabbie\amazing.wav
0d53e7ce3326553f1c96aca516d41d53  Data\Audio\speech\London Cabbie\angry.wav
42b7b87d139f5ba7aab4516f175e0144  Data\Audio\speech\London Cabbie\angry2.wav
29ee1ca842212b99137f0fa402f79084  Data\Audio\speech\London Cabbie\boring.wav
f1aea2735162d82e4c880efffec561f5  Data\Audio\speech\London Cabbie\brilliant.wav
f1cd2c083e42f2c5db454b5cb371abc9  Data\Audio\speech\London Cabbie\bummer.wav
b773a1e339253b8dbf32f437a5eebdab  Data\Audio\speech\London Cabbie\byebye.wav
2c8ac0430c967837aa11c775e258dac4  Data\Audio\speech\London Cabbie\collect.wav
0420503bec94657a84e58e5cb51ba98a  Data\Audio\speech\London Cabbie\comeonthen.wav
3295d009f69a5c0402a921b387859657  Data\Audio\speech\London Cabbie\coward.wav
ea54775c2469e495abf766e5008ccb2d  Data\Audio\speech\London Cabbie\dragonpunch.wav
27baf90bb4480c805cf914242aa92e20  Data\Audio\speech\London Cabbie\drop.wav
9e484f914ec87a2b2217a0a27207e3e3  Data\Audio\speech\London Cabbie\excellent.wav
fac6341721b495d5c5246475de8b0708  Data\Audio\speech\London Cabbie\fatality.wav
688f4326eeda5947cc9b45be550b16ae  Data\Audio\speech\London Cabbie\fire.wav
c38550b8617c3e67de0a2c9d2e4a1a40  Data\Audio\speech\London Cabbie\fireball.wav
a9249ad895a2982d2c7feac468583c9f  Data\Audio\speech\London Cabbie\firstblood.wav
398f36f7bb0f43fa127c4f6e5d402288  Data\Audio\speech\London Cabbie\flawless.wav
164c630e9113d46337715c81c8d79262  Data\Audio\speech\London Cabbie\goaway.wav
f209df3634aa0f9d351b02f51f8c3547  Data\Audio\speech\London Cabbie\grenade.wav
4fbf3ea1269546cd1dc049ac4a939a8d  Data\Audio\speech\London Cabbie\happy2.wav
62e2b8b284c53ef28519abd5e5be90b7  Data\Audio\speech\London Cabbie\happy3.wav
08bc03057f079e38a621e931965b10f3  Data\Audio\speech\London Cabbie\hello.wav
949051d09dffd6e685c8ffb54379b0e2  Data\Audio\speech\London Cabbie\hurry.wav
9224852d0862d86af7bac74a5832f6c9  Data\Audio\speech\London Cabbie\idle1.wav
8a5c6fde775828004a976c9c1f0910d6  Data\Audio\speech\London Cabbie\idle2.wav
3462f423bb9bb3a6cf4256c122913f0f  Data\Audio\speech\London Cabbie\idle4.wav
e9e4486b2c9f0cf6d44681ec8094e001  Data\Audio\speech\London Cabbie\illgetyou.wav
17a420bc1270fcd0dab6e89ab5aaf543  Data\Audio\speech\London Cabbie\incoming.wav
9f248652fc09b8cf25af94fdbac1fa4b  Data\Audio\speech\London Cabbie\jump1.wav
473619b3a366fd0fb9f3104848e51a15  Data\Audio\speech\London Cabbie\jump2.wav
4e6f96145dce9b8d20c67d283ebfe8c3  Data\Audio\speech\London Cabbie\justyouwait.wav
61ec6832ec36d0734655558598dbe485  Data\Audio\speech\London Cabbie\kamikaze.wav
e127b0d64a8f103b7ef414020112b63d  Data\Audio\speech\London Cabbie\laugh.wav
c4e2bfc68e03193fddab5c52142da492  Data\Audio\speech\London Cabbie\leavemealone.wav
d41124c5a7d037686b4a8e12cf960217  Data\Audio\speech\London Cabbie\loseloop.wav
9c4fa80c3f2a54fc9a886cab7358eeb2  Data\Audio\speech\London Cabbie\missed.wav
c24465a0c99d2dcb9df92e2d0eb1d7a3  Data\Audio\speech\London Cabbie\no.wav
93db866e08417902f88a6c156b6f0ba4  Data\Audio\speech\London Cabbie\ohdear.wav
c077f242f4b15e3e87b926fa093b9393  Data\Audio\speech\London Cabbie\oinutter.wav
2d7775390171e56f36fe1afed001674a  Data\Audio\speech\London Cabbie\oof1.wav
cbbac30639bb9f3062e6b2645827eb08  Data\Audio\speech\London Cabbie\oof2.wav
4d3c86cd7f59dbe4202ce89b30ff0c0f  Data\Audio\speech\London Cabbie\oops.wav
d357dabcef77dfdadf0345b681f95075  Data\Audio\speech\London Cabbie\orders.wav
f9ff7ea736127e480fb7d310e6fcf8f8  Data\Audio\speech\London Cabbie\ouch.wav
f1c3d2717feaa7b7a48994db4d22b7c5  Data\Audio\speech\London Cabbie\ow1.wav
052ca422d8fecb5679668f7a22ac988a  Data\Audio\speech\London Cabbie\ow2.wav
9faf8e3414fc56bc985565d4029a992d  Data\Audio\speech\London Cabbie\perfect.wav
c7bb0f9546f53c8f685578f89820b5fc  Data\Audio\speech\London Cabbie\pray.wav
e6148838bdef80f2fd23698b72179b48  Data\Audio\speech\London Cabbie\relief.wav
1d4c16b5f4e763d5b6ba2420aab03a9b  Data\Audio\speech\London Cabbie\revenge.wav
ca751cfa00013709221daf6b20b48088  Data\Audio\speech\London Cabbie\runaway.wav
0b8ea6e6ef3425087b5df2964f0d16d0  Data\Audio\speech\London Cabbie\sad1.wav
96de57b25e047659a9b35f63a2b868c2  Data\Audio\speech\London Cabbie\sad2.wav
953e8130ea650d387e39bfe00e160153  Data\Audio\speech\London Cabbie\scared1.wav
0d8a243a153acab7a2e34d88fb398d2c  Data\Audio\speech\London Cabbie\scared2.wav
562afc30bc025087b2f1b83090642546  Data\Audio\speech\London Cabbie\stupid.wav
cb6d340abc3afea0a0540f04fb931f96  Data\Audio\speech\London Cabbie\takecover.wav
7eb03a2005b5e26d4822d7aeec0afe91  Data\Audio\speech\London Cabbie\taunt1.wav
a719fef2b681a5733d1518a2822bbb51  Data\Audio\speech\London Cabbie\traitor.wav
ca982213c3e8ab1b24274fa3eca39930  Data\Audio\speech\London Cabbie\uhoh.wav
7b1225abe9c88f437c576e82227be32e  Data\Audio\speech\London Cabbie\victory.wav
350d831bf3cc495a89369b2d117932a0  Data\Audio\speech\London Cabbie\watchthis.wav
46212f0f20298371c27003dd9706af24  Data\Audio\speech\London Cabbie\whatthe.wav
d5dcb6b108addc2673921b10128842b2  Data\Audio\speech\London Cabbie\yessir.wav
1b6b66172913b75431486bbf280f2957  Data\Audio\speech\London Cabbie\youllregretthat.wav
b2681df3985fd2a1cef24bb7dca6263f  Data\Audio\speech\Madchester\amazing.wav
72bc2694cba64198ac8ae8d600f2bfc0  Data\Audio\speech\Madchester\angry.wav
a503af9942f2a1b3e51bff212c90947e  Data\Audio\speech\Madchester\angry2.wav
e033e9ff5ea92ab5aba614b93644e602  Data\Audio\speech\Madchester\boring.wav
3ceaaaf4dad7a0dcf94b58add62716a4  Data\Audio\speech\Madchester\brilliant.wav
41357c7566edf2fe257dbb3a13b779cd  Data\Audio\speech\Madchester\bummer.wav
85365deba879e386999e2c6cde873bbf  Data\Audio\speech\Madchester\byebye.wav
496636bab29818ef034faf2c4fce942f  Data\Audio\speech\Madchester\collect.wav
5cd8494cffd81a0d3c18432dee6fcc66  Data\Audio\speech\Madchester\comeonthen.wav
af6118041238b81b9be75755c1096e9f  Data\Audio\speech\Madchester\coward.wav
6cdb84e122d3026f7c7727864abfff17  Data\Audio\speech\Madchester\dragonpunch.wav
c1555ae3f90695b500e4e5c79a1b25bb  Data\Audio\speech\Madchester\drop.wav
cf68e2b5a19a07e0c29aec801abcbdee  Data\Audio\speech\Madchester\excellent.wav
203c2d1c15d4cb940fe178d3c19ade83  Data\Audio\speech\Madchester\fatality.wav
d2cada593c06eddad0761aa4179c66bd  Data\Audio\speech\Madchester\fire.wav
e1fcdd7e66168cdbadc37225ed85a33e  Data\Audio\speech\Madchester\fireball.wav
8ab671c35fabefbd2b67cebde59f5aea  Data\Audio\speech\Madchester\firstblood.wav
0c51994c5327dbc5a45f2f300cc318b1  Data\Audio\speech\Madchester\flawless.wav
c7cffc725cafe86edc970849fa5d2c42  Data\Audio\speech\Madchester\goaway.wav
ad6483120aabb86f279d2d184c203d62  Data\Audio\speech\Madchester\grenade.wav
1d26db37c544a8550f788065215799dc  Data\Audio\speech\Madchester\happy2.wav
4cf9ffff9238d009d6036e869d7c6a06  Data\Audio\speech\Madchester\happy3.wav
8744d309b612126acd1c702466e1fa70  Data\Audio\speech\Madchester\hello.wav
c82b1c7174810016b2688ca8a1e9d971  Data\Audio\speech\Madchester\hurry.wav
87f5d06b3fdfc4a9612f7f4720550fad  Data\Audio\speech\Madchester\idle1.wav
e20c6126ce7c4510ee5dbcba1b5be8dc  Data\Audio\speech\Madchester\idle2.wav
3b6a0f2c3aa8cc8e32d4211ce89f3ca5  Data\Audio\speech\Madchester\idle4.wav
396b35d14edea8e42793a9056bbba205  Data\Audio\speech\Madchester\illgetyou.wav
ed724a225b5a864d093543a8017081e6  Data\Audio\speech\Madchester\incoming.wav
434782350940c7feb7cf0594daf54074  Data\Audio\speech\Madchester\jump1.wav
006da4168e836b34c2131c154bb461dc  Data\Audio\speech\Madchester\jump2.wav
9003d247015f67383afc551dc485d14b  Data\Audio\speech\Madchester\justyouwait.wav
446c19849ca21addff332932457af3e4  Data\Audio\speech\Madchester\kamikaze.wav
88caeeca3e9be19298509463715be546  Data\Audio\speech\Madchester\laugh.wav
c97d3e2e0c8167be50c94b20ee544e73  Data\Audio\speech\Madchester\leavemealone.wav
5458c72ea7a62f719bcf9911751de2fd  Data\Audio\speech\Madchester\loseloop.wav
3fd3d27cfad95ce8a29a653c1e40916d  Data\Audio\speech\Madchester\missed.wav
6f04ca4581e089b2719b221b9e3e1b99  Data\Audio\speech\Madchester\no.wav
85deba66c0a3de8956831804f89ec52e  Data\Audio\speech\Madchester\ohdear.wav
cdce67bfdf6bbf05917af8211b1d1b22  Data\Audio\speech\Madchester\oinutter.wav
4ff9a3501e81e75d2306b8c734123956  Data\Audio\speech\Madchester\oof1.wav
fd00bf3a116bc701489cfe682d1c60df  Data\Audio\speech\Madchester\oof2.wav
a8789f13962a9f15e611424051c0ce20  Data\Audio\speech\Madchester\oops.wav
48ff510d260ec6d454df2c598497de9b  Data\Audio\speech\Madchester\orders.wav
332d82103da47a44410a28e9cbc88369  Data\Audio\speech\Madchester\ouch.wav
56936e134c56af4a0e23ba2f0b7d76ca  Data\Audio\speech\Madchester\ow1.wav
6e6018f252d64318e8f0405ee90a7e59  Data\Audio\speech\Madchester\ow2.wav
088e73c672ee3316c65c6503d7f65b73  Data\Audio\speech\Madchester\perfect.wav
5710ab51d00eeda7a1a94fd570079ce4  Data\Audio\speech\Madchester\pray.wav
693be8966ce089d0e57a541dd8e92160  Data\Audio\speech\Madchester\relief.wav
e5479b9ae2d80b0a55d73bd40ab0d02d  Data\Audio\speech\Madchester\revenge.wav
446c19849ca21addff332932457af3e4  Data\Audio\speech\Madchester\runaway.wav
7d22e22feee224b0c9fe21ac064b16fa  Data\Audio\speech\Madchester\sad1.wav
4e2ba4845343a06ef16ac5ee2fa9eb96  Data\Audio\speech\Madchester\sad2.wav
73e3214b8b6c435d4dfaa4b1f897ac9e  Data\Audio\speech\Madchester\scared1.wav
e249a9c4663688df43be32f6a7aa3847  Data\Audio\speech\Madchester\scared2.wav
6bc992c14fcc3b7e6f75faed2228d222  Data\Audio\speech\Madchester\stupid.wav
69043b03287161e67eb9ff137f3cded6  Data\Audio\speech\Madchester\takecover.wav
0a638074f8c6c13d1559905214f7fedc  Data\Audio\speech\Madchester\taunt1.wav
f5c794ebd0791e119c850f243bc05ec3  Data\Audio\speech\Madchester\traitor.wav
10c704565123c3c4bc1d6a45565ffe8d  Data\Audio\speech\Madchester\uhoh.wav
c9173a2a319a685cd47f509820357443  Data\Audio\speech\Madchester\victory.wav
8ca98195748ee6723ecf1b2a6e9af891  Data\Audio\speech\Madchester\watchthis.wav
545e3cc78a0b52f9374cd662bbd662dd  Data\Audio\speech\Madchester\whatthe.wav
7e81471cef8851c49c4c1f01a7c681de  Data\Audio\speech\Madchester\yessir.wav
a12b7b89be829a0b14b6c117ce4406b4  Data\Audio\speech\Madchester\youllregretthat.wav
7501b89e7f0a47a6c33afdda948910f4  Data\Audio\speech\Nagging Wife\amazing.wav
1ab1394a0d58c9374db78b03cf048543  Data\Audio\speech\Nagging Wife\angry.wav
0112d04d0cc6a931ec570d43f916392c  Data\Audio\speech\Nagging Wife\angry2.wav
702aa6e61de3323e0f2fdcb1eec3c7b2  Data\Audio\speech\Nagging Wife\boring.wav
5560b4fed9d8e517b4c4e48a40968cee  Data\Audio\speech\Nagging Wife\brilliant.wav
7b25451d52820296d9781aa50cf18323  Data\Audio\speech\Nagging Wife\bummer.wav
7b90d5999c53cc472bd3a2887fa3b70b  Data\Audio\speech\Nagging Wife\byebye.wav
6103166c79645a21335e60e918959089  Data\Audio\speech\Nagging Wife\collect.wav
0694097f63f42ef909a83e809bc6ef52  Data\Audio\speech\Nagging Wife\comeonthen.wav
e9c6241c97aff3ea57945ba9bafdc20d  Data\Audio\speech\Nagging Wife\coward.wav
e96daf35a6b20ffaab138029e71c32cf  Data\Audio\speech\Nagging Wife\dragonpunch.wav
55fcb9b7d584b4a379087457dbf3efce  Data\Audio\speech\Nagging Wife\drop.wav
6dac058efa7a18a81a1497d6f1c0b210  Data\Audio\speech\Nagging Wife\excellent.wav
4d6f68cfa4aa55a67c2f608563dd1af4  Data\Audio\speech\Nagging Wife\fatality.wav
4e57c2536aa3a5bfafb693f3a55e3ee0  Data\Audio\speech\Nagging Wife\fire.wav
e76835e942190993afefcf1db222e2f2  Data\Audio\speech\Nagging Wife\fireball.wav
614dc0e8f57a84c4ae8200eeaa79a68f  Data\Audio\speech\Nagging Wife\firstblood.wav
3270f07f5ba9213b3c665d44222c1de6  Data\Audio\speech\Nagging Wife\flawless.wav
262307c8bdb852e4299f8933d1927436  Data\Audio\speech\Nagging Wife\goaway.wav
388e6ab58348a32b0c38ce09b7df0184  Data\Audio\speech\Nagging Wife\grenade.wav
713cc7a96dfe22ce14b604dbe63a3e9c  Data\Audio\speech\Nagging Wife\happy2.wav
4442b111ada408061b19288c1a7ffcd9  Data\Audio\speech\Nagging Wife\happy3.wav
336ae259793e5def1a4909c0e6bf00b7  Data\Audio\speech\Nagging Wife\hello.wav
385d03329e90f986dd9d8054ebd5df77  Data\Audio\speech\Nagging Wife\hurry.wav
623a387d0030fa2f31a5ae4c584aa0a7  Data\Audio\speech\Nagging Wife\idle1.wav
c9cfcf73cf221646e16ce6e95ffa3d4b  Data\Audio\speech\Nagging Wife\idle2.wav
cc1083f7668ba979bec1a6a52d3a8937  Data\Audio\speech\Nagging Wife\idle4.wav
5b7024a0dca0329725fdf5f288070a9a  Data\Audio\speech\Nagging Wife\illgetyou.wav
f9b673036b6a168e774358ad83c7462c  Data\Audio\speech\Nagging Wife\incoming.wav
0adc75cbdb053ad808880ca5d59ba944  Data\Audio\speech\Nagging Wife\jump1.wav
50447dbd70eb1e33133e9568160d77b8  Data\Audio\speech\Nagging Wife\jump2.wav
4178d516648c6d8943bc8393c7e7cecc  Data\Audio\speech\Nagging Wife\justyouwait.wav
24fd96a7d1c04c4e29d90ed86bd7d588  Data\Audio\speech\Nagging Wife\kamikaze.wav
71a26ee4c1ad02a09db3f54dd905e3bb  Data\Audio\speech\Nagging Wife\laugh.wav
e9ad3914158e73a3a5f16e66053e40be  Data\Audio\speech\Nagging Wife\leavemealone.wav
0cd9126821a56e7ac2551ef17ec8e68b  Data\Audio\speech\Nagging Wife\loseloop.wav
d3bda1086e2ef348ba325ef8ae276664  Data\Audio\speech\Nagging Wife\missed.wav
8a927b57e08262dfc8fcc0b8e3f07cef  Data\Audio\speech\Nagging Wife\no.wav
0d2ab249c86475dc827df3276ffc1a52  Data\Audio\speech\Nagging Wife\ohdear.wav
3aaf23ee9a60500bc9e2934f8b97a0ae  Data\Audio\speech\Nagging Wife\oinutter.wav
b6c824835f9d5f96b8e4f0d1d5800efa  Data\Audio\speech\Nagging Wife\ooff1.wav
df80318506e110f64062c527cc127f94  Data\Audio\speech\Nagging Wife\ooff2.wav
b6a00578410de8d48813c729d5f90c53  Data\Audio\speech\Nagging Wife\oops.wav
aabb5df9d638fe4b65da852dc18c78b5  Data\Audio\speech\Nagging Wife\orders.wav
e30bf0ce9c9f8efd7a8ab5162fb75f7d  Data\Audio\speech\Nagging Wife\ouch.wav
78e6c6000201a51e6e8f9e57dc1a6527  Data\Audio\speech\Nagging Wife\ow1.wav
c60f145a3c0cc094859d56e612523019  Data\Audio\speech\Nagging Wife\ow2.wav
cadfa36734382a45a72214d1e2e9e16a  Data\Audio\speech\Nagging Wife\perfect.wav
3937952cc20d050b55233d8601a93615  Data\Audio\speech\Nagging Wife\pray.wav
dc94ae5058ba2e55c419d84428ddbac0  Data\Audio\speech\Nagging Wife\relief.wav
cbfcdf3298579b12c436d119eada5d34  Data\Audio\speech\Nagging Wife\revenge.wav
eae6ef2108ffbd51989db6feb995132f  Data\Audio\speech\Nagging Wife\runaway.wav
c86dee1f19465b8119e836ea399c3f43  Data\Audio\speech\Nagging Wife\sad1.wav
23baecf4f263676a8da2b45927419da0  Data\Audio\speech\Nagging Wife\sad2.wav
b4e2c6f828cea2daf24c92ef115a74e3  Data\Audio\speech\Nagging Wife\scared1.wav
9a61c151294b0a57d666fb6c0f44f372  Data\Audio\speech\Nagging Wife\scared2.wav
d74e96ea331abb5de37a1d31c1b45b5a  Data\Audio\speech\Nagging Wife\stupid.wav
b2aaceae416f22f8ad0d34cc76b51463  Data\Audio\speech\Nagging Wife\takecover.wav
76cb980ce827a22879982e03878bdc34  Data\Audio\speech\Nagging Wife\taunt1.wav
7bccf3173e95ee4400f71a72ea4837ab  Data\Audio\speech\Nagging Wife\traitor.wav
0ff999c316ddf0a4a5c151012a4068be  Data\Audio\speech\Nagging Wife\uhoh.wav
045a70d6bd79c4324a1394350d3ac92f  Data\Audio\speech\Nagging Wife\victory.wav
1679b88a17a084164afee8845fb39ba2  Data\Audio\speech\Nagging Wife\watchthis.wav
0ab131c1d30b404203c24ac01b49d922  Data\Audio\speech\Nagging Wife\whatthe.wav
ec4763b748fa3e954e65e7e19eaa5286  Data\Audio\speech\Nagging Wife\yessir.wav
7fde75321913e4388ba1873d54f3e69c  Data\Audio\speech\Nagging Wife\youllregretthat.wav
5cd9d71408c7318cc5092efa97e93405  Data\Audio\speech\Patronising\amazing.wav
7ebc4e6bfd6e816ecbc4fb144c95d2d5  Data\Audio\speech\Patronising\angry.wav
e4016712627dc09719d2d4d0e1f96a3d  Data\Audio\speech\Patronising\angry2.wav
cdfe4891db91888c4427f33b2255c2f6  Data\Audio\speech\Patronising\boring.wav
d15e133b863fff4eb57bcdac7391856a  Data\Audio\speech\Patronising\brilliant.wav
19e8a6817f00a22eeb4430e199d1a8c5  Data\Audio\speech\Patronising\bummer.wav
e1e86642b9bb0da7401afc747fa8f45e  Data\Audio\speech\Patronising\byebye.wav
d2436899da0df906f12dec1469c424c7  Data\Audio\speech\Patronising\collect.wav
4ba2e268226d85a16415cdc7f1a05af4  Data\Audio\speech\Patronising\comeonthen.wav
1bb66d5a9970779ac8d347b0e8c20226  Data\Audio\speech\Patronising\coward.wav
f9bfead97197b370e3c1425bc9611c47  Data\Audio\speech\Patronising\dragonpunch.wav
330288026b2f1daf55840f51f7405364  Data\Audio\speech\Patronising\drop.wav
1aaafda74ee4b46debcfcc4f2b3786c4  Data\Audio\speech\Patronising\excellent.wav
a149f8902d62bea321dc0511aee7dd16  Data\Audio\speech\Patronising\fatality.wav
e1afa402bc176c701643b8593b28bee9  Data\Audio\speech\Patronising\fire.wav
3746398fa92c9c9d2c1328ffa21a895c  Data\Audio\speech\Patronising\fireball.wav
c825ab9e659254099ac521a41ad2bee9  Data\Audio\speech\Patronising\firstblood.wav
9ac9317ff934a1506c2ae0542b6a9850  Data\Audio\speech\Patronising\flawless.wav
fb92c16e1a868ff83b074e9fa8c1a86b  Data\Audio\speech\Patronising\goaway.wav
ca454488792dbb67f17a990cdb07faf4  Data\Audio\speech\Patronising\grenade.wav
10994ad3edd16980d42bd4fbdf5633f5  Data\Audio\speech\Patronising\happy2.wav
1a04e1cf203dae0ed93e77889afcf74a  Data\Audio\speech\Patronising\happy3.wav
b56b1686299e17b2d8f78b1fb0eb13ae  Data\Audio\speech\Patronising\hello.wav
335dd44aa2cc5ec61ed4eb06a8c50b78  Data\Audio\speech\Patronising\hurry.wav
aff5e775eebcd94efe047232e870232f  Data\Audio\speech\Patronising\idle1.wav
bec6d9dedd2d8200a47879e6cf257099  Data\Audio\speech\Patronising\idle2.wav
d0dd25315c3ab3291fbca9f839b019ee  Data\Audio\speech\Patronising\idle4.wav
518917e5f374e3cb0c0c71cfbf0fa45c  Data\Audio\speech\Patronising\illgetyou.wav
0d989161b5c1c9349a092d7a1d864414  Data\Audio\speech\Patronising\incoming.wav
be978cb5a51c86e23c917ccd6de1acfb  Data\Audio\speech\Patronising\jump1.wav
40acb613a0f6cca76c3c3d7c565b467e  Data\Audio\speech\Patronising\jump2.wav
9a61b19913a3e8ccaeca2383d6d7a927  Data\Audio\speech\Patronising\justyouwait.wav
816619a9215e313021a1d29609d38d6b  Data\Audio\speech\Patronising\kamikaze.wav
c20e049ac8b9217f271a48aef56e5c0b  Data\Audio\speech\Patronising\laugh.wav
b74b4f3300335d7f3ad8e121bcf6232c  Data\Audio\speech\Patronising\leavemealone.wav
36ae0f7d07c37c255da6e3a0f9ce47bf  Data\Audio\speech\Patronising\loseloop.wav
844486d506205d786d8d86a3a8042823  Data\Audio\speech\Patronising\missed.wav
91e397441e92fb4315200d480595d03f  Data\Audio\speech\Patronising\no.wav
a38861974bda66d3a2ba6bb85b322ace  Data\Audio\speech\Patronising\ohdear.wav
7b9342d014c13543de5ba778e9dc3f2d  Data\Audio\speech\Patronising\oinutter.wav
c70537c702dccbee33ff889107cc9cd9  Data\Audio\speech\Patronising\oof1.wav
a1a4a588c79dcbbdccb5748f06ed25ed  Data\Audio\speech\Patronising\oof2.wav
d45ffa0bd2b0161c9085d95461d8a7a0  Data\Audio\speech\Patronising\oops.wav
2642053225967f6b781808c1c28bed0b  Data\Audio\speech\Patronising\orders.wav
a5bbd5f6cd647ea83b7045ec68d54a13  Data\Audio\speech\Patronising\ouch.wav
1a0192e528e166693052bfcd2ea581f1  Data\Audio\speech\Patronising\ow1.wav
12011cc486e44b9624d98733685455c8  Data\Audio\speech\Patronising\ow2.wav
3e818d63325848ee2cee09159cfd1ba1  Data\Audio\speech\Patronising\perfect.wav
2bf3adb78058b6d7830908cd670d9e07  Data\Audio\speech\Patronising\pray.wav
59ef2a97bdddd02443493c00034d48a6  Data\Audio\speech\Patronising\relief.wav
5ac26777336902fbf0597288dc6e34d6  Data\Audio\speech\Patronising\revenge.wav
fd1de90c3755b9d15dcde86897a2f5e2  Data\Audio\speech\Patronising\runaway.wav
50eaa011c7c4804fa546b567bf274fb6  Data\Audio\speech\Patronising\sad1.wav
1ba6227cccaec1439aedef9ddf5b7c56  Data\Audio\speech\Patronising\sad2.wav
e63f39fba0246bfb4f2ed059f436c3f6  Data\Audio\speech\Patronising\scared1.wav
38ecb1ed2463bb3b67b3c1e08e9f6d72  Data\Audio\speech\Patronising\scared2.wav
04de78854fe25f25c531a0ba3314439b  Data\Audio\speech\Patronising\stupid.wav
bd50c559d571d82bd179e8c240834753  Data\Audio\speech\Patronising\takecover.wav
8e7ef5d6d5891a0230a56df9c39da7e0  Data\Audio\speech\Patronising\taunt1.wav
ac1ce20582fd52a0c282ea55193688bf  Data\Audio\speech\Patronising\traitor.wav
a62a868cbe8c97c66d0eb516bbe22cea  Data\Audio\speech\Patronising\uhoh.wav
0a7725e5dd1aa19ad7caa6d857cc7a2d  Data\Audio\speech\Patronising\victory.wav
37b9c0e6d0f1263802cca629c583fe44  Data\Audio\speech\Patronising\watchthis.wav
db7ebf0de2eabe65113cf66607d10fa3  Data\Audio\speech\Patronising\whatthe.wav
a9866d6d890504b40d438b227f6f5747  Data\Audio\speech\Patronising\yessir.wav
f366d7943d25037cabbfeb2c6ad88d16  Data\Audio\speech\Patronising\youllregretthat.wav
316a92e45777bc9dc24d019a9799797e  Data\Audio\speech\Pirate\amazing.wav
0ad8b9f86aa9b4ccbe7443ae542cf00f  Data\Audio\speech\Pirate\angry.wav
3842e8984754349537d3eeff0ea9b5c8  Data\Audio\speech\Pirate\angry2.wav
72dea2b2de02fdf8ab6d16df3fc717a4  Data\Audio\speech\Pirate\boring.wav
38d96a863eab93220e7dd07492ebfdc6  Data\Audio\speech\Pirate\brilliant.wav
541cc82b18c24f1ac1d5701fcd417a5a  Data\Audio\speech\Pirate\bummer.wav
6343792c0675bd6ca7c89b135c9f7ef5  Data\Audio\speech\Pirate\byebye.wav
c345450191e3a1d664967edc0300d4b9  Data\Audio\speech\Pirate\collect.wav
f91d2ba5ff6577862b25a09a5f40a234  Data\Audio\speech\Pirate\comeonthen.wav
fb08ad45c1054a0bbaa9f430efe3b970  Data\Audio\speech\Pirate\coward.wav
70373755b9b6fda005c7a55ddc436f32  Data\Audio\speech\Pirate\dragonpunch.wav
882206854846a76b903c19a32b2ab36c  Data\Audio\speech\Pirate\drop.wav
1e520576de405d2f13ad1d5580507e0e  Data\Audio\speech\Pirate\excellent.wav
dfec36bafcaaa48745a4100ad1e58d23  Data\Audio\speech\Pirate\fatality.wav
53dcc32194d3f6d95b8cbab25267151c  Data\Audio\speech\Pirate\fire.wav
f733acbd055cb9e155cbad53985ffbc1  Data\Audio\speech\Pirate\fireball.wav
737cf2334f5ccc9a1118e82ca7f7214c  Data\Audio\speech\Pirate\firstblood.wav
e7c4acf7be3857a084cf99b66e229737  Data\Audio\speech\Pirate\flawless.wav
cc930f7adcf3f2cb1715ad93dc19182e  Data\Audio\speech\Pirate\goaway.wav
01d11ceb544b10f1f207156b1e3408bd  Data\Audio\speech\Pirate\grenade.wav
42a2967f16dfa97e87a987ffed78c3a5  Data\Audio\speech\Pirate\happy2.wav
c3dda59dd62d3a400455f02ce7f77c9e  Data\Audio\speech\Pirate\happy3.wav
7e89566864a8393777394ae8f04c5565  Data\Audio\speech\Pirate\hello.wav
10bab2924248211dac036d627faba726  Data\Audio\speech\Pirate\hurry.wav
471845b53136200d2c374f1cb84558e9  Data\Audio\speech\Pirate\idle1.wav
294e796017dae252d41a834aa25c674b  Data\Audio\speech\Pirate\idle2.wav
123216d91d4713aae8432bb81268471b  Data\Audio\speech\Pirate\idle4.wav
b10cd628f2ed83b135aa83db752d9c45  Data\Audio\speech\Pirate\illgetyou.wav
4d00b5c7e74d2846a790575656fe3968  Data\Audio\speech\Pirate\incoming.wav
adb56263ace4b19e62a0c59eaec292d4  Data\Audio\speech\Pirate\jump1.wav
caec4d22fa917c91217b60caf1395b0b  Data\Audio\speech\Pirate\jump2.wav
0c8acbc92897c689bab155689c7aaaf1  Data\Audio\speech\Pirate\justyouwait.wav
d4c94098b7fb070435924a37d494a43b  Data\Audio\speech\Pirate\kamikaze.wav
3689d3e0731f87289c691a61d7126bad  Data\Audio\speech\Pirate\laugh.wav
e72319372ce571c6eefad95e4ac05f6f  Data\Audio\speech\Pirate\leavemealone.wav
a4464363d31ae3bf7a8bc2ecc47ade89  Data\Audio\speech\Pirate\loseloop.wav
228ab7e5d70601b30d1741f19d07312a  Data\Audio\speech\Pirate\missed.wav
91a4ae2e36817b40e6745e0cb043fc5e  Data\Audio\speech\Pirate\no.wav
87e8828fc66499d18c32c90f2306cd37  Data\Audio\speech\Pirate\ohdear.wav
884587f55a4303eac20c9759e4992950  Data\Audio\speech\Pirate\oinutter.wav
aad1e1ea17ecffd2e78728ac520cf156  Data\Audio\speech\Pirate\oof1.wav
a2248ffb736962da0411ff5660e89e06  Data\Audio\speech\Pirate\oof2.wav
e5a0a81abbded32dd8ea6d7e30deadaf  Data\Audio\speech\Pirate\oops.wav
ec6176d946c86128ee734054407fad08  Data\Audio\speech\Pirate\orders.wav
9b50ccc1b695b74da7313d0f2fa4630a  Data\Audio\speech\Pirate\ouch.wav
4518846189724cef39e03a0452349872  Data\Audio\speech\Pirate\ow1.wav
396d72181010f81a2c10f5a9f3682008  Data\Audio\speech\Pirate\ow2.wav
c9c29bdf5b4157decc98d88853464e78  Data\Audio\speech\Pirate\perfect.wav
d0aa8519f82a0058e8653428c970dcb4  Data\Audio\speech\Pirate\pray.wav
0782e27f8ea4511ba1eca1549e26ea79  Data\Audio\speech\Pirate\relief.wav
233f3ddca59cadf06a1bc151be95995d  Data\Audio\speech\Pirate\revenge.wav
d3b8db1e1f07b44a8bd6acbd542ccb74  Data\Audio\speech\Pirate\runaway.wav
5d75304c81f23451ebd8bc50651e6e47  Data\Audio\speech\Pirate\sad1.wav
a3ccd8f067aff01595df69658bc77c7c  Data\Audio\speech\Pirate\sad2.wav
8e14160373552b6ea7112a3c0c63752e  Data\Audio\speech\Pirate\scared1.wav
25322504f6c0d7041f7ad8edf58438e7  Data\Audio\speech\Pirate\scared2.wav
b01164b3ba1ea5f1b2d9d02206a750b3  Data\Audio\speech\Pirate\stupid.wav
6e88ced6c3122a11f1738ab0f4f58248  Data\Audio\speech\Pirate\takecover.wav
e2b8818e066136e16b161387ec72fd25  Data\Audio\speech\Pirate\taunt1.wav
d5a4022fa518580ac690b953d069d497  Data\Audio\speech\Pirate\traitor.wav
a7778d32cfcd2844b78195a1aad6ad48  Data\Audio\speech\Pirate\uhoh.wav
cd59c2fcfa54f73319733eba78c06a55  Data\Audio\speech\Pirate\victory.wav
64fb3427521ad2bd4dacb0b29a1e965f  Data\Audio\speech\Pirate\watchthis.wav
9443ce3c38260c55f9fe051ed9c20b85  Data\Audio\speech\Pirate\whatthe.wav
78074de5a69871e659bea9db8ebe3c8d  Data\Audio\speech\Pirate\yessir.wav
f154e24039562c32da6b8a289cbed60c  Data\Audio\speech\Pirate\youllregretthat.wav
0dac296a6ef13feb963e36fb2d12f240  Data\Audio\speech\Russki\amazing.wav
0835a83c992dfcc5733fd616a0f4dfb2  Data\Audio\speech\Russki\angry.wav
0dda29d4e1cda41be48f885f41c1087b  Data\Audio\speech\Russki\angry2.wav
a0da889341539acede13e6a2ba466e48  Data\Audio\speech\Russki\boring.wav
6bef17bb08813657c96da1951293b19d  Data\Audio\speech\Russki\brilliant.wav
ae5890f98eb87cac9573e5e56303a106  Data\Audio\speech\Russki\bummer.wav
6ec7fbab0d9c79ce49c2a0ee3458dd40  Data\Audio\speech\Russki\byebye.wav
c0813fb954c39e3233944ea00d232049  Data\Audio\speech\Russki\collect.wav
4f95f8d4aadf5d1481bdc08073298484  Data\Audio\speech\Russki\comeonthen.wav
bc89a74b5b933de487f6fd7c96420264  Data\Audio\speech\Russki\coward.wav
72a09d4c9e686b65de0882ad35d4991c  Data\Audio\speech\Russki\dragonpunch.wav
0189955ad89334d7f33b16ba688a0e2e  Data\Audio\speech\Russki\drop.wav
5dd1b2f7ed3fc8320669ec47916d79b8  Data\Audio\speech\Russki\excellent.wav
b16d34297b1d2291a6e0cfd221bf6682  Data\Audio\speech\Russki\fatality.wav
4d74f1f880c463e2135317979082e8ef  Data\Audio\speech\Russki\fire.wav
872c1d349938cde8e61272774b7b82b6  Data\Audio\speech\Russki\fireball.wav
6527d78303518b2e6198df02e3d758ad  Data\Audio\speech\Russki\firstblood.wav
24da0d5923656334f077d9ddb6634973  Data\Audio\speech\Russki\flawless.wav
e45b28212ea632bd962ab2982f3cf60e  Data\Audio\speech\Russki\goaway.wav
028a2f018dca264164af9f89c103fbc8  Data\Audio\speech\Russki\grenade.wav
ebeac25d7d724b1f9b500cbb2829f0c2  Data\Audio\speech\Russki\happy2.wav
2f7243ea22599c3d226b5ea5fde33b75  Data\Audio\speech\Russki\happy3.wav
766eddf84915f8e9f07d1a2090029afc  Data\Audio\speech\Russki\hello.wav
880be5e6ecf31cc94b2ee1e2ec3cb146  Data\Audio\speech\Russki\hurry.wav
8a7b1c0917fd7eea7e8fa8f2cc612159  Data\Audio\speech\Russki\idle1.wav
3a1543d665bd9449565f28cd2eb6d450  Data\Audio\speech\Russki\idle2.wav
bd9ea28f3a8c8a2ebbadf61033388cb8  Data\Audio\speech\Russki\idle4.wav
05ef24492553eb3bd52d3a17f491cb59  Data\Audio\speech\Russki\illgetyou.wav
c09c3ae78db77664a083132ed63af425  Data\Audio\speech\Russki\incoming.wav
9208aa086ac466449be34fb8947fe2c8  Data\Audio\speech\Russki\jump1.wav
0c94a32457b86d36a52e02fc665e0ac0  Data\Audio\speech\Russki\jump2.wav
5976576a9735d661bf721b35b6f0c1f5  Data\Audio\speech\Russki\justyouwait.wav
f8dac32873372a5ddfea8480463c6945  Data\Audio\speech\Russki\kamikaze.wav
85336a0b9a66391f4d959033726a781f  Data\Audio\speech\Russki\laugh.wav
54536a282b21c262e15f4506857a620f  Data\Audio\speech\Russki\leavemealone.wav
db78b4d491e45c1aba7bd73f98a0449f  Data\Audio\speech\Russki\loseloop.wav
c20f4fa38677da91c689a724ad0b9a63  Data\Audio\speech\Russki\missed.wav
c7934542a17cb6bc43d0a3623327a6fc  Data\Audio\speech\Russki\no.wav
4834cd4e6a30adfba70f1b4f980ba129  Data\Audio\speech\Russki\ohdear.wav
527c54b10953a2f226abea00e7db311e  Data\Audio\speech\Russki\oinutter.wav
fbc16ec72f48b446e2ed9038d344eec2  Data\Audio\speech\Russki\oof1.wav
71b4f8b475846a37cda546de7bb1689e  Data\Audio\speech\Russki\oof2.wav
7eb28add9ef56688247cabe3a8b82696  Data\Audio\speech\Russki\oops.wav
28e8ce5b021a946fc0c9cba2a060db17  Data\Audio\speech\Russki\orders.wav
126b7960c0606c8b3bbdbda3600310d3  Data\Audio\speech\Russki\ouch.wav
a1dd6c150c2302577c1b9b3beb3eca67  Data\Audio\speech\Russki\ow1.wav
8a7ca06857d53c34086ecc4f530933fe  Data\Audio\speech\Russki\ow2.wav
26cfc97cb26dfdd473e8ba20277171d5  Data\Audio\speech\Russki\perfect.wav
3604f2ee0b6c15bdd62cba8ceb87085a  Data\Audio\speech\Russki\pray.wav
856e0751fc0f0d140227adb2c7ce01d0  Data\Audio\speech\Russki\relief.wav
9f3324f36fd9597b235591a32bb54a74  Data\Audio\speech\Russki\revenge.wav
759581d6f2ac11aa3d9d5d20201a2a2d  Data\Audio\speech\Russki\runaway.wav
19fc663297822136be1d9f93749ffba4  Data\Audio\speech\Russki\sad1.wav
9a93bc79a1767c98a3fd44bae3ff4afb  Data\Audio\speech\Russki\sad2.wav
93fbb930108735cb30d4828f72809888  Data\Audio\speech\Russki\scared1.wav
d93eaba0ca31c603631c7c42ae7eeb24  Data\Audio\speech\Russki\scared2.wav
3e566bac4c247b09e1ce97f7a64ebd41  Data\Audio\speech\Russki\stupid.wav
0b3fbde30a1dd8baffcb73bfcf223394  Data\Audio\speech\Russki\takecover.wav
81de153422f58d0c6f6b6dc184b1c0cc  Data\Audio\speech\Russki\taunt1.wav
d4c3ffe28d1992e6c33be2c648539d9d  Data\Audio\speech\Russki\traitor.wav
5e4aa5c7d90c804eb5dcd1e016debfa8  Data\Audio\speech\Russki\uhoh.wav
e3ef58554dbcbf4cb97fff069aab7eb4  Data\Audio\speech\Russki\victory.wav
17934c75bd32d88334552db27fc83a16  Data\Audio\speech\Russki\watchthis.wav
a574faa956772cd6fdb5c4e8017c36e6  Data\Audio\speech\Russki\whatthe.wav
71b952118547a9c1ca1cc597d1470e5b  Data\Audio\speech\Russki\yessir.wav
8aa43f8d46d9ca4c0d8b9361eeebcf38  Data\Audio\speech\Russki\youllregretthat.wav
b53e1bbe47ca438123b24019a464cc49  Data\Audio\speech\Scotsman\amazing.wav
a31a2aa41fdb8c1a758c0b59d4c8d8d3  Data\Audio\speech\Scotsman\angry.wav
b27ab612008f5578674f2e8648a5d7d4  Data\Audio\speech\Scotsman\angry2.wav
ee8529b9d673f8b40b0f7e5c99aa78eb  Data\Audio\speech\Scotsman\boring.wav
06762c5c4c6db314fda2f60033df936a  Data\Audio\speech\Scotsman\brilliant.wav
3944ec4bcd152aa82755bb92a4dc7043  Data\Audio\speech\Scotsman\bummer.wav
1c76229c0bc26f3721d890de3b88bdf3  Data\Audio\speech\Scotsman\byebye.wav
580a4f8d131cfb5556e46969ed4a19bd  Data\Audio\speech\Scotsman\collect.wav
d96f0c9907179cd8b79048df589070db  Data\Audio\speech\Scotsman\comeonthen.wav
60cbd2dc21a8645109decc3ead0c2a0b  Data\Audio\speech\Scotsman\coward.wav
8ccdeada11c715da626b4ae9042fc08a  Data\Audio\speech\Scotsman\dragonpunch.wav
be8e7221189b164405c2088934192eb0  Data\Audio\speech\Scotsman\drop.wav
82993a03ebed727e3ef8785c496ef3d4  Data\Audio\speech\Scotsman\excellent.wav
8f8551c13b66984b321dc94ec981e68d  Data\Audio\speech\Scotsman\fatality.wav
251d24f60440cd7731589b436a158c7b  Data\Audio\speech\Scotsman\fire.wav
0180465553368adf023046ea493a33cb  Data\Audio\speech\Scotsman\fireball.wav
35f9d8600d96b35048a9fc218999f54b  Data\Audio\speech\Scotsman\firstblood.wav
3e520e425d7746c62f6ca846907d491f  Data\Audio\speech\Scotsman\flawless.wav
7fd16a0f25386f8e67ff6a3b7ab69f7e  Data\Audio\speech\Scotsman\goaway.wav
fa98f3c4063b2f90c17b07ea7810a418  Data\Audio\speech\Scotsman\grenade.wav
25cb581305fd9deef9ddd8eb9fd8a346  Data\Audio\speech\Scotsman\happy2.wav
ca6b6a339faaac2d08de3da7f2c309a7  Data\Audio\speech\Scotsman\happy3.wav
03b2a5250aa4842b7cc301b56bf64e06  Data\Audio\speech\Scotsman\hello.wav
c5a49e7e14518595f5dbc21941916953  Data\Audio\speech\Scotsman\hurry.wav
342b7fae6576455a59c63857ca68428c  Data\Audio\speech\Scotsman\idle1.wav
6a01d47e1cfae53c830cae66475a7aa3  Data\Audio\speech\Scotsman\idle2.wav
6232ca75c8466ec463f5db562fbde294  Data\Audio\speech\Scotsman\idle4.wav
d27ebd0337306326bb5acc36054a3f04  Data\Audio\speech\Scotsman\illgetyou.wav
ca41afec572e504d8f77d0b3904102e2  Data\Audio\speech\Scotsman\incoming.wav
75c874fd4f3ea09bf76c4a69693e05f4  Data\Audio\speech\Scotsman\jump1.wav
9a316ffb67d65ba60f2222999d19c8e8  Data\Audio\speech\Scotsman\jump2.wav
6a2f02926a7aac0be2ed3f2eb4a0247a  Data\Audio\speech\Scotsman\justyouwait.wav
6b2f41e883b7d8736f22813c61a783e7  Data\Audio\speech\Scotsman\kamikaze.wav
924ddc8b7161cae3d6a4397a7ba0f797  Data\Audio\speech\Scotsman\laugh.wav
fc0acdbcf491b8309b6bae276143b53b  Data\Audio\speech\Scotsman\leavemealone.wav
2119995d37c8a7a9714008ada95d6969  Data\Audio\speech\Scotsman\loseloop.wav
d1199f7aa579cc3a7e328916411c9b52  Data\Audio\speech\Scotsman\missed.wav
fc86e50f296f5679b606a1420770c61d  Data\Audio\speech\Scotsman\no.wav
32a1926ee7cb8f0c7bf76f0b987e208d  Data\Audio\speech\Scotsman\ohdear.wav
12cd6c5d3afe3b3f2bd4f285b35db424  Data\Audio\speech\Scotsman\oinutter.wav
e825c9cc190c8b4c23e54a6f59562475  Data\Audio\speech\Scotsman\oof1.wav
30ac7cb117af492b3e85b1911625cd64  Data\Audio\speech\Scotsman\oof2.wav
556c0f844fd2a712d9c8183fa13d340d  Data\Audio\speech\Scotsman\oops.wav
b84884ea5313dd6035bb5fac16e7236b  Data\Audio\speech\Scotsman\orders.wav
cff3dbe0f6a4cfd12f491cc226101509  Data\Audio\speech\Scotsman\ouch.wav
b2825aeba71933b2f124345064ad9398  Data\Audio\speech\Scotsman\ow1.wav
f51decff7ad7ca94c6c01cc2d60cd981  Data\Audio\speech\Scotsman\ow2.wav
be5035c78c200aa58dbbb234bc79f66d  Data\Audio\speech\Scotsman\perfect.wav
1ad9640a4fd071c8559244caa0f77705  Data\Audio\speech\Scotsman\pray.wav
d7152f3109c728f46742d0348a52cdb3  Data\Audio\speech\Scotsman\relief.wav
00d1073af80f9bc309f5eeaba03d8dd5  Data\Audio\speech\Scotsman\revenge.wav
d90c48e8ccb4d0e42e2401be476b4037  Data\Audio\speech\Scotsman\runaway.wav
4c9128e80615c297a174203aa8c7997b  Data\Audio\speech\Scotsman\sad1.wav
1ff090dbc5089ff5350a6c32d940413b  Data\Audio\speech\Scotsman\sad2.wav
96b9a0fe52cc334fc5625fb488e86d4e  Data\Audio\speech\Scotsman\scared1.wav
34d7c2731b8b11fcf78ce552d74f6cc1  Data\Audio\speech\Scotsman\scared2.wav
96b6787f9b9593ad4902cdc9d1a81a12  Data\Audio\speech\Scotsman\stupid.wav
20dd08c68ca756dad066d120b18ff70e  Data\Audio\speech\Scotsman\takecover.wav
169fa4f6b8872358409cf860f52bb702  Data\Audio\speech\Scotsman\taunt1.wav
0a1aa14185dfd9edf6b231827934fd3a  Data\Audio\speech\Scotsman\traitor.wav
c25be4fa4158373f80dc8eeb81b767d6  Data\Audio\speech\Scotsman\uhoh.wav
a8b7ed5d24495d0260edbf302596ce4b  Data\Audio\speech\Scotsman\victory.wav
5df4676d5275abf14dcef88228a98cb0  Data\Audio\speech\Scotsman\watchthis.wav
a49de270c51d90d4616ef9d729e33646  Data\Audio\speech\Scotsman\whatthe.wav
b4239c3fdd5587efa99508ce7b32f4d2  Data\Audio\speech\Scotsman\yessir.wav
1a53d5ef7b621d03844d23738b7742ef  Data\Audio\speech\Scotsman\youllregretthat.wav
21f6b4f5cb11a25462be7b35776b6502  Data\Audio\speech\Southern Belle\amazing.wav
42ce32636371ded95100fa9692a29d76  Data\Audio\speech\Southern Belle\angry.wav
23e5bcafff29a288f0d2965a79f6cd6d  Data\Audio\speech\Southern Belle\angry2.wav
f50e8ec67c697335a4fca5dd3a8dcf94  Data\Audio\speech\Southern Belle\boring.wav
475970fed57ef6db617707e8aecbd4c2  Data\Audio\speech\Southern Belle\brilliant.wav
711761e05be43224064198758162b61d  Data\Audio\speech\Southern Belle\bummer.wav
0a84c2f1bdb1df598bdc832768541e60  Data\Audio\speech\Southern Belle\byebye.wav
27cb98dd3121c0e92368c50165e1dbba  Data\Audio\speech\Southern Belle\collect.wav
7a16ed8ef898433fa37281c518b6755f  Data\Audio\speech\Southern Belle\comeonthen.wav
27edf872074b3b031dcb3a9b9b81ba4d  Data\Audio\speech\Southern Belle\coward.wav
d699eacf556e7de7b40ffefacec9768e  Data\Audio\speech\Southern Belle\dragonpunch.wav
70c6408472dac42a06be8d417cac5c17  Data\Audio\speech\Southern Belle\drop.wav
f1716d97e8a7c34a93600925a83ad152  Data\Audio\speech\Southern Belle\excellent.wav
38e5473f2b7bad73ac57a21c6ac5b1b0  Data\Audio\speech\Southern Belle\fatality.wav
7d2b263ae1e37e125b0557f7c477befd  Data\Audio\speech\Southern Belle\fire.wav
9800787abc9af102d35c0172eed4b75f  Data\Audio\speech\Southern Belle\fireball.wav
e2a209615bb21f54c0b9456486078e7d  Data\Audio\speech\Southern Belle\firstblood.wav
dc5d5eadc736cbc5e3f0e0647a3ff03d  Data\Audio\speech\Southern Belle\flawless.wav
504a09b20257759de0d35c7cc5dbf63a  Data\Audio\speech\Southern Belle\goaway.wav
19adb84231cb46cb6e51602d7e8f2305  Data\Audio\speech\Southern Belle\grenade.wav
4291442d44f3cdf2d02171dbd98398ae  Data\Audio\speech\Southern Belle\happy2.wav
d5b30b0b33a2b2afba0a3a6fa131fe7d  Data\Audio\speech\Southern Belle\happy3.wav
d3a3fe628bfa327b480e06dd2e1950a8  Data\Audio\speech\Southern Belle\hello.wav
5697eef03b7e109197da470fb37b7e37  Data\Audio\speech\Southern Belle\hurry.wav
582b002697131abec052af136a19c8ff  Data\Audio\speech\Southern Belle\idle1.wav
0fa90f1951aa147fcd0045a93bce3e6e  Data\Audio\speech\Southern Belle\idle2.wav
010f12a7652bf11772a36dcff0736f39  Data\Audio\speech\Southern Belle\idle4.wav
2dd35f34641de980ddd1df21e1835f18  Data\Audio\speech\Southern Belle\illgetyou.wav
1782dd60f8a49206f3cae3cedba2b47f  Data\Audio\speech\Southern Belle\incoming.wav
eff6680e1d996fe23f35d1254b72b511  Data\Audio\speech\Southern Belle\jump1.wav
80f93f93f9e3ec7d6caefd66fb047d1a  Data\Audio\speech\Southern Belle\jump2.wav
3653aae86b8c04fbd03bff52124592cc  Data\Audio\speech\Southern Belle\justyouwait.wav
f7a03e171e1cb611a3bb5ddbc06f36b6  Data\Audio\speech\Southern Belle\kamikaze.wav
0c1119d2e524df241f7e407ff17e9352  Data\Audio\speech\Southern Belle\laugh.wav
6b47d12e7def483afd833baa3aed71cf  Data\Audio\speech\Southern Belle\leavemealone.wav
b9754d0b5d6673c75180d648edbec609  Data\Audio\speech\Southern Belle\loseloop.wav
d475be2762f02df7ed4fa26d56048609  Data\Audio\speech\Southern Belle\missed.wav
2b4c3aacc3dd062e8f4931287af9cc25  Data\Audio\speech\Southern Belle\no.wav
8386234b8444bce80fd96f20d71c1aac  Data\Audio\speech\Southern Belle\ohdear.wav
8ab9c02db1df7b3f8525174edba2ea04  Data\Audio\speech\Southern Belle\oinutter.wav
1613f23189fd4d1720f25f21d500ca5d  Data\Audio\speech\Southern Belle\oof1.wav
7b6ae5b978cf18616bb26f2152f724fa  Data\Audio\speech\Southern Belle\oof2.wav
8e254a035c699d7513aeb45ddd217109  Data\Audio\speech\Southern Belle\oops.wav
e9df618bd9a7df57c7f406349b3d21e2  Data\Audio\speech\Southern Belle\orders.wav
284bc6f882e04908a2136d93f7bb7f1a  Data\Audio\speech\Southern Belle\ouch.wav
0ee8e1a527a539e7149f2737bd405285  Data\Audio\speech\Southern Belle\ow1.wav
8526403e844615b24e98b95159e14fbd  Data\Audio\speech\Southern Belle\ow2.wav
d4383dc0241eaecc5227d8d07c1bbbfc  Data\Audio\speech\Southern Belle\perfect.wav
63a233aea2af5f82e39cd416aa0b16a8  Data\Audio\speech\Southern Belle\pray.wav
9db4eca6fedc16f48d5861d236dd4c21  Data\Audio\speech\Southern Belle\relief.wav
4232a7ac611d93d1d41e5990748cdb51  Data\Audio\speech\Southern Belle\revenge.wav
2acd61eede9a5abd38383b3347fdb510  Data\Audio\speech\Southern Belle\runaway.wav
b091b34487e2cb21dacf5e452ce5b78a  Data\Audio\speech\Southern Belle\sad1.wav
a4b6f3de8077869ea44c10646399fb7e  Data\Audio\speech\Southern Belle\sad2.wav
faeec679a396f343685c022970d4668a  Data\Audio\speech\Southern Belle\scared1.wav
0d083805cd6a1ae6ea1eb5a9a10f3d6c  Data\Audio\speech\Southern Belle\scared2.wav
4b7d84670ee8cd5e5e33d9cb22711a19  Data\Audio\speech\Southern Belle\stupid.wav
b92be26276795385e3d16eb5e07f958f  Data\Audio\speech\Southern Belle\takecover.wav
1f841afc2e7bfa6631e1b800704189d7  Data\Audio\speech\Southern Belle\taunt1.wav
fc9545eb5abad144437ddee0d5c1896c  Data\Audio\speech\Southern Belle\traitor.wav
c6fceba1754542748f76e7408509fb3f  Data\Audio\speech\Southern Belle\uhoh.wav
b155af234927cf8338acff58b5c5316a  Data\Audio\speech\Southern Belle\victory.wav
dca74205fd7b8ff0000feafd57568c6c  Data\Audio\speech\Southern Belle\watchthis.wav
cea9b946d0dd612d4cc11a70a7d2a1e4  Data\Audio\speech\Southern Belle\whatthe.wav
2266da6f9499ad85fb336b6aa419909a  Data\Audio\speech\Southern Belle\yessir.wav
334342c7a8563a6d1ba3909e82f834ad  Data\Audio\speech\Southern Belle\youllregretthat.wav
8639b7e06e48a12a37d4294a1f205dc0  Data\Audio\speech\Spanish\amazing.wav
e03c419ef6a8a42ed401505b198ebe47  Data\Audio\speech\Spanish\angry.wav
e5198a2383548c41fa039d447f3867bc  Data\Audio\speech\Spanish\angry2.wav
4cf670276c6122ae09587d7bd4cd8a2b  Data\Audio\speech\Spanish\boring.wav
ebe96683f61c114205fb0cf6154c1632  Data\Audio\speech\Spanish\brilliant.wav
576e47ccba198689749d60d87fa5fc01  Data\Audio\speech\Spanish\bummer.wav
9df4a416c6cad799d16b4bf61a322e5c  Data\Audio\speech\Spanish\byebye.wav
28d7cd7bbe63489c78baa9c36ff19eea  Data\Audio\speech\Spanish\collect.wav
97a430561715a7769c795d605bdd80e9  Data\Audio\speech\Spanish\comeonthen.wav
9e62b3c00920e1c89c150f28b7111a74  Data\Audio\speech\Spanish\coward.wav
04835c3d1a8e35dc9d5c29e5df2e807d  Data\Audio\speech\Spanish\dragonpunch.wav
3289aed93df71ae11af94c4fcda8b736  Data\Audio\speech\Spanish\drop.wav
65d2d7dc2975fbbe6163fc543261e221  Data\Audio\speech\Spanish\excellent.wav
c41a043a93be31f1a4e32745fe47ecd3  Data\Audio\speech\Spanish\fatality.wav
0de68793c801444bee4c333aa0e45d5e  Data\Audio\speech\Spanish\fire.wav
e33bc17e69cd4141de02d8027e3cdaca  Data\Audio\speech\Spanish\fireball.wav
842aadd0b9d51c3dbcb8c3abdeaf3a52  Data\Audio\speech\Spanish\firstblood.wav
a73929f6ab09ffa2a01d42f56ee83aad  Data\Audio\speech\Spanish\flawless.wav
b9216c97b301eadf65b7e4390a490b8f  Data\Audio\speech\Spanish\goaway.wav
8af7007f0fb2cffc7411a5e3dd52a72b  Data\Audio\speech\Spanish\grenade.wav
84670691aaa36f8672de451fdfad0f73  Data\Audio\speech\Spanish\happy2.wav
db514e4934ff0efa46be343e66e5d9c4  Data\Audio\speech\Spanish\happy3.wav
0338316dd3b5211dd438225fa424266d  Data\Audio\speech\Spanish\hello.wav
f20fc6409e38aa27f9a6922ac037c91b  Data\Audio\speech\Spanish\hurry.wav
20b8968a332845468de11755641bd571  Data\Audio\speech\Spanish\idle1.wav
55b0aa510e87055904946515d4890954  Data\Audio\speech\Spanish\idle2.wav
aabdf2257f0648936fac99b9892df54a  Data\Audio\speech\Spanish\idle4.wav
1bc1e87b30edcdf07dac15a03b26b10c  Data\Audio\speech\Spanish\illgetyou.wav
e00b4dc8adcd09fccf01eae79980c035  Data\Audio\speech\Spanish\incoming.wav
8af484f3f11339f63ceae4189bff2916  Data\Audio\speech\Spanish\jump1.wav
b3d9aedfba0f93815bd567a28c260edb  Data\Audio\speech\Spanish\jump2.wav
346c07d871dc75050204c24f40c39138  Data\Audio\speech\Spanish\justyouwait.wav
6dcf146141b16dc4b6194153a812c281  Data\Audio\speech\Spanish\kamikaze.wav
d7f29a260fedcd7a3d4bb435f2d56711  Data\Audio\speech\Spanish\laugh.wav
00327c4a78a8cf645398b7d68a58647a  Data\Audio\speech\Spanish\leavemealone.wav
46d1e1a367a0dd47643976673cb04bfd  Data\Audio\speech\Spanish\loseloop.wav
7f573a24f0c9f7ef4bac5b3893584d33  Data\Audio\speech\Spanish\missed.wav
22712a6d9257f8ea5f6781d2ce2790f1  Data\Audio\speech\Spanish\no.wav
e94b2cbe07a66e96e95af9ae53b9616c  Data\Audio\speech\Spanish\ohdear.wav
16ac76d078a2eaeba1121f70bb8fea7f  Data\Audio\speech\Spanish\oinutter.wav
9b408f7432bd5712a2e201bfa41eaf62  Data\Audio\speech\Spanish\oof1.wav
746cf333539a37f5c205e0bc2c60024b  Data\Audio\speech\Spanish\oof2.wav
eca50b3fb4cd7eff81bf46b411f442fc  Data\Audio\speech\Spanish\oops.wav
b09393c1b08fcb03d4dbd20f975904ab  Data\Audio\speech\Spanish\orders.wav
6c26499fe61ba46d88c8fcd5a5cadfe0  Data\Audio\speech\Spanish\ouch.wav
fc56423a0534aad410f3f6d681a46ab5  Data\Audio\speech\Spanish\ow1.wav
ad214833120278cb27c6a07dd8f78a3a  Data\Audio\speech\Spanish\ow2.wav
44a826e34d80812cb92472103e07ac8a  Data\Audio\speech\Spanish\perfect.wav
edcddbb62c89e6f0eb6ff9a12792ec41  Data\Audio\speech\Spanish\pray.wav
88f88af2547e464b62e0f990df6aa348  Data\Audio\speech\Spanish\relief.wav
8bb2220c76fcdfc2f4d00b0d68ee123b  Data\Audio\speech\Spanish\revenge.wav
7168081ded6ff3aabb2803a501593c58  Data\Audio\speech\Spanish\runaway.wav
ee7578257cc6025d2aabdee1e2aa0779  Data\Audio\speech\Spanish\sad1.wav
ad258ccff6600265001b5cb867be370b  Data\Audio\speech\Spanish\sad2.wav
16543026082cfebfe908d84336d88bdd  Data\Audio\speech\Spanish\scared1.wav
5c3ebf42965d2684085f4677449d8931  Data\Audio\speech\Spanish\scared2.wav
c303f8384a3cac672aaa5e9f03a40887  Data\Audio\speech\Spanish\stupid.wav
cb19f447b6a55dbf97d31fde59255874  Data\Audio\speech\Spanish\takecover.wav
1553838e4f3f4a664b9b2aa0cdd4f681  Data\Audio\speech\Spanish\taunt1.wav
7451e9554ae4c7c2427d7008968da909  Data\Audio\speech\Spanish\traitor.wav
fc368cdcfe5423fdf2f5bdcb29c1e91b  Data\Audio\speech\Spanish\uhoh.wav
b6ce3aabc1437c432675894f5b228a37  Data\Audio\speech\Spanish\victory.wav
6e59958db889d8112334de506cbbc000  Data\Audio\speech\Spanish\watchthis.wav
72af42dbc7877aa43a777fc9404682f3  Data\Audio\speech\Spanish\whatthe.wav
73faab65f0e1870ca2d90781e24d51d4  Data\Audio\speech\Spanish\yessir.wav
20a3b04d5e91ffc125a3263c636e85be  Data\Audio\speech\Spanish\youllregretthat.wav
b4e7f693873307e943602c27bdccba84  Data\Audio\speech\Spanish Inquisition\amazing.wav
9ca7eedc020eb5b96ea08020b38627bb  Data\Audio\speech\Spanish Inquisition\angry.wav
6c6078647f0f29274564bda1fef05687  Data\Audio\speech\Spanish Inquisition\angry2.wav
c760e9df4e57e9b805a85f418eeedd8d  Data\Audio\speech\Spanish Inquisition\boring.wav
b40b20b1f5e29093362d20ae5998139a  Data\Audio\speech\Spanish Inquisition\brilliant.wav
1a42a9c2630baeb19bf70ab0b3ed835c  Data\Audio\speech\Spanish Inquisition\bummer.wav
5fa6ad2f5076eca88eae46428840bedf  Data\Audio\speech\Spanish Inquisition\byebye.wav
6a761fda283ec030ec4fce19fc187922  Data\Audio\speech\Spanish Inquisition\collect.wav
288c353a6e8013639afa169a26b4e217  Data\Audio\speech\Spanish Inquisition\comeonthen.wav
b9c60ba0cd0cdcaad3864a4d72c0314e  Data\Audio\speech\Spanish Inquisition\coward.wav
637f0c2d496f4664e82c17f10380e0e6  Data\Audio\speech\Spanish Inquisition\dragonpunch.wav
cd4485761b5c6c7da7ec6b0b4cf1bc0c  Data\Audio\speech\Spanish Inquisition\drop.wav
da7a04e28fe20468cd0d030d781cb05d  Data\Audio\speech\Spanish Inquisition\excellent.wav
a68cc5b08dfff12b257a82392310ec32  Data\Audio\speech\Spanish Inquisition\fatality.wav
a92d68a001b19a091ef861997befcfa7  Data\Audio\speech\Spanish Inquisition\fire.wav
511b2dd36f1ed944dbf7473bf93a7164  Data\Audio\speech\Spanish Inquisition\fireball.wav
16115ab1c39c9e5d7085e944c70bcf7b  Data\Audio\speech\Spanish Inquisition\firstblood.wav
049fee06424e61036110b08f69b0c255  Data\Audio\speech\Spanish Inquisition\flawless.wav
69caf36511dcee4d91045d289918a613  Data\Audio\speech\Spanish Inquisition\goaway.wav
2d34ffcaa6286e319021ed08b96de4f9  Data\Audio\speech\Spanish Inquisition\grenade.wav
a701f3cd59ee88d677dec6697096f8c1  Data\Audio\speech\Spanish Inquisition\happy2.wav
cc16b7c46d2c6f6789c240fb6cfa7b32  Data\Audio\speech\Spanish Inquisition\happy3.wav
c608c99975e9c909bf02c8d8077b0187  Data\Audio\speech\Spanish Inquisition\hello.wav
f3757089800ff9d7bdc223a99f538c02  Data\Audio\speech\Spanish Inquisition\hurry.wav
6f0f98090a6cf288ff40aeefc7ede56b  Data\Audio\speech\Spanish Inquisition\idle1.wav
dd3ef652b1a636513d0c87a923f70c31  Data\Audio\speech\Spanish Inquisition\idle2.wav
584fd700c0028751cac00ffcbbedfed9  Data\Audio\speech\Spanish Inquisition\idle4.wav
cba0813067a0a78f3ec9aacc810dfe3d  Data\Audio\speech\Spanish Inquisition\illgetyou.wav
95a1d10b4b1b98521624a0f0aaa4156b  Data\Audio\speech\Spanish Inquisition\incoming.wav
5c0a3dea36b45caac4ca434b08a4d41a  Data\Audio\speech\Spanish Inquisition\jump1.wav
42d2f59b4f8d62276666e58b7c71d24f  Data\Audio\speech\Spanish Inquisition\jump2.wav
1187769e9eb223b247d5619b23a780cf  Data\Audio\speech\Spanish Inquisition\justyouwait.wav
bd420a51ee18f15bcae3979f5d4f5d35  Data\Audio\speech\Spanish Inquisition\kamikaze.wav
661155729b23d93f965c141d35944b75  Data\Audio\speech\Spanish Inquisition\laugh.wav
c4acb0378ac103a0ff4a81956edd4f9d  Data\Audio\speech\Spanish Inquisition\leavemealone.wav
e770cbc44136c74ecdc3227e17f4d2ca  Data\Audio\speech\Spanish Inquisition\loseloop.wav
2d22a18f1005d904d8473df2f9782305  Data\Audio\speech\Spanish Inquisition\missed.wav
a439703f9813640e16da144834cf690a  Data\Audio\speech\Spanish Inquisition\no.wav
ea011d1c9743c233f2fe8395452e6b4e  Data\Audio\speech\Spanish Inquisition\ohdear.wav
0e2285c15689688126b93fd82694b932  Data\Audio\speech\Spanish Inquisition\oinutter.wav
c3c0676f3ad9ac774dea143f16ff1bd9  Data\Audio\speech\Spanish Inquisition\oof1.wav
3fdad1bb6b88f91db0bbf61f48dd6298  Data\Audio\speech\Spanish Inquisition\oof2.wav
b1f4002ef3579bde56899442e5e60d1d  Data\Audio\speech\Spanish Inquisition\oops.wav
c66fd7f86f815b919129a8b65d33cb2b  Data\Audio\speech\Spanish Inquisition\orders.wav
6a2420a95cf9504119948d11f4d8820e  Data\Audio\speech\Spanish Inquisition\ouch.wav
fadc4ac5c56a1d8369315576ff8da34d  Data\Audio\speech\Spanish Inquisition\ow1.wav
2ec2ba8d6693ba8a3abd2fc9be18fece  Data\Audio\speech\Spanish Inquisition\ow2.wav
13adc9f9aaf0e0c0d60fe5a410e7be12  Data\Audio\speech\Spanish Inquisition\perfect.wav
f136490ae2c1a4eb061a07286797d400  Data\Audio\speech\Spanish Inquisition\pray.wav
46a1950c9b18b80a0e4c557e77b37d0f  Data\Audio\speech\Spanish Inquisition\relief.wav
c79cd278366f0754c499eed0e0beb4f2  Data\Audio\speech\Spanish Inquisition\revenge.wav
63e8186d8d0360f6d92ffbf375ef331a  Data\Audio\speech\Spanish Inquisition\runaway.wav
7a0c138a94ea85ddf8c2390a6170c6d8  Data\Audio\speech\Spanish Inquisition\sad1.wav
3ebe7f5ac7b773127fa83ef4c76c6bd3  Data\Audio\speech\Spanish Inquisition\sad2.wav
7b82cd24ed8e886d4656cd2c1820d69f  Data\Audio\speech\Spanish Inquisition\scared1.wav
9dbe873e0ab74879c10d7c4ad922a8e1  Data\Audio\speech\Spanish Inquisition\scared2.wav
df070f99ae21dcb692838a50b4bc37c4  Data\Audio\speech\Spanish Inquisition\stupid.wav
38dd40f3f7b873b0441441a3e9862e8c  Data\Audio\speech\Spanish Inquisition\takecover.wav
8a1d1032a0d57601558ec2fcf7d9934d  Data\Audio\speech\Spanish Inquisition\taunt1.wav
a1b9b6f77582ef8cbbe42a3e288b5380  Data\Audio\speech\Spanish Inquisition\traitor.wav
cd5cdb23cf66b785bdc4860f682d9fe9  Data\Audio\speech\Spanish Inquisition\uhoh.wav
a556611db1f9d7b30d5b3fd560e02841  Data\Audio\speech\Spanish Inquisition\victory.wav
11aa0bf7cb75f8c4a6010193049b0f2b  Data\Audio\speech\Spanish Inquisition\watchthis.wav
0691635ed890e4b7618c8ae8c205771b  Data\Audio\speech\Spanish Inquisition\whatthe.wav
850fdadcac2a7f3111cb2643d2685c98  Data\Audio\speech\Spanish Inquisition\yessir.wav
ba39cb6523368b58b3687a18c7a591f6  Data\Audio\speech\Spanish Inquisition\youllregretthat.wav
7d9f2eaac13ee069633bcf8aa7ca4b19  Data\Audio\speech\Super Hero\amazing.wav
17da47cbd97b76cf9468c8aff283fba4  Data\Audio\speech\Super Hero\angry.wav
8fad33ee5b259df2f9ddd061677b53f7  Data\Audio\speech\Super Hero\angry2.wav
94104d5c2f2fb491d86aeb9b515c0e8c  Data\Audio\speech\Super Hero\boring.wav
eaef659324b996206af0ba509cf93f91  Data\Audio\speech\Super Hero\brilliant.wav
193cdc34e80043e1d9fef4f6555983e6  Data\Audio\speech\Super Hero\bummer.wav
1fa6f8f2edbe4e12f3991cd05dfe0972  Data\Audio\speech\Super Hero\byebye.wav
37aadb17562faea3b0c4765db023e404  Data\Audio\speech\Super Hero\collect.wav
b9107e62957c460550aed6cfa7f1f61f  Data\Audio\speech\Super Hero\comeonthen.wav
8130cadef2186b01f6348e90237fb658  Data\Audio\speech\Super Hero\coward.wav
f26a7157e703d119f8933f06d1a5d7bd  Data\Audio\speech\Super Hero\dragonpunch.wav
5001ef00330ccc7b94d7f7ceb13b1e4e  Data\Audio\speech\Super Hero\drop.wav
7f626e94a47806d2fc22483e502ac663  Data\Audio\speech\Super Hero\excellent.wav
2a43b041324ba8072e0d2cdcd500b13e  Data\Audio\speech\Super Hero\fatality.wav
bd0d016c1d94029e1bd7958b7f27de73  Data\Audio\speech\Super Hero\fire.wav
945017c2e589017a1ce13b2b5406895a  Data\Audio\speech\Super Hero\fireball.wav
70db91753b75157ca61e7d80441f3aa0  Data\Audio\speech\Super Hero\firstblood.wav
662e24c372ed5b35abae78907eb13df1  Data\Audio\speech\Super Hero\flawless.wav
27cb68644cee82cd9fcac81f5bc68541  Data\Audio\speech\Super Hero\goaway.wav
eb53381e873e8cc4dfe18d32c215575a  Data\Audio\speech\Super Hero\grenade.wav
2d3dc8280009b8a529f57f733dac4c21  Data\Audio\speech\Super Hero\happy2.wav
1ba665ffe153b05cda3504284bed557d  Data\Audio\speech\Super Hero\happy3.wav
4c5a7b92fe61aee50d6945e0bc907a70  Data\Audio\speech\Super Hero\hello.wav
3e4a356733cafe2fd61c0bdf943290a9  Data\Audio\speech\Super Hero\hurry.wav
2d53f0173b414009ce5a947fa95c349c  Data\Audio\speech\Super Hero\idle1.wav
4b14e6a68372f4961bbda3d6290c6238  Data\Audio\speech\Super Hero\idle2.wav
72b3f0151195b0bce7b0abee28eb838f  Data\Audio\speech\Super Hero\idle4.wav
c6e9d4983a788f80c3baa55bb7ee624f  Data\Audio\speech\Super Hero\illgetyou.wav
14ac0308dc51dce96bc4a19431c7560f  Data\Audio\speech\Super Hero\incoming.wav
13230f1bd1109f26feb1149881f6be5e  Data\Audio\speech\Super Hero\jump1.wav
132b98daea75704a413bccfbfc684fc7  Data\Audio\speech\Super Hero\jump2.wav
13aa952aa9cdd5ba84d123c6cee6881c  Data\Audio\speech\Super Hero\justyouwait.wav
90039687dc81785ecc4e142d42299329  Data\Audio\speech\Super Hero\kamikaze.wav
ab920f88d938bcf0c1d5233438745a39  Data\Audio\speech\Super Hero\laugh.wav
71c1413ad021e0ac37a549b658d55a99  Data\Audio\speech\Super Hero\leavemealone.wav
3f76e7bc9de0105991782e1bba3b65f4  Data\Audio\speech\Super Hero\loseloop.wav
3b18476722c74df515cf50b2c423fa75  Data\Audio\speech\Super Hero\missed.wav
e90919978302abfe874ac5f71c88ff10  Data\Audio\speech\Super Hero\no.wav
5349281c1157566c7aa932fc5c3ce689  Data\Audio\speech\Super Hero\ohdear.wav
c38a7d38b4db3690aa32f16979b0d62d  Data\Audio\speech\Super Hero\oinutter.wav
81d2323aca7d4f49227e85e31285902a  Data\Audio\speech\Super Hero\oof1.wav
52f2241ce1b965f52c8498e363592287  Data\Audio\speech\Super Hero\oof2.wav
c4c02cd1218f86665de2080c6f85b708  Data\Audio\speech\Super Hero\oops.wav
ac44895d666d2b0f0b9f163e8801206f  Data\Audio\speech\Super Hero\orders.wav
2ec250961013a7d732f08c86472c8ebb  Data\Audio\speech\Super Hero\ouch.wav
dddec0a8735e50b2c46cd5cd1e710b5e  Data\Audio\speech\Super Hero\ow1.wav
4a108f7cc3f6900686741b2f85acffa9  Data\Audio\speech\Super Hero\ow2.wav
3bd5602327608f68d51c022114a72f54  Data\Audio\speech\Super Hero\perfect.wav
d56681cae4d12965c296704eb79d563e  Data\Audio\speech\Super Hero\pray.wav
2a85ee60beb1611ad4cb0da0e5374fca  Data\Audio\speech\Super Hero\relief.wav
a0ae41dc5c331c7e2cf7ff736557b390  Data\Audio\speech\Super Hero\revenge.wav
3c76bde6e22d907c28204cf4a12546a6  Data\Audio\speech\Super Hero\runaway.wav
5cb54d2659330e744abd589162292721  Data\Audio\speech\Super Hero\sad1.wav
b16957b4b237843f16f2097c877c5570  Data\Audio\speech\Super Hero\sad2.wav
a3ff4e97bf5b64d1dd88b80fb152132f  Data\Audio\speech\Super Hero\scared1.wav
5bb654f6dcb820e54b4fd8e68c75547b  Data\Audio\speech\Super Hero\scared2.wav
4c66c4dceeceac90c58b2aa4dc62ddab  Data\Audio\speech\Super Hero\stupid.wav
4588a0a7d5d9c45e11a1f37fd447afca  Data\Audio\speech\Super Hero\takecover.wav
afd8a00847ebf229947e9d4ccf5aa1f1  Data\Audio\speech\Super Hero\taunt1.wav
9104fc27db36bd88ce5e76133aa518f4  Data\Audio\speech\Super Hero\traitor.wav
36639c93cedfa6ccb8f98d67d6328244  Data\Audio\speech\Super Hero\uhoh.wav
60200b00f97ce090182603dfba2cb006  Data\Audio\speech\Super Hero\victory.wav
cdaac12c1ce38df7fa05579c17d9a0bd  Data\Audio\speech\Super Hero\watchthis.wav
91eefe22f469c4ffe59c051f7dfc4bf5  Data\Audio\speech\Super Hero\whatthe.wav
58ce5ae633a1c8fb0d81bf6d66ee941a  Data\Audio\speech\Super Hero\yessir.wav
038d0c64a17c540215a2dab1bff68356  Data\Audio\speech\Super Hero\youllregretthat.wav
998e32d48d527870473af2fbff822e92  Data\Audio\speech\Super Villain\amazing.wav
b6320c43c05e5ec9a1765cd5ed4986bd  Data\Audio\speech\Super Villain\angry.wav
37c9fea616c09ce66bd9fb85a3813b75  Data\Audio\speech\Super Villain\angry2.wav
b8ef49689e62f469c4e227f6e53f51dc  Data\Audio\speech\Super Villain\boring.wav
22383d5ce9d0e3ea79107ba9f693d9ad  Data\Audio\speech\Super Villain\brilliant.wav
4383e9f7c5d584ad259913e12a08685e  Data\Audio\speech\Super Villain\bummer.wav
ed4b9d790729ad6cdf8222ebed67abb6  Data\Audio\speech\Super Villain\byebye.wav
d4dd58b39486110a6775b32848cf0ae1  Data\Audio\speech\Super Villain\collect.wav
5964e12167e745dd0205605a5ae6d049  Data\Audio\speech\Super Villain\comeonthen.wav
3ea4cd686d0ac65afbf4b7efc474a08b  Data\Audio\speech\Super Villain\coward.wav
bda417198b720ab06b13db6afa926938  Data\Audio\speech\Super Villain\dragonpunch.wav
d07765a7218555fffd6a39e5960da488  Data\Audio\speech\Super Villain\drop.wav
7d14820f436f6a27deb492bc113fadce  Data\Audio\speech\Super Villain\excellent.wav
99bae28f5ae49cdfb64254b6b92a0ec2  Data\Audio\speech\Super Villain\fatality.wav
c06bc5107d82c853b529496c8913a3e5  Data\Audio\speech\Super Villain\fire.wav
6e32236efa063c257865d993e1a4c91b  Data\Audio\speech\Super Villain\fireball.wav
a20444a8e437863ac6264ccc795b673c  Data\Audio\speech\Super Villain\firstblood.wav
6c66febd4a96674f74ea99bf9f8338e8  Data\Audio\speech\Super Villain\flawless.wav
396b2df6dee996fcd9abea52741fd6a2  Data\Audio\speech\Super Villain\goaway.wav
f1e8522e4c938c1fea7dc07ac083f2a6  Data\Audio\speech\Super Villain\grenade.wav
88e6c35a29032dbb15e8973bff4d0b4a  Data\Audio\speech\Super Villain\happy2.wav
958baf1e5b1d781c6834451ebd986df1  Data\Audio\speech\Super Villain\happy3.wav
99f3600f7b2123ab37058a2d90d0b76c  Data\Audio\speech\Super Villain\hello.wav
f4f748202a740a2f2d8d7d1458352fb4  Data\Audio\speech\Super Villain\hurry.wav
1424b1b0deb53464708436cddd595a7f  Data\Audio\speech\Super Villain\idle1.wav
a840ea2dc18d3fc5ba3230d48748e430  Data\Audio\speech\Super Villain\idle2.wav
06920c5e4836777a1ce5b1f7829317bb  Data\Audio\speech\Super Villain\idle4.wav
b93f78cea4fdcdbdaffb7dc29bba760c  Data\Audio\speech\Super Villain\illgetyou.wav
bb45a096bf8cdcf4ea73f83ee17ffa2a  Data\Audio\speech\Super Villain\incoming.wav
fd25891df0c1f9cd80b5c91360615634  Data\Audio\speech\Super Villain\jump1.wav
65ff736a732533435eb804292234da16  Data\Audio\speech\Super Villain\jump2.wav
15b5312405139e3fdda3f8df3375728b  Data\Audio\speech\Super Villain\justyouwait.wav
6128e207e290542a55f6d5c07b4e969c  Data\Audio\speech\Super Villain\kamikaze.wav
0163cca1fa3fc81b0520ba9ed4fbbe14  Data\Audio\speech\Super Villain\laugh.wav
5fd456e90501cd72829703d28898b909  Data\Audio\speech\Super Villain\leavemealone.wav
998f568ce650a66981e42d0460aa29d6  Data\Audio\speech\Super Villain\loseloop.wav
aa903d1e3426a6b20713708298e0fd39  Data\Audio\speech\Super Villain\missed.wav
38b346a20a898c2c4a4841d5940340b9  Data\Audio\speech\Super Villain\no.wav
4e232309a56b2e7a4a99d477a06ac322  Data\Audio\speech\Super Villain\ohdear.wav
9c5b7bd12b60d52af14be3f0082168a2  Data\Audio\speech\Super Villain\oinutter.wav
e627dcdac97f9798b8f98d249a0d6933  Data\Audio\speech\Super Villain\oof1.wav
96d6f2d4b57e7d6c17723a4cc0fb4097  Data\Audio\speech\Super Villain\oof2.wav
4493f89eb68392a026541bd13d434a89  Data\Audio\speech\Super Villain\oops.wav
97f7653dd9cb9fd6ed3efda31bca8d14  Data\Audio\speech\Super Villain\orders.wav
a8177f5da478ec8a7d324f742e49ef9c  Data\Audio\speech\Super Villain\ouch.wav
a54d4ef4186e5f618c98b526c64ddc1c  Data\Audio\speech\Super Villain\ow1.wav
2d698918d581a611f28942d75b435cdb  Data\Audio\speech\Super Villain\ow2.wav
f6375c1e775db7d0bb3af9b4f7cb6842  Data\Audio\speech\Super Villain\perfect.wav
e5f573ef0c1f127a4e31169b3a1ed544  Data\Audio\speech\Super Villain\pray.wav
506d3dfd8e0a9ea85033e0d2659809b9  Data\Audio\speech\Super Villain\relief.wav
e1a12106b68595a6cafb4d920c0deac9  Data\Audio\speech\Super Villain\revenge.wav
3535702bfd27683546ff06976b2a31c0  Data\Audio\speech\Super Villain\runaway.wav
740daeecce7253959ae15bf47dac0126  Data\Audio\speech\Super Villain\sad1.wav
af26c7827cb33b70eed7a299b24e8c8e  Data\Audio\speech\Super Villain\sad2.wav
e050ddb777e0f2c9ad28e435ecc28167  Data\Audio\speech\Super Villain\scared1.wav
42d494d37b42a9ee3ca132bb6ce28b3c  Data\Audio\speech\Super Villain\scared2.wav
a0c32ab57977e3df3240cabf8bb9dae4  Data\Audio\speech\Super Villain\stupid.wav
029be50cd74ae4921b61f618d8b74eda  Data\Audio\speech\Super Villain\takecover.wav
f10d6595c38f3c4680a4c19d8a4c74ca  Data\Audio\speech\Super Villain\taunt1.wav
2539d15a15375b38349ee7e4d6eefc1e  Data\Audio\speech\Super Villain\traitor.wav
9ea2456f5dbfe7dcfeb60950c74baab9  Data\Audio\speech\Super Villain\uhoh.wav
038f92fab5e4bc33a0013d7728f958ad  Data\Audio\speech\Super Villain\victory.wav
bbff9442d4097ec80c080b2dbcf16b1b  Data\Audio\speech\Super Villain\watchthis.wav
ab6e46d5f02c458ba21315bf08d145f8  Data\Audio\speech\Super Villain\whatthe.wav
afe50478a4bf8d829817159eeb7ad0c5  Data\Audio\speech\Super Villain\yessir.wav
3dbe270ef59652f66e36efa00380ef5b  Data\Audio\speech\Super Villain\youllregretthat.wav
3415cbc83bd11bf9a72f0228c6e79b16  Data\Audio\speech\Surfer\amazing.wav
2bb16049328766e6624e64e9d8c9a036  Data\Audio\speech\Surfer\angry.wav
7fd3140e99c9baea590e5b9ecc74bef6  Data\Audio\speech\Surfer\angry2.wav
0bae54e9255ac59152bf14645304350a  Data\Audio\speech\Surfer\boring.wav
e2b4dbd0a63e88ed375b8461564e9143  Data\Audio\speech\Surfer\brilliant.wav
05fe7b8560c193c8ffd0cb13ff55dddd  Data\Audio\speech\Surfer\bummer.wav
61168b0a6f002beb3c247fb1fe9142c7  Data\Audio\speech\Surfer\byebye.wav
0764c9a75316db779141201c48154da7  Data\Audio\speech\Surfer\collect.wav
09c4acbcb899af2b757998f4c9f40b50  Data\Audio\speech\Surfer\comeonthen.wav
2f66e9ca49b7dc4d8b62063032da12b1  Data\Audio\speech\Surfer\coward.wav
3dbac5d3dd5b127e7425081d73bcc80d  Data\Audio\speech\Surfer\dragonpunch.wav
2b3c6f48ed4138e780d2258cab3e45aa  Data\Audio\speech\Surfer\drop.wav
b1480ee9e2094575b138bf945705f109  Data\Audio\speech\Surfer\excellent.wav
e2d3b6553e4db0be83e8dc4ba42da94b  Data\Audio\speech\Surfer\fatality.wav
9460b7e7f26833896cf176c6532ab0d5  Data\Audio\speech\Surfer\fire.wav
e42c6f5c9326f51594da44b74acd7e4e  Data\Audio\speech\Surfer\fireball.wav
7ec2a80743ffdcdebaa6d38c5fa25125  Data\Audio\speech\Surfer\firstblood.wav
768f844cc865b67b7f19719fd0b5ed8d  Data\Audio\speech\Surfer\flawless.wav
b33a7d2f7c5de0c1a99ffeef3dca43d2  Data\Audio\speech\Surfer\goaway.wav
5ad676bf5564f634f34161291fc07250  Data\Audio\speech\Surfer\grenade.wav
3034591b2d466d5b2f00d5ea1dbfa0fa  Data\Audio\speech\Surfer\happy2.wav
b1f404fce70ec08e62d34d8c6f27ca47  Data\Audio\speech\Surfer\happy3.wav
016d56435e0810464f4947ddea0dbc55  Data\Audio\speech\Surfer\hello.wav
3d562bf7ebd39cc15ed9578528b73db2  Data\Audio\speech\Surfer\hurry.wav
bf993cbe16f8b25c7cc20bd9c1cdffb4  Data\Audio\speech\Surfer\idle1.wav
70ab3d723e11c19a8f398e0b2a10357c  Data\Audio\speech\Surfer\idle2.wav
d595f32ab8eafe7cb4046e7678f1c3a3  Data\Audio\speech\Surfer\idle4.wav
5300acd319e33818118e6530d48c945f  Data\Audio\speech\Surfer\illgetyou.wav
96602363f0d7b2f2cd237acf1e6d989a  Data\Audio\speech\Surfer\incoming.wav
fcd3095dfb583767bdecfb6d6a0d973f  Data\Audio\speech\Surfer\jump1.wav
921d9f11c07abc4d70dcc7901457bb1a  Data\Audio\speech\Surfer\jump2.wav
1ebc038c99d6fa60b6ca4840e71c6e60  Data\Audio\speech\Surfer\justyouwait.wav
cc97778f4a9e289835597f26bc0c3be4  Data\Audio\speech\Surfer\kamikaze.wav
4574a58feaea9a489656449a078e6626  Data\Audio\speech\Surfer\laugh.wav
093357ba98a403ada9febefef32d874d  Data\Audio\speech\Surfer\leavemealone.wav
f061be14ab1c6f5686e5a34857551ae9  Data\Audio\speech\Surfer\loseloop.wav
f2fba7fa80dadf026eb261a2056ecafc  Data\Audio\speech\Surfer\missed.wav
d8ab3fc67cbe239dcee9fd38c4fa654b  Data\Audio\speech\Surfer\no.wav
ed4e09859d6e0a6e0f4f944a3d23f1b6  Data\Audio\speech\Surfer\ohdear.wav
ce30147fec874ebd0ed445e038cbfced  Data\Audio\speech\Surfer\oinutter.wav
157614c0e12397782722b34d6d296770  Data\Audio\speech\Surfer\oof1.wav
ea624162e4249b759aae96a0937260f0  Data\Audio\speech\Surfer\oof2.wav
57a55c718475749b90b6409ef8606aad  Data\Audio\speech\Surfer\oops.wav
a5547a01cb0c76f58c25e0f4b9d59274  Data\Audio\speech\Surfer\orders.wav
52cbc614ef4a18ba1e9557b612a50753  Data\Audio\speech\Surfer\ouch.wav
46c5b02bdea1af77e75a0166e9bd46d5  Data\Audio\speech\Surfer\ow1.wav
6980413075eae5f34a7858147f25ef08  Data\Audio\speech\Surfer\ow2.wav
5874051ac0314eacea45bfab6c212464  Data\Audio\speech\Surfer\perfect.wav
86d02641ffa0da8c1100d0766db9517f  Data\Audio\speech\Surfer\pray.wav
981b58a3430db761a051009424fa4511  Data\Audio\speech\Surfer\relief.wav
8d232f137275ffd97c91d634c525a2ec  Data\Audio\speech\Surfer\revenge.wav
de751ad7adbf1a54ed9ce2412493efbb  Data\Audio\speech\Surfer\runaway.wav
fbbdf7a4b8ba69a83589410eecaa17ef  Data\Audio\speech\Surfer\sad1.wav
6ee1e1f0ae0e293f129c1a583a831096  Data\Audio\speech\Surfer\sad2.wav
96417d3ced2b27187833e8285b4d8697  Data\Audio\speech\Surfer\scared1.wav
4e7fada4dd62d14bb7275806abe22f0e  Data\Audio\speech\Surfer\scared2.wav
ec0347ad304e5a50081908a9c011a99d  Data\Audio\speech\Surfer\stupid.wav
5e47529fbdafd693a749a93d11ffa59e  Data\Audio\speech\Surfer\takecover.wav
9ff987769f52f3dfea34487852117954  Data\Audio\speech\Surfer\taunt1.wav
415b7c6ca6f9443918e567d708d069b0  Data\Audio\speech\Surfer\traitor.wav
f1f1c4bb20ab69a3c52637ab4fbcbaf0  Data\Audio\speech\Surfer\uhoh.wav
b9634efebb4aabea37c9a61c5b9f788e  Data\Audio\speech\Surfer\victory.wav
e0622ae83b418d8442b0210a299a1259  Data\Audio\speech\Surfer\watchthis.wav
caaf47061db50ec47f4a88eaff8db691  Data\Audio\speech\Surfer\whatthe.wav
cfca94b5b52cf9bd3101c4415cd7872b  Data\Audio\speech\Surfer\yessir.wav
9ad29a0bfb42502f72fdc567a7aacf14  Data\Audio\speech\Surfer\youllregretthat.wav
c0bc33b73100402d214f8bc86477690c  Data\Audio\speech\Teenage Angst\amazing.wav
114f0670b89f9d46bf837174a0ed7c63  Data\Audio\speech\Teenage Angst\angry.wav
6aac69f31173894daabfe37b319bd49a  Data\Audio\speech\Teenage Angst\angry2.wav
91f88f39287217e87b1cc8a6a8b1ff56  Data\Audio\speech\Teenage Angst\boring.wav
5f3a2c95e2f1cb85b0be6c1bccaad344  Data\Audio\speech\Teenage Angst\brilliant.wav
6eeab850691752a319c9413d0774be77  Data\Audio\speech\Teenage Angst\bummer.wav
37922251796b70ccd9bfe9c37e8997be  Data\Audio\speech\Teenage Angst\byebye.wav
41c230712fffbf379c4923ce25ce0a2a  Data\Audio\speech\Teenage Angst\collect.wav
ca2f2c9d7364197831e0421a6d3b7836  Data\Audio\speech\Teenage Angst\comeonthen.wav
cfc0abd4b58f2919a57bf7eb45e7fa23  Data\Audio\speech\Teenage Angst\coward.wav
0b36204a61c97dcd7bb771f9a624e79b  Data\Audio\speech\Teenage Angst\dragonpunch.wav
b6fb6af3cd670a79f04f6eb126fa730a  Data\Audio\speech\Teenage Angst\drop.wav
b7f3aa5a9916f435aa9bf9293c2f5aa4  Data\Audio\speech\Teenage Angst\excellent.wav
f92167264786cd5e6eb68a1ec4eed7e7  Data\Audio\speech\Teenage Angst\fatality.wav
88c578d16b3cd7d32e590c5ebc5fae82  Data\Audio\speech\Teenage Angst\fire.wav
401f3ec3e60f17e25bac68cf64352972  Data\Audio\speech\Teenage Angst\fireball.wav
e8b63b90ec52fcf0af8fa39115400da2  Data\Audio\speech\Teenage Angst\firstblood.wav
ee766011c081dd5698cd86d3f998341f  Data\Audio\speech\Teenage Angst\flawless.wav
e1d99c5a7bc3785e25b94c732c2141cc  Data\Audio\speech\Teenage Angst\goaway.wav
4e429582bfadd3a29333c5a5c08803af  Data\Audio\speech\Teenage Angst\grenade.wav
db6a72ed6974158ab12d148c85caae22  Data\Audio\speech\Teenage Angst\happy2.wav
67b38ed602fd89ff8ab568b72f742a04  Data\Audio\speech\Teenage Angst\happy3.wav
2aa4de06c6d439cbdd5942b7171748c8  Data\Audio\speech\Teenage Angst\hello.wav
4463125bc6b863ffc8e16f373ebccf7b  Data\Audio\speech\Teenage Angst\hurry.wav
f056d97a1e8db62b26ace46e5e6f9005  Data\Audio\speech\Teenage Angst\idle1.wav
6aadd59f4902324e889bebfc33f09b20  Data\Audio\speech\Teenage Angst\idle2.wav
74a4c8aefb7f880db4f088d7981a7ac7  Data\Audio\speech\Teenage Angst\idle4.wav
bbbdba23d75f4d159a0519c9c2e57f61  Data\Audio\speech\Teenage Angst\illgetyou.wav
cc16d278a1eddd2009b66cc307b5c482  Data\Audio\speech\Teenage Angst\incoming.wav
3de02d21b4f234ba892132e6c0760eea  Data\Audio\speech\Teenage Angst\jump1.wav
689799452408a5cdccdf7a4dc3bd8792  Data\Audio\speech\Teenage Angst\jump2.wav
5e2e43caa521fd358141b91747f55c9c  Data\Audio\speech\Teenage Angst\justyouwait.wav
f450946c52652cc19773df5cb35596aa  Data\Audio\speech\Teenage Angst\kamikaze.wav
198fa3c4e48e73c3aeb8e690cfdc3e40  Data\Audio\speech\Teenage Angst\laugh.wav
3be897795d0a6dc67a2d22319d09ebb5  Data\Audio\speech\Teenage Angst\leavemealone.wav
d12f5f846452eada7f59816302e9e486  Data\Audio\speech\Teenage Angst\loseloop.wav
9a5a989dd420f05fcda423bb8d06a86e  Data\Audio\speech\Teenage Angst\missed.wav
8d435a5a137d1c14651ee0afc6509da3  Data\Audio\speech\Teenage Angst\no.wav
eefdcd17ea9a40ff1376d15efbbeb704  Data\Audio\speech\Teenage Angst\ohdear.wav
881f4d69fea8e2b078c716e88e896895  Data\Audio\speech\Teenage Angst\oinutter.wav
2c8b8c72f604046663f37429b3091b2b  Data\Audio\speech\Teenage Angst\oof1.wav
60fd14e7a4ef9c7b19e8c2db08b0da97  Data\Audio\speech\Teenage Angst\oof2.wav
881b04e7f373bc6da2a9895b84702043  Data\Audio\speech\Teenage Angst\oops.wav
67b889596594e93c693c6050e2b45305  Data\Audio\speech\Teenage Angst\orders.wav
ecda9c047ca74872f6326f771e39136d  Data\Audio\speech\Teenage Angst\ouch.wav
e70fb737ba8ef9a0a33ed33031f21e00  Data\Audio\speech\Teenage Angst\ow1.wav
8691c38529fa393377e12d1eed74eadb  Data\Audio\speech\Teenage Angst\ow2.wav
4827da05912b7d68fcab3aef1886bba3  Data\Audio\speech\Teenage Angst\perfect.wav
09dd2719e177e1f540ca53c41d63fe59  Data\Audio\speech\Teenage Angst\pray.wav
e7e4770fd077b01d9c6b96722e177b79  Data\Audio\speech\Teenage Angst\relief.wav
d4b7ad8c897b15835f6a35fea0c7017e  Data\Audio\speech\Teenage Angst\revenge.wav
c7ab6026364d96d18bb7159bb03f2a57  Data\Audio\speech\Teenage Angst\runaway.wav
c4999da666821a17a06ead5ef16a3752  Data\Audio\speech\Teenage Angst\sad1.wav
b133565e555f00cbdeeaa61a4917dfd3  Data\Audio\speech\Teenage Angst\sad2.wav
c39a83ef90d4ed4570b26219ee4e39aa  Data\Audio\speech\Teenage Angst\scared1.wav
8c8484d184b77aeda4e571ccfdc8c40f  Data\Audio\speech\Teenage Angst\scared2.wav
e09a36e9450c53a03a6aff9713a005c4  Data\Audio\speech\Teenage Angst\stupid.wav
cf2602145ac2a2dc620164435f4d8914  Data\Audio\speech\Teenage Angst\takecover.wav
1c0f68e84108fa9e693a2fa7de36ed2a  Data\Audio\speech\Teenage Angst\taunt1.wav
6da2d54a88b8381c344f002282d42d67  Data\Audio\speech\Teenage Angst\traitor.wav
0d3f208fd4ee6f4fbc6c3cedb5ea206f  Data\Audio\speech\Teenage Angst\uhoh.wav
cab9c77c7e236de43380f0485895d304  Data\Audio\speech\Teenage Angst\victory.wav
a267a35fc8d2be33984acf5225724527  Data\Audio\speech\Teenage Angst\watchthis.wav
4de9499deaa4f3588e7c303972c6fa65  Data\Audio\speech\Teenage Angst\whatthe.wav
f4f7b8f8586d1246fbf357f8191fe7a4  Data\Audio\speech\Teenage Angst\yessir.wav
1f02aa4519704f1fd04d5a05c57f20f9  Data\Audio\speech\Teenage Angst\youllregretthat.wav
8260d8f2d54b8ee960a3bde3b3757d0c  Data\Audio\speech\Two Smoking Barrels\amazing.wav
3a3d8535099dc8f9fc7b92ef2ece55d3  Data\Audio\speech\Two Smoking Barrels\angry.wav
9e4b239622f372f2ff0062fac2f8e432  Data\Audio\speech\Two Smoking Barrels\angry2.wav
61172167b97becf78dd7adc68dc61652  Data\Audio\speech\Two Smoking Barrels\boring.wav
36d42c9dd487d72e083c1f09ba24adef  Data\Audio\speech\Two Smoking Barrels\brilliant.wav
55197155a1c6610c5686c4b6bed43e36  Data\Audio\speech\Two Smoking Barrels\bummer.wav
91bba37182473d6db8accc52ce105c47  Data\Audio\speech\Two Smoking Barrels\byebye.wav
cbbf16142efd9fd688d2262af055a7b8  Data\Audio\speech\Two Smoking Barrels\collect.wav
75b19e9aee688311b6f9dcce9b0060c9  Data\Audio\speech\Two Smoking Barrels\comeonthen.wav
c6515c47dc55aa355785d8a26e4e0563  Data\Audio\speech\Two Smoking Barrels\coward.wav
07d22d3b10947a9a8e139006091d728f  Data\Audio\speech\Two Smoking Barrels\dragonpunch.wav
bfa8a7956ab5ce4b2dda8d52f29c4e10  Data\Audio\speech\Two Smoking Barrels\drop.wav
ee021ea78cddd1982f9ff94a7c861886  Data\Audio\speech\Two Smoking Barrels\excellent.wav
ad3acccc1d51eb75a00ec4b011d7f760  Data\Audio\speech\Two Smoking Barrels\fatality.wav
7a264d2cca1802128c270f396ac6859a  Data\Audio\speech\Two Smoking Barrels\fire.wav
5b1388439918053568c8d50e29ad5c9b  Data\Audio\speech\Two Smoking Barrels\fireball.wav
9ae7f1eaa1f9022770159d7ad9bc27fb  Data\Audio\speech\Two Smoking Barrels\firstblood.wav
2c93c7751254253e0a27ecdd80db0baf  Data\Audio\speech\Two Smoking Barrels\flawless.wav
37d225596ecd07c5ad93c820749c540c  Data\Audio\speech\Two Smoking Barrels\goaway.wav
95602746d0935677c030280f32b3f102  Data\Audio\speech\Two Smoking Barrels\grenade.wav
1c8fceb5854a445ba4c639f344d7e157  Data\Audio\speech\Two Smoking Barrels\happy2.wav
e78665f01e5f7be15c5f55a129b32292  Data\Audio\speech\Two Smoking Barrels\happy3.wav
0d3e728865d55bf76ed917173c78850c  Data\Audio\speech\Two Smoking Barrels\hello.wav
8959e62a3c05a280c962f19009c28d0e  Data\Audio\speech\Two Smoking Barrels\hurry.wav
7c658c0ed6799118ae262447adeea7a2  Data\Audio\speech\Two Smoking Barrels\idle1.wav
3bc945205c5f5e45fff44ba0663cc33c  Data\Audio\speech\Two Smoking Barrels\idle2.wav
872c7d4d7933b574f5435bf0373e1712  Data\Audio\speech\Two Smoking Barrels\idle4.wav
0f2d06f3e739ca07a4cf47d508a6a31f  Data\Audio\speech\Two Smoking Barrels\illgetyou.wav
1947ab4f4dfac7e422ecaf744b7e2b57  Data\Audio\speech\Two Smoking Barrels\incoming.wav
b4987b8784df835e8a754265e146f2ad  Data\Audio\speech\Two Smoking Barrels\jump1.wav
197ba825d17d54ead057ab7927056c0b  Data\Audio\speech\Two Smoking Barrels\jump2.wav
b75a045622e5598e0390eea21c934346  Data\Audio\speech\Two Smoking Barrels\justyouwait.wav
8596e56091899ba18a62fc58df3565fb  Data\Audio\speech\Two Smoking Barrels\kamikaze.wav
47d99512e019b45489c8c24f187bd59a  Data\Audio\speech\Two Smoking Barrels\laugh.wav
b006b268d0f0acf6b3efba67e2d5d395  Data\Audio\speech\Two Smoking Barrels\leavemealone.wav
9a242e998e42e6539d13b954654942b7  Data\Audio\speech\Two Smoking Barrels\loseloop.wav
b9df63bc22c51f140dc888f18467f9e6  Data\Audio\speech\Two Smoking Barrels\missed.wav
d426b803e3cf79c117aec893af3ab505  Data\Audio\speech\Two Smoking Barrels\no.wav
4c42b34b1838afd955dd2206a3cb86a3  Data\Audio\speech\Two Smoking Barrels\ohdear.wav
9bac3d710bf74bbc38609ddd775b3930  Data\Audio\speech\Two Smoking Barrels\oinutter.wav
d0b7666bbeee169f1ae62a7753f5c536  Data\Audio\speech\Two Smoking Barrels\oof1.wav
2252bacff346e253196e8f12a89bfe93  Data\Audio\speech\Two Smoking Barrels\oof2.wav
882848c46d00143489462184bc63aadc  Data\Audio\speech\Two Smoking Barrels\oops.wav
9605ba8b35f1e58b5bb2d9879f45ea41  Data\Audio\speech\Two Smoking Barrels\orders.wav
76e3ec9e8bc029144db16e81b8d9d3c5  Data\Audio\speech\Two Smoking Barrels\ouch.wav
1b2e6900beb6ff5239e2868efd57f0a8  Data\Audio\speech\Two Smoking Barrels\ow1.wav
009b881bd1a1cbcc6350c88c24b6ef40  Data\Audio\speech\Two Smoking Barrels\ow2.wav
40ba8ba54620e72593f66b12324dde89  Data\Audio\speech\Two Smoking Barrels\perfect.wav
1ee379d6a23393d55265a1f96b0fc5c4  Data\Audio\speech\Two Smoking Barrels\pray.wav
cdb2af840b3408db83e232adb4929972  Data\Audio\speech\Two Smoking Barrels\relief.wav
33ae3e1d41de20848186d71438c1bf88  Data\Audio\speech\Two Smoking Barrels\revenge.wav
8f293f360af82bdf7ec301db034cdf2c  Data\Audio\speech\Two Smoking Barrels\runaway.wav
5e035058ca2602d3e88e1835c4f7ff17  Data\Audio\speech\Two Smoking Barrels\sad1.wav
3dbc68ba6c56cab1a908bcedecf0ca1c  Data\Audio\speech\Two Smoking Barrels\sad2.wav
99ca4969a87a64e584d979b5da13b23c  Data\Audio\speech\Two Smoking Barrels\scared1.wav
4d3ac834ec48aeacdd6d1fa12d2ed36e  Data\Audio\speech\Two Smoking Barrels\scared2.wav
ee231448bcad8db94f1efaa11b223c9a  Data\Audio\speech\Two Smoking Barrels\stupid.wav
cdaa3d6eb8914aad37306481732233f9  Data\Audio\speech\Two Smoking Barrels\takecover.wav
8bd683cdae08ba079bdc04ba746313a4  Data\Audio\speech\Two Smoking Barrels\taunt1.wav
1800e34301d6fc12907463d674e6cc6d  Data\Audio\speech\Two Smoking Barrels\traitor.wav
5cca960128340714ff690dec86d22cb7  Data\Audio\speech\Two Smoking Barrels\uhoh.wav
928ea1ed07b6a6a43eb08ef453681912  Data\Audio\speech\Two Smoking Barrels\victory.wav
2e1dbfd6fc89c8dda18a0548e5c67888  Data\Audio\speech\Two Smoking Barrels\watchthis.wav
0d6f10f2af1586248ce4f837b4ec6fa3  Data\Audio\speech\Two Smoking Barrels\whatthe.wav
89f3e48015068d6261ab8da9b9f4851d  Data\Audio\speech\Two Smoking Barrels\yessir.wav
325f5cb0c24537affb150305d96c003c  Data\Audio\speech\Two Smoking Barrels\youllregretthat.wav
fee1ec602c7214c99a757ae02424affb  Data\Audio\speech\US Sports\amazing.wav
da6eab8a85f0ba8c0e5140bf542aa93f  Data\Audio\speech\US Sports\angry.wav
49fb4ef1a896b2961b904b27aa68de83  Data\Audio\speech\US Sports\angry2.wav
d3566fe44eb7ffed79b948b7ebe4a696  Data\Audio\speech\US Sports\boring.wav
dfc35f4ce3058978ba7a3ea1341df6d6  Data\Audio\speech\US Sports\brilliant.wav
83a190ff89f49c2c3c333740ffdf7fb8  Data\Audio\speech\US Sports\bummer.wav
46d2ff66caa36a85cf09d4c3ae76bd17  Data\Audio\speech\US Sports\byebye.wav
b9b78d134df773df386bab8150429f3e  Data\Audio\speech\US Sports\collect.wav
5efae07bbfe012558eff0d78450c30d7  Data\Audio\speech\US Sports\comeonthen.wav
e412839995423a4074f9a3b8723914a6  Data\Audio\speech\US Sports\coward.wav
e0c6462ff45df6812aa031490449842c  Data\Audio\speech\US Sports\dragonpunch.wav
d14ffd63b883477c01dc43daef70e566  Data\Audio\speech\US Sports\drop.wav
1c7fbd68b388b522dfdc260b72e7149f  Data\Audio\speech\US Sports\excellent.wav
44aa8c2b321a2f8ba82fb186a0b8276d  Data\Audio\speech\US Sports\fatality.wav
43c58bb6d1ea64ab32383fcdd41227a2  Data\Audio\speech\US Sports\fire.wav
d329d8e8f7b0c9e34b0589e06474315f  Data\Audio\speech\US Sports\fireball.wav
c4f66a0bcdb8fdf4d52ede5cdc2e044c  Data\Audio\speech\US Sports\firstblood.wav
5abdc9f21407105dedc8abe70bc043ca  Data\Audio\speech\US Sports\flawless.wav
b346e0bce454f9b35cf2cbef9576e67a  Data\Audio\speech\US Sports\goaway.wav
419404df211a7a0a706a64876d1852bb  Data\Audio\speech\US Sports\grenade.wav
9eb214eeaca9e356e5dd415a2a6f8506  Data\Audio\speech\US Sports\happy2.wav
2b066809915c2c28e2a293ad9e5e566d  Data\Audio\speech\US Sports\happy3.wav
18e77b0bb7337110e9d2041a3a46d0b3  Data\Audio\speech\US Sports\hello.wav
595b43ba7b003a788e6675a5c93c31f9  Data\Audio\speech\US Sports\hurry.wav
f67101bbcb485b98ad8c5dea40e49919  Data\Audio\speech\US Sports\idle1.wav
0618eb121554e30061971a630e8db785  Data\Audio\speech\US Sports\idle2.wav
8f251474de44e7ef27fe0bcad8c1244b  Data\Audio\speech\US Sports\idle4.wav
719e155bd77b456236963eb3ab36bcbb  Data\Audio\speech\US Sports\illgetyou.wav
b5e827423b902577070246a1fbb95aca  Data\Audio\speech\US Sports\incoming.wav
8c7d5bc72042bedc8c2921bc242fc718  Data\Audio\speech\US Sports\jump1.wav
2500e0faefbedc288b47c7c0b4949f20  Data\Audio\speech\US Sports\jump2.wav
d3cf34cf8f3fe8eb32dc9c4a78198c2b  Data\Audio\speech\US Sports\justyouwait.wav
5b895f07722e1bd277e1db1369a5e720  Data\Audio\speech\US Sports\kamikaze.wav
27aa8f2b0937bf4b577f920fcd39667a  Data\Audio\speech\US Sports\laugh.wav
18c57e65eb83281691dbcc68ed5c63e8  Data\Audio\speech\US Sports\leavemealone.wav
a55fa5cbab7511688774090507212d4a  Data\Audio\speech\US Sports\loseloop.wav
3f4c57386ae7e389471d4117e632411c  Data\Audio\speech\US Sports\missed.wav
4b8b11d84a98b13fa69e53c1cd83b56b  Data\Audio\speech\US Sports\no.wav
fa7971c7c666b20a8c1384a706eb8bc3  Data\Audio\speech\US Sports\ohdear.wav
3eddbc2e0972181f21c370bd29d8a609  Data\Audio\speech\US Sports\oinutter.wav
439d130ad0809fcca4db2688070a7def  Data\Audio\speech\US Sports\oof1.wav
6762a2a741c415656038e47d18064649  Data\Audio\speech\US Sports\oof2.wav
ee23a01d0dedb7613aee7709aca98bbf  Data\Audio\speech\US Sports\oops.wav
dbb21223a70b0b67208df54a6bc47761  Data\Audio\speech\US Sports\orders.wav
b0f08d2c85c5e21ad1dd3b43cb8d5236  Data\Audio\speech\US Sports\ouch.wav
158098dc294a4d1d75068517996d7590  Data\Audio\speech\US Sports\ow1.wav
d256a66acfa294492b9a6b5f3c894401  Data\Audio\speech\US Sports\ow2.wav
4cc35f11c027900260931ed5186e714e  Data\Audio\speech\US Sports\perfect.wav
790775a2b00f0694afac9496d9e3499d  Data\Audio\speech\US Sports\pray.wav
90d9eb25ad9136c609bf3f5105dd3530  Data\Audio\speech\US Sports\relief.wav
165aaa8a4dcf2937002008f2d7231cb8  Data\Audio\speech\US Sports\revenge.wav
c8adf547808645b7c69b867ccf3cbd65  Data\Audio\speech\US Sports\runaway.wav
7dcb9189fab02918c48ad2491ca02a55  Data\Audio\speech\US Sports\sad1.wav
06f29d4ed46edba4b9ff98646fb25774  Data\Audio\speech\US Sports\sad2.wav
e808a9399a4772957199a218eb027052  Data\Audio\speech\US Sports\scared1.wav
1de09a5543c766b4d7ba3608242b4bf9  Data\Audio\speech\US Sports\scared2.wav
3e3b3567cc1af0eace84ece7d4bb3e13  Data\Audio\speech\US Sports\stupid.wav
ab42c21a433a554bbd0b1c140feda6de  Data\Audio\speech\US Sports\takecover.wav
7e2b617359586e9623bf41d4ba9ada80  Data\Audio\speech\US Sports\taunt1.wav
7fb2a72870e44c1b21c92b5fe3ef3b19  Data\Audio\speech\US Sports\traitor.wav
30a486bb488e2e975dffa74575ce97ab  Data\Audio\speech\US Sports\uhoh.wav
71bd9fa1cc5547c6bd7a4528b7a3117e  Data\Audio\speech\US Sports\victory.wav
5447d687cb1e65cdfd87860924906356  Data\Audio\speech\US Sports\watchthis.wav
3fd0c596276371194f6254eb9458d465  Data\Audio\speech\US Sports\whatthe.wav
7d101afe49fd47fbd85ac353abfa2a84  Data\Audio\speech\US Sports\yessir.wav
d2438d00db412d8ce6a9b0e55aa2f557  Data\Audio\speech\US Sports\youllregretthat.wav
a50064c41d42d6871add418834be8bf6  Data\Audio\speech\Viking\amazing.wav
bf09650b3a1473f958122aa868cfd00e  Data\Audio\speech\Viking\angry.wav
ffa6bec2e28ad2293098eecfd0b2b817  Data\Audio\speech\Viking\angry2.wav
f094deec360771c1a58b1877597817f5  Data\Audio\speech\Viking\boring.wav
b26da1553cf64f200a76f88a2297f5fd  Data\Audio\speech\Viking\brilliant.wav
bedd89127b492d3b49e6c89a103bbf74  Data\Audio\speech\Viking\bummer.wav
517e4d5f469253179dcdd7503ddf2e80  Data\Audio\speech\Viking\byebye.wav
8e2726fbbcf83948ecbada00baee09d2  Data\Audio\speech\Viking\collect.wav
822535865d19bcf970c44c9f9f3d17a1  Data\Audio\speech\Viking\comeonthen.wav
fe54145bf9b80675554308f165b7e748  Data\Audio\speech\Viking\coward.wav
322c5f3dd633f8758eee417751d39274  Data\Audio\speech\Viking\dragonpunch.wav
69fc130ae6c2c35240be1ae1e75dffaa  Data\Audio\speech\Viking\drop.wav
ea8a702e126c8909b2fcfdfe9aed4a51  Data\Audio\speech\Viking\excellent.wav
5bd5a9ff79ef929cad30093ca1900ff4  Data\Audio\speech\Viking\fatality.wav
7f0d5aac3cea44f9e755a0d30d722a44  Data\Audio\speech\Viking\fire.wav
9a7ac33acb8e6c7f2203002998e11088  Data\Audio\speech\Viking\fireball.wav
6096a6afc5e65de09dbd7d5efe08fbee  Data\Audio\speech\Viking\firstblood.wav
4c63b88db91811ed55343b1d144bfae8  Data\Audio\speech\Viking\flawless.wav
c89fa24e23acead1af74f1567f4aa0ec  Data\Audio\speech\Viking\goaway.wav
b8ab9a8e93e6e31375aa1acf90aee533  Data\Audio\speech\Viking\grenade.wav
6e82c63be0fd6cfe8b755dce4d3dea46  Data\Audio\speech\Viking\happy2.wav
c34ba9626362b54fe3d0931d3a9a5340  Data\Audio\speech\Viking\happy3.wav
18e0b593665d8b548652047dcbb7659f  Data\Audio\speech\Viking\hello.wav
e83f7921a72a96dc5c203d73e224b4e1  Data\Audio\speech\Viking\hurry.wav
6f9b1ae62100dc58b3a6ee8816865f28  Data\Audio\speech\Viking\idle1.wav
884a87e93b4e4086d95e7c232fd6b8bb  Data\Audio\speech\Viking\idle2.wav
aa10af115f093b4f9bd85239df626277  Data\Audio\speech\Viking\idle4.wav
165ac72bd5510c7f684ef3955210c09e  Data\Audio\speech\Viking\illgetyou.wav
6bc8a1d2e509c6539dcceb47c1fd4e39  Data\Audio\speech\Viking\incoming.wav
01245eae21a625b707073e730b683d4b  Data\Audio\speech\Viking\jump1.wav
870ec27968e6c58a984bbd67e9837097  Data\Audio\speech\Viking\jump2.wav
8843f60f0c33141a17bdf5af48f83cb3  Data\Audio\speech\Viking\justyouwait.wav
ab461ab4bddc84de91e693a719f1f5f1  Data\Audio\speech\Viking\kamikaze.wav
88fb1ebf75cfa5986f536aa4d80030c3  Data\Audio\speech\Viking\laugh.wav
c904acd3449d833e2b9081fe1a64be20  Data\Audio\speech\Viking\leavemealone.wav
0489e07c1b33616432d0877d780b63dc  Data\Audio\speech\Viking\loseloop.wav
c4e521a9a9beefabc2c7ca369260f06e  Data\Audio\speech\Viking\missed.wav
26839447ef3f18e972f6f70946a8db93  Data\Audio\speech\Viking\no.wav
7a0fb83db1e683b20f8f168aa4a92cb4  Data\Audio\speech\Viking\ohdear.wav
49627d91f51bb91a55eabfc41a6aa31d  Data\Audio\speech\Viking\oinutter.wav
ba9d3a041c34ffe29078fa9bbbca140b  Data\Audio\speech\Viking\oof1.wav
d07db88136d7ffd207be362df998ee1e  Data\Audio\speech\Viking\oof2.wav
43dca29e334247acec5fd6a911efbba3  Data\Audio\speech\Viking\oops.wav
aa652b32677bf967080f542ef57ea36b  Data\Audio\speech\Viking\orders.wav
ec22c2c98264b8ad1a24c201569b68a7  Data\Audio\speech\Viking\ouch.wav
cd9183e6f96c36eb62b79b8a1617c000  Data\Audio\speech\Viking\ow1.wav
6e068a9fb451a14aee935ac02b4ebdc2  Data\Audio\speech\Viking\ow2.wav
913658a51355df6407a0f50d5593e23c  Data\Audio\speech\Viking\perfect.wav
831728f302fb468085053e9783e04018  Data\Audio\speech\Viking\pray.wav
43938a2e11b950756efd41e7f6016cd4  Data\Audio\speech\Viking\relief.wav
ad60e4cf3c8ade4f745852a812953fbd  Data\Audio\speech\Viking\revenge.wav
84712bfcf1f4f07a1e0310dd00455fbe  Data\Audio\speech\Viking\runaway.wav
c15cfad6d459cb3440560853d96ee535  Data\Audio\speech\Viking\sad1.wav
d738f03fec21822dccec94ad7a098dee  Data\Audio\speech\Viking\sad2.wav
6c2add368abc72497fc5dd5e7f2d4d25  Data\Audio\speech\Viking\scared1.wav
ecbf272f75b6b3098f402cb26114d3a1  Data\Audio\speech\Viking\scared2.wav
38c10768cd6fd607c4349beaf1197b40  Data\Audio\speech\Viking\stupid.wav
10b31cc33bec60b9341b69e597842dba  Data\Audio\speech\Viking\takecover.wav
b71ca275710145503714f0757a713122  Data\Audio\speech\Viking\taunt1.wav
9fe2403cf58c2b677cb9c410c987f264  Data\Audio\speech\Viking\traitor.wav
79197343d24c6e526d772083a8a4daf3  Data\Audio\speech\Viking\uhoh.wav
73230f74389b0601acdb36036c9fe612  Data\Audio\speech\Viking\victory.wav
5fe1669ab570fc30bad4c7e1ce895953  Data\Audio\speech\Viking\watchthis.wav
ab461ab4bddc84de91e693a719f1f5f1  Data\Audio\speech\Viking\whatthe.wav
ac109607148e422197c4dacfae6157d3  Data\Audio\speech\Viking\yessir.wav
4332ea372e2ac1db3376152ef915af50  Data\Audio\speech\Viking\youllregretthat.wav
56f824071342bf205c2f248bd9719778  Data\Audio\speech\War General\amazing.wav
fcb9cfd08fb79d0d4dd2f9013b917bd4  Data\Audio\speech\War General\angry.wav
d359ed02a2535591d615f97ff65665a6  Data\Audio\speech\War General\angry2.wav
c6f60735cf11c85f37c6dfbbbbd7098e  Data\Audio\speech\War General\boring.wav
815ec63bafb73b47be00fdd4af9651a5  Data\Audio\speech\War General\brilliant.wav
072d1a1c29b6aaf8fd999c9052dff993  Data\Audio\speech\War General\bummer.wav
eab42b659ae4687ebae2e0bb9e01c440  Data\Audio\speech\War General\byebye.wav
85611bfe896acd9891e04a8ad73811c0  Data\Audio\speech\War General\collect.wav
137e40e10d6ac048177ad1ad00298c46  Data\Audio\speech\War General\comeonthen.wav
c4cf807cd5711ca9345ba2e16570fc62  Data\Audio\speech\War General\coward.wav
4aacaab6113d325903bb529b085fdb0c  Data\Audio\speech\War General\dragonpunch.wav
61ec7791eb7bc266e5d5e9868e314f30  Data\Audio\speech\War General\drop.wav
824a8787e7599e1315946435b1f8a7db  Data\Audio\speech\War General\excellent.wav
8e65548a9a74801c6c1717cf6f88e226  Data\Audio\speech\War General\fatality.wav
3a795d2ac1133211adfbda9e105079ec  Data\Audio\speech\War General\fire.wav
1359156ab7f06b33811237d6a21780be  Data\Audio\speech\War General\fireball.wav
9e6636338cd6ae17f1e9952c0954de74  Data\Audio\speech\War General\firstblood.wav
673c1e911806eca4142e1c1f7a09c7bb  Data\Audio\speech\War General\flawless.wav
700030d63767b4849931e38d15cded92  Data\Audio\speech\War General\goaway.wav
61486e834d3d2dc1d7068d3c5284101c  Data\Audio\speech\War General\grenade.wav
38ef66ddf69866d36312a607f39858ba  Data\Audio\speech\War General\happy2.wav
a557e16a4a438f5e5f9684b33c2242ef  Data\Audio\speech\War General\happy3.wav
d7dbc028738962f5059676e23996095f  Data\Audio\speech\War General\hello.wav
51060b9fad44a79964f9aef4042fb974  Data\Audio\speech\War General\hurry.wav
2c99911ba2801419b1c05eabd4cae8af  Data\Audio\speech\War General\idle1.wav
f97e63f4e63ca270cc54b2334766f8bd  Data\Audio\speech\War General\idle2.wav
7755c03aa452e004205bf6354bf72de2  Data\Audio\speech\War General\idle4.wav
a004f79753b0897b0acafd713b3158cb  Data\Audio\speech\War General\illgetyou.wav
2af5a17f5a1705a3c02f64daf32cee72  Data\Audio\speech\War General\incoming.wav
92768299d7e92deb4403b97e9db2501f  Data\Audio\speech\War General\jump1.wav
8c3b67d5314096847f6fbd4f35fa0db2  Data\Audio\speech\War General\jump2.wav
e94428ebbd8825363923d2c4774f50c1  Data\Audio\speech\War General\justyouwait.wav
86026622437ad91795910eabb6e0b80c  Data\Audio\speech\War General\kamikaze.wav
9dcea8349a7e50791fa3d1158bd13c09  Data\Audio\speech\War General\laugh.wav
42b9f77d0d8faddf7952fabd064ecd63  Data\Audio\speech\War General\leavemealone.wav
8e96d62779bda7d023e9e37dee9a7459  Data\Audio\speech\War General\loseloop.wav
0d908b9867dc281df55009dec5824edc  Data\Audio\speech\War General\missed.wav
65d7e0e6afb8a22ce48a3bc35dd3568a  Data\Audio\speech\War General\no.wav
4b0bc7f89df29aed5d3d4f1ec85b3940  Data\Audio\speech\War General\ohdear.wav
1105ff25abce8fe696972c6afe086000  Data\Audio\speech\War General\oinutter.wav
093dd6b30bc8f0bd02a771b635b48b55  Data\Audio\speech\War General\oof1.wav
4298404ce5793459f185d30a4d65fa1a  Data\Audio\speech\War General\oof2.wav
6b2f1b12c0970c3b0f51730ab01986d3  Data\Audio\speech\War General\oops.wav
5d94e6d57a1ff190de3875eeedd2a9bc  Data\Audio\speech\War General\orders.wav
5ee3e8aa730faaba7c76c08ff127b8b6  Data\Audio\speech\War General\ouch.wav
71dfadae62bc3ce659e27e23a7064b1e  Data\Audio\speech\War General\ow1.wav
03c71d4f6740efbc5f62994b929e2e97  Data\Audio\speech\War General\ow2.wav
aad60405717ed3e60c96222d17c062b6  Data\Audio\speech\War General\perfect.wav
65b506f2dc1aaba84b43aa10ca17e58b  Data\Audio\speech\War General\pray.wav
b4396b33dfb7305e7c807aa5c82eff88  Data\Audio\speech\War General\relief.wav
42ca35def73fe4cff9ade9bd996c234a  Data\Audio\speech\War General\revenge.wav
e2a279e647bb8eca23f6e73394635c31  Data\Audio\speech\War General\runaway.wav
078a65016b584d5c581b73faba207bf6  Data\Audio\speech\War General\sad1.wav
a88b5c4c3c4015a64d871eec6de5dd21  Data\Audio\speech\War General\sad2.wav
f1024d713b979cd767274c2fa76f4c0a  Data\Audio\speech\War General\scared1.wav
fd12497a073da8f0bfc2e3b0acb4b9d2  Data\Audio\speech\War General\scared2.wav
a7ea6a23ed2b0375c28d8a377ee454ca  Data\Audio\speech\War General\stupid.wav
8c1045e051075fde55ec12fdcb5aa823  Data\Audio\speech\War General\takecover.wav
60cd8139f2de93058b8736c82c1dcd0d  Data\Audio\speech\War General\taunt1.wav
1b73a45cf42774d84618ebf04f76827c  Data\Audio\speech\War General\traitor.wav
d600e37dd4ecceecd6c378a8a83ca942  Data\Audio\speech\War General\uhoh.wav
bc0ef4e0dfb50b0dc3ad11c3cdee96bc  Data\Audio\speech\War General\victory.wav
79858dd19fd7b4eb8653769594210c0b  Data\Audio\speech\War General\watchthis.wav
21d99f2e7f0b8d87ace28abce1c8f271  Data\Audio\speech\War General\whatthe.wav
dd111e87f7176750bf62b7f250be36a9  Data\Audio\speech\War General\yessir.wav
aa17561d480e4b8490604cd35b3c1032  Data\Audio\speech\War General\youllregretthat.wav
b4e0d25de607edd739b81b2231d327f2  Data\Audio\speech\Welsh\amazing.wav
f67aaf9674dbf075cbf7661decd63e5a  Data\Audio\speech\Welsh\angry.wav
268e17e5a36bb6dbf1ee3d5811389bca  Data\Audio\speech\Welsh\angry2.wav
b6814fe10a3c99bab1e7a0afa13d9080  Data\Audio\speech\Welsh\boring.wav
3dfddf0cd02576e0340c1e4dc811041a  Data\Audio\speech\Welsh\brilliant.wav
073619abd9de5f106407a067158d4459  Data\Audio\speech\Welsh\bummer.wav
d0f12e740ab4f9e25d711de541ad6606  Data\Audio\speech\Welsh\byebye.wav
032e4b6265d13a69523e6d13635a5aac  Data\Audio\speech\Welsh\collect.wav
2a8d6149aaf0947470082fc0ad25ce8c  Data\Audio\speech\Welsh\comeonthen.wav
f8e9f3e1d88ddb2a0b1123a75087abe2  Data\Audio\speech\Welsh\coward.wav
bb53bae872b5dba4151684558b1b962e  Data\Audio\speech\Welsh\dragonpunch.wav
2c7accd938fc667dd2484d3a1c2d85ae  Data\Audio\speech\Welsh\drop.wav
97dc6871d2894d2aea2d0796003059fa  Data\Audio\speech\Welsh\excellent.wav
7a85758f44e667e2c84ec974d0ada2c5  Data\Audio\speech\Welsh\fatality.wav
26b1a0beaea048e90d9a7365aeb0bb67  Data\Audio\speech\Welsh\fire.wav
25e5bcf023f2b7678916f717c417eba1  Data\Audio\speech\Welsh\fireball.wav
32bbeb7d6e3f657ab53bf46b8262a4ef  Data\Audio\speech\Welsh\firstblood.wav
43336750de19f84afeff99dc43a75e15  Data\Audio\speech\Welsh\flawless.wav
ee015f4448fb1cec44a2885e1ddddcb0  Data\Audio\speech\Welsh\goaway.wav
a31f3e84649cb99acacbc009e8995793  Data\Audio\speech\Welsh\grenade.wav
c94ed54a71161f4634bbdbd6f289b5c5  Data\Audio\speech\Welsh\happy2.wav
d4e2ea04d13049fa328b18c7a65f62d9  Data\Audio\speech\Welsh\happy3.wav
10e92bd907b4b600c51cb6ffed73ea1e  Data\Audio\speech\Welsh\hello.wav
8c61d15430c053ba3465dd277b6b24b4  Data\Audio\speech\Welsh\hurry.wav
ed8e6c2d3b515b82200a6ccd7bb726fd  Data\Audio\speech\Welsh\idle1.wav
c05156e5e604b4cb8d140c1b1f178ce4  Data\Audio\speech\Welsh\idle2.wav
5c2ba5bd06d52a13a0b7efbf89176110  Data\Audio\speech\Welsh\idle4.wav
a047a4bac9a7ba7fe5cba3716b569081  Data\Audio\speech\Welsh\illgetyou.wav
ccfa5d3c7da4b01e2b15ba80a55c1a3d  Data\Audio\speech\Welsh\incoming.wav
c0aaac25624ddec3fb97a20a7b29421d  Data\Audio\speech\Welsh\jump1.wav
defdc80fe421c8dd914816584608f91f  Data\Audio\speech\Welsh\jump2.wav
51de5b3761f227744943cb94d760ef07  Data\Audio\speech\Welsh\justyouwait.wav
a8dd87dfcd9aa0381e66c99eb8386cd1  Data\Audio\speech\Welsh\kamikaze.wav
78a37e268b72ccc1e89a81c9ad999901  Data\Audio\speech\Welsh\laugh.wav
5648dbebabfda99bdc68fbeb08537e96  Data\Audio\speech\Welsh\leavemealone.wav
fb7bec53e98a7e2c55953a1834725258  Data\Audio\speech\Welsh\loseloop.wav
d2c5d239c1f7665054c53146b17304f6  Data\Audio\speech\Welsh\missed.wav
5ea33a56c41ebdbba1e1e8068806f5f5  Data\Audio\speech\Welsh\no.wav
38faf625c6ed0dc4c5f9d03b232b385f  Data\Audio\speech\Welsh\ohdear.wav
f1b5e81716f822740646eb1b41270e3e  Data\Audio\speech\Welsh\oinutter.wav
1f6b71b7f87775e6bce545ed90b1ee0e  Data\Audio\speech\Welsh\oof1.wav
bb79189df749ba4a23434ffa089474db  Data\Audio\speech\Welsh\oof2.wav
cada1ca7906b0b2cf4075e25eb7db3c4  Data\Audio\speech\Welsh\oops.wav
9fd69121db40d6bf1d358c3c300b92da  Data\Audio\speech\Welsh\orders.wav
809a44fddb0a47ef0bc0c09db1125f89  Data\Audio\speech\Welsh\ouch.wav
31c4b0d45b12455a9f0020343e901a5c  Data\Audio\speech\Welsh\ow1.wav
4d4a99452fcf8e6b1e34e52599008e80  Data\Audio\speech\Welsh\ow2.wav
40d4c3744b5ed8b51ba9ed83cad23a78  Data\Audio\speech\Welsh\perfect.wav
a23876d972be2919f37bb002638b02ca  Data\Audio\speech\Welsh\pray.wav
75da74b69d645479f990aadab02a6f80  Data\Audio\speech\Welsh\relief.wav
6c790f5a38a488a9657595197b8477c7  Data\Audio\speech\Welsh\revenge.wav
05ab26c9a982fef51e00d882d2e029ae  Data\Audio\speech\Welsh\runaway.wav
299c30adfd49a0af03fda123a6ec4242  Data\Audio\speech\Welsh\sad1.wav
ece9311cb4d098a67c440ee5b5eeaa88  Data\Audio\speech\Welsh\sad2.wav
a02eefaa1762d57afc94cbf50a58317d  Data\Audio\speech\Welsh\scared1.wav
6e563d271cc86fecdbd2080eb5396f7e  Data\Audio\speech\Welsh\scared2.wav
7516e8f7cb131462a513f69ee482cd4f  Data\Audio\speech\Welsh\stupid.wav
a89cf10cdaa902a6705c71d5f20490fa  Data\Audio\speech\Welsh\takecover.wav
05ed7a90cc1c3766f7a7600e08df6d5d  Data\Audio\speech\Welsh\taunt1.wav
82ac3805a37a9513564142581212ab61  Data\Audio\speech\Welsh\traitor.wav
13519b9b6cedc376a7e98b287c3687d5  Data\Audio\speech\Welsh\uhoh.wav
601bb7ed3e7a0cfdabcbbae80264a101  Data\Audio\speech\Welsh\victory.wav
d2b1e0886bfd745ca054267e7dc14c53  Data\Audio\speech\Welsh\watchthis.wav
1335cec1ff6fccada03977ce0290b153  Data\Audio\speech\Welsh\whatthe.wav
bc4eaf1366646edac390d6a0c3fcd351  Data\Audio\speech\Welsh\yessir.wav
b4ff0bc0370224370b5bda8903b15c8a  Data\Audio\speech\Welsh\youllregretthat.wav
eba6e1bb869974517b36462fa411ec2f  Data\Audio\speech\Whoopsie\amazing.wav
a786ccfb02bb8c1ac1053505a696da66  Data\Audio\speech\Whoopsie\angry.wav
94f2ecf84c411eccfa298d05481fd1ac  Data\Audio\speech\Whoopsie\angry2.wav
bfe1ad09d6401d3840aba619568ee48e  Data\Audio\speech\Whoopsie\boring.wav
dbb44de302852bd88d0d35c4bdbcaaba  Data\Audio\speech\Whoopsie\brilliant.wav
ec8d41d331c8988278b14e9f886c2da3  Data\Audio\speech\Whoopsie\bummer.wav
e3328d8077807685dc60a36ad1e31e5b  Data\Audio\speech\Whoopsie\byebye.wav
b192642ca1718a9d424d5705673ab196  Data\Audio\speech\Whoopsie\collect.wav
08d8bcd7c3ae43e875f54fc28b05d2dd  Data\Audio\speech\Whoopsie\comeonthen.wav
8376f82f851cdded5215a00588fdf019  Data\Audio\speech\Whoopsie\coward.wav
903fd198543c2c6bde003b6daad0316f  Data\Audio\speech\Whoopsie\dragonpunch.wav
d1992045e7a1eda9bec37c5fcdb9ebf2  Data\Audio\speech\Whoopsie\drop.wav
56064ce260f95cadda956f780c6c2e73  Data\Audio\speech\Whoopsie\excellent.wav
256d612a376f3778d72ed7784414865f  Data\Audio\speech\Whoopsie\fatality.wav
5f4e83914da799edb7ea48ce6879c2a0  Data\Audio\speech\Whoopsie\fire.wav
2f9ed716125e3540cc4dd0fbf96876c1  Data\Audio\speech\Whoopsie\fireball.wav
5b482e4baec7d98f95a7f3a0f41af63e  Data\Audio\speech\Whoopsie\firstblood.wav
5339f2c9588ed03806c686fda2eca99b  Data\Audio\speech\Whoopsie\flawless.wav
206d27616f092e57bcf546d7b5c7204d  Data\Audio\speech\Whoopsie\goaway.wav
59f20d4ed0a0d66e8087a8d2513b8492  Data\Audio\speech\Whoopsie\grenade.wav
a0ed2f0ffdeb11dcf3aabd39dd52a831  Data\Audio\speech\Whoopsie\happy2.wav
0eaea758b00051a1cb6d61f96aa875d3  Data\Audio\speech\Whoopsie\happy3.wav
0c5215dc21e027e5772cdd13659589f7  Data\Audio\speech\Whoopsie\hello.wav
6516b051f5b7e602d5de6d7069a715b2  Data\Audio\speech\Whoopsie\hurry.wav
97b605bec642dc32b98a3797851998c7  Data\Audio\speech\Whoopsie\idle1.wav
25257725f822caae8f19a576eafb80b4  Data\Audio\speech\Whoopsie\idle2.wav
51ee41201a1e8c459a05505dcb54850e  Data\Audio\speech\Whoopsie\idle4.wav
891bdcd5c00c6570de65e16fdced307c  Data\Audio\speech\Whoopsie\illgetyou.wav
d8033d0f209db9d9bdbdef4ab599ae4c  Data\Audio\speech\Whoopsie\incoming.wav
72de6efd7c9bd5a30a7dd72a6f778c7a  Data\Audio\speech\Whoopsie\jump1.wav
664a90d95dbe81df798ce7b7297cd4f0  Data\Audio\speech\Whoopsie\jump2.wav
5dba589306f67cf72310b993d535cd92  Data\Audio\speech\Whoopsie\justyouwait.wav
246c80b7ded936cfa73212e2e6cf690d  Data\Audio\speech\Whoopsie\kamikaze.wav
80ee0941d6afe248fa9bb547724375b9  Data\Audio\speech\Whoopsie\laugh.wav
29d8c5da5827b0e752738db569f9c975  Data\Audio\speech\Whoopsie\leavemealone.wav
384163af9016b98a0348c79c1272ee33  Data\Audio\speech\Whoopsie\loseloop.wav
7b81ef43e9fbe53490a3175ffaf31ae0  Data\Audio\speech\Whoopsie\missed.wav
72de732a3214859bc56bb5d19c2c5e4e  Data\Audio\speech\Whoopsie\no.wav
30866366c9a268eb476c256bca363cab  Data\Audio\speech\Whoopsie\ohdear.wav
17d44726244b5e91d3083925004729f4  Data\Audio\speech\Whoopsie\oinutter.wav
f57e42c472e9e218646874c5d922e999  Data\Audio\speech\Whoopsie\oof1.wav
1df74e4551d656989079eb6cf61366c7  Data\Audio\speech\Whoopsie\oof2.wav
68e6f922a97eb5036064fa384be591a5  Data\Audio\speech\Whoopsie\oops.wav
6d98bc3b248057f4aedcc543326fdd9a  Data\Audio\speech\Whoopsie\orders.wav
1fcf443a08fc7e7f5fb13f74d80f20b8  Data\Audio\speech\Whoopsie\ouch.wav
ea68cb8234dc066496a931c097316dee  Data\Audio\speech\Whoopsie\ow1.wav
68c90784112c91713eab3f2425c6b5e5  Data\Audio\speech\Whoopsie\ow2.wav
547ce43276bd478c6cf13d9492f54511  Data\Audio\speech\Whoopsie\perfect.wav
d483600ccb63aa98be099345821c71e4  Data\Audio\speech\Whoopsie\pray.wav
79c1da13b3cbf67a61ed6da689275a65  Data\Audio\speech\Whoopsie\relief.wav
01a65274ca22c6ee92a26d3db0536231  Data\Audio\speech\Whoopsie\revenge.wav
45f5d845df0a2fc9977cdd9db900a916  Data\Audio\speech\Whoopsie\runaway.wav
b076739a33b90379e9dac728efa154ff  Data\Audio\speech\Whoopsie\sad1.wav
3c9b54bb2d8b5f1a1ac215b4cfcdea62  Data\Audio\speech\Whoopsie\sad2.wav
cf006f8ca4a38632e311d970e2f15b54  Data\Audio\speech\Whoopsie\scared1.wav
a0b81b45426be60931df2f58a25ec95d  Data\Audio\speech\Whoopsie\scared2.wav
13b55121bad399b5a84b8564f1bcae94  Data\Audio\speech\Whoopsie\stupid.wav
58f741bb2f2db2237c85b3ab9f2879e4  Data\Audio\speech\Whoopsie\takecover.wav
b01b5cb23997b65ff3ba81580af5b9a9  Data\Audio\speech\Whoopsie\taunt1.wav
5627c7d26265809aa8b47eb05cdee8a6  Data\Audio\speech\Whoopsie\traitor.wav
58d1d3aa3a206fc9a4dca2cce40802e7  Data\Audio\speech\Whoopsie\uhoh.wav
ad31ab1a6ee77d78858d94b792085798  Data\Audio\speech\Whoopsie\victory.wav
31058ff00f985cff65459013d25b459f  Data\Audio\speech\Whoopsie\watchthis.wav
3b37d0853a6d033ca8e0d85fdfe3e21a  Data\Audio\speech\Whoopsie\whatthe.wav
71691414ecf92cae1eb1449358c49ff5  Data\Audio\speech\Whoopsie\yessir.wav
cc81f53f8fe2441906c00f7e0c9bc114  Data\Audio\speech\Whoopsie\youllregretthat.wav
cca27099c93922eb4e7308721ba20a47  Data\Audio\strmsfx\Astronut.wav
1afbc00a03206be253d0d7231ef715be  Data\Audio\strmsfx\BellRinging.wav
c0f5bfa0c2085325d01a4ffb1e80cb37  Data\Audio\strmsfx\brows.wav
eec93ed0dc5f43b1a3dd6ff4dd89f65a  Data\Audio\strmsfx\bumblebee.wav
617a69bf35f3e4103755bca4b2f3c74b  Data\Audio\strmsfx\CampFire.wav
47ee14c232e55238d738e075921a143f  Data\Audio\strmsfx\Chicken1.wav
c2cc7e1d8453c3befd12b7070d6978cd  Data\Audio\strmsfx\Chicken2.wav
76bc90e068f85920b244dc9459bcdb12  Data\Audio\strmsfx\ChurchBell.wav
e326118f4939202c68c2f73cf5e8c5d4  Data\Audio\strmsfx\Cow.wav
7ed1c76778ae4b5846c605da9b5953e6  Data\Audio\strmsfx\CreakingTree.wav
e5855a41dca92aebc67600d8d70c86d8  Data\Audio\strmsfx\CrkTree2.wav
2b54bbe76355c9dc9968c5d6719c0608  Data\Audio\strmsfx\depthcharge.wav
b0b89737b99ec12b5bc65d8dd1aafdc4  Data\Audio\strmsfx\EarthquakeRelease.wav
1327bbf9a820785ffb4e09764d2eecbe  Data\Audio\strmsfx\Elctrcty.wav
c5b82525ddcb5f86c9412cd786089e7b  Data\Audio\strmsfx\FireWorksExplosion.wav
aba5a74a34400d5199a8dce1da850b02  Data\Audio\strmsfx\FireWorksLaunch.wav
3e2bc7c9e8f6cb5842cc23b2a323f0d8  Data\Audio\strmsfx\flap.wav
0fd158614cf2b711915b3e99d794a4db  Data\Audio\strmsfx\FlyingSaucer.wav
e49765e75b58ced8ef81b55f190bb2bc  Data\Audio\strmsfx\Fox.wav
1136bf78a3b32a1bab59ff9c7111551d  Data\Audio\strmsfx\Fuse.wav
e3de647af3b59bf521fcde4b44c1a309  Data\Audio\strmsfx\FutzRadi.wav
4f53c05991309f390e38bfe36325195f  Data\Audio\strmsfx\Geysir.wav
c5d04781bf67101a5467498d4e3e202d  Data\Audio\strmsfx\GiantChicken.wav
1347299e9cbefb50c19f3ed6968ddbae  Data\Audio\strmsfx\Goat.wav
b4b6482af58d71ad67a59ea2be5db79e  Data\Audio\strmsfx\grasshopper.wav
63f273cdfb0db3d50e74ba28612dbdad  Data\Audio\strmsfx\headers.wav
60d0bdb2b21d419e29723620c87bf608  Data\Audio\strmsfx\headscratch.wav
09d269908cfba68159cf25c84269457a  Data\Audio\strmsfx\HoldEarthquake.wav
952ec4ac49b4c08ba0f94ea0d6fa1991  Data\Audio\strmsfx\Horse.wav
e8cff2048e92ef4ebe62f59bf21b1434  Data\Audio\strmsfx\HoseIntoWater.wav
c0ba4aca8762ffd55f5c91c7ed9aa1f6  Data\Audio\strmsfx\HourGlass.wav
e9c429efa597e997924d0a5e5e8dd932  Data\Audio\strmsfx\m60loop.wav
335aaa0567d7596862da6faaf866bbb8  Data\Audio\strmsfx\MetCrk1.wav
6e1f0f11faebac07fa1df1520564fcba  Data\Audio\strmsfx\MetCrk2.wav
c914621fd2c9b9ebe33700d6aeef9da3  Data\Audio\strmsfx\Monkey.wav
d6de18f7b00c893be77e5689d47592c0  Data\Audio\strmsfx\Mummy.wav
498960d67255ee7eb3502ffd5370e8e5  Data\Audio\strmsfx\nips.wav
a7d3e20dd543c7c77e8ccd265f75f3eb  Data\Audio\strmsfx\NukeExplosion.wav
41d81080d411af193fcf01773b5c9f4b  Data\Audio\strmsfx\OldRobot.wav
361c7a0f489bbf4e8b7773dd8f957e37  Data\Audio\strmsfx\Parachute.wav
89645213fd01827daa73ce7c3547712f  Data\Audio\strmsfx\periscope.wav
93e5713b10448d87ee2dad5aa6b890d3  Data\Audio\strmsfx\RatSqueaks.wav
e69d5c246c9bb6d76b4861b5433739d6  Data\Audio\strmsfx\RedBullEffect.wav
9ccbdda19a2e8eb503ac75664ef4717d  Data\Audio\strmsfx\RustlingLeaves.wav
bbabed5c382331fc40a563d623faf3f9  Data\Audio\strmsfx\sceneflash.wav
45dbcb96e79654748b36e00e937cbcc1  Data\Audio\strmsfx\Sheep.wav
a65a0a5bdff73f067f1e00ff74b10565  Data\Audio\strmsfx\Spider.wav
44b0534cf21696500902bc7bd69acb22  Data\Audio\strmsfx\TapIntoWater.wav
055f0e60c913b17df78b34f01b4f7850  Data\Audio\strmsfx\tash.wav
d851b9e6f7b8dec2fb2411a668cd4f2a  Data\Audio\strmsfx\Tentacles.wav
5c4cd26043a9c22a980d59151bd19717  Data\Audio\strmsfx\thunder.wav
378c9e653d0c063fce38163f17a737db  Data\Audio\strmsfx\Tractor.wav
745008f30a2cd1b16d246a84048453d2  Data\Audio\strmsfx\WaterMill.wav
d1200cf4b38108a963e60196551f781d  Data\Audio\strmsfx\windloop.wav
bad1afb77ffb97d22193be560e2a1059  Data\Audio\strmsfx\windmill.wav
060a2e69dadbf2600a51913dad8f3f15  Data\Audio\strmsfx\WooWooBeam.wav
23c3d4d3911df6cf518c2ba4d347cf7d  Data\Audio\strmsfx\wriggle.wav
616a1823c357cf87d34abc91a6da66ff  Data\Bundles\Bundle00.xom
ce6a9b10f8765130455f1890d992435b  Data\Bundles\Bundle01.xom
bbf302ffc3cefa545eac97fb2fdb86e8  Data\Bundles\Bundle02.xom
bbf302ffc3cefa545eac97fb2fdb86e8  Data\Bundles\Bundle03.xom
4f39414bb3d100e24c314b238f7dad27  Data\Bundles\Bundle04.xom
c60329d2bf06d7ecac503690ab37ad98  Data\Bundles\Bundle05.xom
bbf302ffc3cefa545eac97fb2fdb86e8  Data\Bundles\Bundle06.xom
642dac8f54350abb7c5396cfcb7bdc60  Data\Bundles\Bundle07.xom
54203e13464992eaf66586191e1e353e  Data\Bundles\Bundle08.xom
82f7e597ff4fef0217b8ca7e295715a2  Data\Bundles\Bundle09.xom
b03262b439fa2cdf8a09afeb908a40fd  Data\Bundles\Bundle10.xom
37989b7655efa0b1f2d4336378985bd5  Data\Bundles\Bundle11.xom
0829dde9aa60732bbc17709cb951515f  Data\Bundles\Bundle12.xom
9a17a04f7187c784001f6f1ec1e47096  Data\Bundles\Bundle13.xom
76a6a21c181d87bfdaab5dd93ceb5c5d  Data\Bundles\Bundle14.xom
6815bdb1cd771037b93ed8dc4b63f088  Data\Bundles\Bundle15.xom
ad9e7acb22ff6cf8016d6bccbd018875  Data\Bundles\Bundle16.xom
ce3b8f57dec9befb1182f730ea14285c  Data\Bundles\Bundle17.xom
ad35e3cb400ee33c817f55aed199b14c  Data\Bundles\Bundle18.xom
9d1cb0aa991e63a54445b981fa84f1d9  Data\Bundles\Bundle19.xom
6f02c3fbae2166b354626297c5d5cf73  Data\Bundles\Bundle20.xom
395a20d048303548328c0b3f2d5768d1  Data\Bundles\Bundle21.xom
974584062ab00d8dc5bc12158fc3ef6e  Data\Bundles\Bundle22.xom
7bd42e5b5898c85d15e07f64d21e9edb  Data\Bundles\Bundle23.xom
86a8f4e7ffbc2d7874ba459bb9de1477  Data\Bundles\Bundle24.xom
2dafa3f480a3084fe40920ff52a9d429  Data\Bundles\Bundle25.xom
d065d98c325467f08a75ee118968b260  Data\Bundles\Bundle26.xom
f5641770b738aadd0b82fa66c17d4b34  Data\Bundles\Bundle27.xom
45eb961c0bb11ca579ac2b85a431a309  Data\Bundles\Bundle28.xom
e185ced25748eac8101213fca12033dc  Data\Bundles\Bundle29.xom
b1efaa9acb2aef171d59e299f56c43e4  Data\Bundles\Bundle30.xom
8cf86c76581686ef9d3a5fa6f3569dba  Data\Bundles\Bundle31.xom
bf199bc5071047e2484fc02e1e70ca17  Data\Bundles\Bundle32.xom
862427a8ea2aaca935a899e447495ae2  Data\Bundles\Bundle33.xom
369a77ea98f6c93c5e1b2e9f889cb807  Data\Bundles\Bundle34.xom
e3b586fd5353082154b07d5d5be44808  Data\Bundles\Bundle35.xom
d5c2382acf250c38c292711fb18046a2  Data\Bundles\Bundle36.xom
a8d2192603fdabb66e10c0461daf5463  Data\Bundles\Bundle37.xom
b1cad4d3775fc31ec3ef96dc9e63b21b  Data\Bundles\Bundle38.xom
870902bdf06322c21964f7cf7d4f2c07  Data\Bundles\Bundle39.xom
dc943523e023888be783003f5f5cb9d4  Data\Bundles\Bundle40.xom
f19c39315098455df33b742bfdeac5d8  Data\Bundles\Bundle41.xom
adc9bd0f5ef760642b0e661f0a645ed2  Data\Bundles\Bundle42.xom
5bd5e6a07f4d3da4eaee6d512e16f958  Data\Bundles\Bundle43.xom
a0c2543d24049db1d50b4217d2c516b1  Data\Bundles\Bundle44.xom
b74cd822aed7a8abc4c938a33cb684ef  Data\Bundles\Bundle45.xom
a0b130968c442b4e6687532cfcc4397f  Data\Bundles\Bundle46.xom
8e2c04f089bf421eb41fbba457712149  Data\Bundles\Bundle47.xom
24ab08f7a92f71be38a548c637633c6f  Data\Bundles\Bundle48.xom
f6e1898e7bf2e08a4307e929a020e42d  Data\Bundles\Bundle49.xom
709d8a81c5bd1c72e5368370a4daf79f  Data\Bundles\Bundle50.xom
170b6b361d5af387b8c4033e732a4551  Data\Bundles\Bundle51.xom
3c64ab608d55a18834d8fc0172fe7f2c  Data\Bundles\Bundle52.xom
2cccf5b3bd9c3aed9efa582c0c3f230d  Data\Bundles\Bundle53.xom
5f35318af24abaab31bf930989480744  Data\Bundles\Bundle54.xom
5f7b3a98ecf55f3ebd3ab1c36227e65d  Data\Bundles\Bundle55.xom
0149d747626d1f3e4449234ba826e08e  Data\Bundles\Bundle56.xom
acf48a0d7e7d86ae8ede295801dfc168  Data\Bundles\Bundle57.xom
f441014ff91d8eab95a0e6086de5f185  Data\Bundles\Bundle58.xom
3c59660c2169c1e2ef66a749375e4257  Data\Bundles\Bundle59.xom
334a75d32e4e0ee22549e538fc17eb85  Data\Bundles\Bundle60.xom
d4c476e73579d3c7eca6408d5cfe0034  Data\Bundles\Bundle61.xom
f34a0035a1e6b66353ba891c94c249ee  Data\Bundles\Bundle62.xom
34a79d3046c7c7ce02494757e17095f0  Data\Bundles\Bundle63.xom
ba0136fa02310d8923bab1f8646b1df0  Data\Bundles\Bundle64.xom
c54661988f2c72e0033f8f78c59e88ea  Data\Bundles\Bundle65.xom
2c35ec397cfc8499cd3efa31428b6ee7  Data\Bundles\Bundle66.xom
e5b59d0b747c8346bc4f9bb273cdbcf9  Data\Bundles\Bundle67.xom
f8ef2a2b9d8e321b7ca6904e48536d5a  Data\Bundles\Bundle68.xom
002b1929864a6f3b68374dc95f156931  Data\Bundles\Bundle69.xom
8c9a8863cbe62bb6b40942a6298a32fa  Data\Bundles\Bundle70.xom
9ca0478fb3d0de5f9837083e94ec9bed  Data\Bundles\Bundle71.xom
23bd3d8f6aeb8a450c28a760793759b3  Data\Bundles\Bundle72.xom
3a84623c94bc6749e9bed5d911b9da3f  Data\Bundles\Bundle73.xom
455ae2c53e3fe18fa63bcebe48677804  Data\Bundles\Bundle74.xom
bbf302ffc3cefa545eac97fb2fdb86e8  Data\Bundles\Bundle75.xom
ccebf2ac23531caf52949af353264205  Data\Bundles\Bundle76.xom
6a41bd344984eccc9ed9bfbd07ccb28a  Data\Bundles\Bundle77.xom
43fe4be454599ae57a2c1940adcfdb12  Data\Bundles\Bundle78.xom
e78ed64ad2d05ef96ea9e915050bbde9  Data\Bundles\Bundle79.xom
f5a23cb7930fc1b0e33b48df30eac534  Data\Bundles\Bundle80.xom
de1def3a7a1175fe187f272df0228519  Data\Bundles\Bundle81.xom
ea337b9c8504be7d386af269ba857d61  Data\Bundles\Bundle82.xom
a922630f89fbebb43c624ec9e23b88d7  Data\Bundles\Bundle83.xom
01f46624b1cd768de242a303cde32961  Data\Bundles\Bundle84.xom
db11e726dda4173087f8da7d0b563fda  Data\Bundles\Bundle85.xom
497b2a8e96d5bcf4e623cfbdb3ca880f  Data\Bundles\Bundle86.xom
0ebeb97c5b40aa375a1b8cb928804f39  Data\Bundles\Bundle87.xom
ba4b44c2d2b7faf0225afde7bc87d435  Data\Bundles\Bundle88.xom
22d8c5751f41cfdd8af2e5d2107ae2d0  Data\FMV\collectionBronze.mpg
f0f5770af0d0421850b339d66edb3215  Data\FMV\collectionGold.mpg
a05a029d87a8571270fcedae5c3bb798  Data\FMV\collectionSilver.mpg
f79c34d4f8fdd5fd08553a7a171e8a76  Data\FMV\DeathMatchDefeat.mpg
aa4bde3ad7aee34722d7870677a2f165  Data\FMV\DeathMatchDraw.mpg
f276c3f1f9b97eba1a8e77c19b0902ab  Data\FMV\DeathMatchVictory.mpg
fbb30c65939399c41e5772561d233140  Data\FMV\destructionBronze.mpg
a4de889b57abc37770006ef791dddace  Data\FMV\destructionGold.mpg
5129c0544321413973fc217a7d81f4be  Data\FMV\destructionSilver.mpg
cef45532606225df599b6ee34973e4b0  Data\FMV\End.mpg
be7525322f2ba8dfcb44b483f531e7dd  Data\FMV\experiment.mpg
518cdf032e8c30461e68a6d19ad48938  Data\FMV\KillBronze.mpg
d8934d128ca7d75a9a6716269822d4ed  Data\FMV\KillGold.mpg
49cad16e4005b5b37d16239500f4714f  Data\FMV\KillSilver.mpg
25a4f52f7bee3ad496467c763001b142  Data\FMV\MissFailed.mpg
386813cb60042d7abcfd556c169cee74  Data\FMV\MulletBronze.mpg
67200fbd80f2a2b7e1b1aa9d980c1e93  Data\FMV\MulletGold.mpg
dfb35ccaf36d10dd75b56a1078b5ac8b  Data\FMV\MulletSilver.mpg
7d68141705f30d15896dd743cc37c107  Data\FMV\positionBronze.mpg
dd78c9f73d1b5031fe024df676aa70f7  Data\FMV\PositionGold.mpg
6eeee0ff868e4a29a23ab42ae4b644b7  Data\FMV\positionSilver.mpg
ae1ba38d22b56db8f1acbf9dd7e40d7d  Data\FMV\sega.mpg
aeb05b7c371ed435ac8294746d49c057  Data\FMV\SurvivalBronze.mpg
2892cd7c3cb67a608a1c970b6e2a4f68  Data\FMV\survivalSilver.mpg
3c1338a19804e56fae6d952b77aa54c1  Data\FMV\survivorGold.mpg
2d8d7c0734f488ab175b30c6defe5585  Data\FMV\T17Logo.mpg
ce3d9ab1f0200fc2cecfef7cd86e0b0d  Data\FMV\unlock01.mpg
b8592b189e6ed92b5942dd315170559b  Data\FMV\unlock01short.mpg
b6934b7c9ef2ae7a647b67c6d9b636b2  Data\FMV\Unlock02.mpg
82d11303d6bce4a194aa4a6bfe1e02b2  Data\FMV\unlock02short.mpg
1b054d8efc51d8378cd8a01d95d63970  Data\FMV\unlock03.mpg
855aca2ae071e776a16f7f89dbf66a90  Data\FMV\unlock03short.mpg
0b1e273d1682e4dad045270a8c535d58  Data\FMV\unlock04short.mpg
3177d55c57c690f4b194e32912342a62  Data\FMV\unlock05short.mpg
c7282fed3c1a6f0f913092e3d985b75c  Data\FMV\unlocked4.mpg
14cdf86d0f4e5a7f59b7358082ef4783  Data\FMV\unlocked5.mpg
1835521bde251ae8d78bc8bc7157fddb  Data\Frontend\Levels\Challenge_JP1.tga
1044441bb17fe4a99fe51cd500e9b8b0  Data\Frontend\Levels\Challenge_JP3.tga
d48fc0b42431789b60b9831e3bfeed51  Data\Frontend\Levels\Challenge_SG3.tga
df9fd60b682d0550578ee05175a21294  Data\Frontend\Levels\Challenge_SS3.tga
fe6c1e4e02dd08115ef8b16ebf0c4fd3  Data\Frontend\Levels\Level_PNMI.tga
9ac69e3fec14e23b035a74bd70c4bb3e  Data\Frontend\Levels\Mission_ACI.tga
fdf8dcceba1f7281884ec39366215343  Data\Frontend\Levels\Mission_ACU.tga
923ca9daf55d0336eb83a9bab34de186  Data\Frontend\Levels\Mission_AJS.tga
a99c20d5f282939bf67952826b7bbe52  Data\Frontend\Levels\Mission_AQF.tga
22c3225a5486f4ba999f39dd60871725  Data\Frontend\Levels\Mission_Balloon.tga
d30781adb39a224de897e10ce829b412  Data\Frontend\Levels\Mission_BB.tga
0d34ddecdb5c7d7f8c153ff2b3b0c538  Data\Frontend\Levels\Mission_BBB.tga
56fa47d80f76b98db4fa9b33e6f60e98  Data\Frontend\Levels\Mission_Beanstalk.tga
0d34ddecdb5c7d7f8c153ff2b3b0c538  Data\Frontend\Levels\Mission_Breakfast.tga
dbb16638d4f0aa8a0c9e16a6ddffb2bd  Data\Frontend\Levels\Mission_CB.tga
ff7e5d65e80169130060b11faa073154  Data\Frontend\Levels\Mission_CC.tga
8a63e6130181cef29246e5d5ab25f900  Data\Frontend\Levels\Mission_CDD.tga
3dd66558e8e385ee6a64dfd4f9547ec7  Data\Frontend\Levels\Mission_DD.tga
ac5bddc5dac853403d537276f9ad8074  Data\Frontend\Levels\Mission_EYC.tga
b71439e6f3b5dd91d3685450351d8010  Data\Frontend\Levels\Mission_FFY.tga
9b843f94146a4f89c78a0bb159365c62  Data\Frontend\Levels\Mission_GD.tga
5f87c799bc51d9e10395b7e941289edd  Data\Frontend\Levels\Mission_GNS.tga
ee1a0fc260e8139b7f6213dc2ae16269  Data\Frontend\Levels\Mission_HelterSkelter.tga
bfb2b3c55f6d695ef0731dd7694a657e  Data\Frontend\Levels\Mission_HLS.tga
3ebe511e246ed3736eef43ee58907d86  Data\Frontend\Levels\Mission_HP.tga
f0a28c274053f9b2cd9b5a0187198ceb  Data\Frontend\Levels\Mission_HS.tga
20fc888dd00448d85382dd42fc871837  Data\Frontend\Levels\Mission_HUR.tga
4711d5c8c6c4b3faf448b948be88f9e6  Data\Frontend\Levels\Mission_Ice.tga
c0f2b66228e6059b5e9cb17b506627e2  Data\Frontend\Levels\Mission_ISNCHYC.tga
ba55bc953ebf05c40c12afc683925eae  Data\Frontend\Levels\Mission_LVP.tga
6480e7462baa452501a7fb192b382f35  Data\Frontend\Levels\Mission_MM.tga
8a91c9ef77729d47b6f41dbc94bc15bc  Data\Frontend\Levels\Mission_NRFF.tga
8c9cfbdcde2e02f3208f2135b484e88a  Data\Frontend\Levels\Mission_OSS.tga
310809a47afbfc5243b5d4694dc3edc4  Data\Frontend\Levels\Mission_PH.tga
3a09bd9f7b602aef20f83fc2514ac0c4  Data\Frontend\Levels\Mission_RD.tga
fac0defd61cdb68e3bfe3e70826fb31a  Data\Frontend\Levels\Mission_RR.tga
512aee17a2f4d81cce478d05a800353e  Data\Frontend\Levels\Mission_Schools.tga
512aee17a2f4d81cce478d05a800353e  Data\Frontend\Levels\Mission_SFS.tga
1fe2d3d3cf3003aa18786b277c327467  Data\Frontend\Levels\Mission_SMT.tga
7761bc2c7c9ff554fa328b2ec5dafe7c  Data\Frontend\Levels\Mission_SOCR.tga
60791f64232c74f562598a16257059c9  Data\Frontend\Levels\Mission_TBG.tga
a616690cef93ff646f81ccd1e9ada579  Data\Frontend\Levels\Mission_TC.tga
82b624fd8cc006928c97dae08690c36b  Data\Frontend\Levels\Mission_TD.tga
a455a7398719ad281d9426eea5e3b5d3  Data\Frontend\Levels\Mission_TMC.tga
cfd98259ce255819c258844058720fae  Data\Frontend\Levels\Mission_TreeVillage.tga
308c089a68d4f47be59dcbe940567a9d  Data\Frontend\Levels\Mission_WAC.tga
22f7d41d8dfdbc4d47f4d59cb434d708  Data\Frontend\Levels\Tutorial_ATF.tga
5072236d8455389171cb6d34ef73cc1b  Data\Frontend\Levels\Tutorial_CA.tga
f4d08194814b85fae1d0f5610a79fc6b  Data\Frontend\Levels\Tutorial_DITD.tga
bf9bfe66c7a8ee307642e17d414db6f5  Data\Frontend\Levels\Tutorial_DR.tga
681db20f4837d655c78b550f0d1cfc34  Data\Frontend\Levels\Tutorial_TMK.tga
1c127d1de55511270de919936a1a6918  Data\Frontend\Levels\Tutorial_TT.tga
5b80d17d8ae35d84ea0efcec09054e89  Data\Frontend\Wormapedia\wpd_agentdennis.tga
898d688b9f0f949dd2ec68bb26f63841  Data\Frontend\Wormapedia\wpd_airstrike.tga
c300c269f2db91cec8a7fbcd4953f5b4  Data\Frontend\Wormapedia\wpd_aprilfools.tga
2aaec0440abe7aa9c9c5e9836b38c858  Data\Frontend\Wormapedia\wpd_axe.tga
1eb258170b92a44e6f028f76729dac49  Data\Frontend\Wormapedia\wpd_banana.tga
36a9879ca4f7e5f5302d5b3cc73f3593  Data\Frontend\Wormapedia\wpd_bazooka.tga
31c2e8b43f8cdc79ecd2c2736a30dac8  Data\Frontend\Wormapedia\wpd_bbbat.tga
b2d72501ffc73b576f3076ca710e0f16  Data\Frontend\Wormapedia\wpd_beatbox.tga
8a4138db1b150746634d9ca83f8aab82  Data\Frontend\Wormapedia\wpd_binoculars.tga
97745284c113c052d2392f3a3ae241a7  Data\Frontend\Wormapedia\wpd_blowpipe.tga
d7fdebb9b26d19cb8593d85665e03dbc  Data\Frontend\Wormapedia\wpd_boggypete.tga
3f195493b97e345bc815037248170d9f  Data\Frontend\Wormapedia\wpd_brightside.TGA
9cac361fd4e48c7bcedb846d100a5dab  Data\Frontend\Wormapedia\wpd_buffalo.tga
4bcda6a73d6cefb8b3ccec0073ee2300  Data\Frontend\Wormapedia\wpd_chatter.tga
cfd05b0a2a4c130710a7ec6fa8a57980  Data\Frontend\Wormapedia\wpd_cluster.tga
e6099ace89062686afff6de12e42d077  Data\Frontend\Wormapedia\wpd_cow.tga
ca6f0d314b5343819374953782332c44  Data\Frontend\Wormapedia\wpd_crateview.TGA
2c027856716a885214764dff4d6aed0e  Data\Frontend\Wormapedia\wpd_darkside.tga
5cc0a2f5d68e981c60dd971db096a149  Data\Frontend\Wormapedia\wpd_ddamage.tga
e9ec6dfe11c03d1c7eb650df676724e7  Data\Frontend\Wormapedia\wpd_doctorstrike.tga
57cdbc69aad01f63b57b5bed0a00dfca  Data\Frontend\Wormapedia\wpd_donkey.tga
37700d7603358daf223c83ca0ebbb02f  Data\Frontend\Wormapedia\wpd_dturn.tga
9ac5ca2b59f7a602a2b0085668344051  Data\Frontend\Wormapedia\wpd_dynamite.tga
0ce48a7afce731df0ba0990d53ce0132  Data\Frontend\Wormapedia\wpd_earthquake.tga
37c78890e4ea54b0d97474a2f6683acc  Data\Frontend\Wormapedia\wpd_firepunch.tga
a950df73548e61e9dacc3bbe54f5a32c  Data\Frontend\Wormapedia\wpd_freeze.tga
4caed7f573f1de9f1020f2a9a8b66458  Data\Frontend\Wormapedia\wpd_gasgrenade.tga
ab7ad3270eb7a8c8fa0e637ff0c118fc  Data\Frontend\Wormapedia\wpd_giraffe.tga
260d62b0151e259ba410c90fe8d6dd2f  Data\Frontend\Wormapedia\wpd_girder.tga
039aad801ceb5fa090e4b2cdbe572a0c  Data\Frontend\Wormapedia\wpd_grenade.tga
a173377b64fada02f89ddb482da9b713  Data\Frontend\Wormapedia\wpd_hhg.tga
5828122b65b8d8f25178846d197f5b69  Data\Frontend\Wormapedia\wpd_history.tga
b81e7392f38365b00e13b564615f61da  Data\Frontend\Wormapedia\wpd_homingmissile.tga
023de00c28c031ad24adb7b863fd4fb9  Data\Frontend\Wormapedia\wpd_horror.tga
861458b40d7c19b723c08556ee0bb718  Data\Frontend\Wormapedia\wpd_jetpack.tga
5d0694d3b234b80be53a5b35a7a1f207  Data\Frontend\Wormapedia\wpd_lastworm.tga
2c24ddb85b4ef615faa9c92938d29e66  Data\Frontend\Wormapedia\wpd_lightside.tga
94ff56ec672618e892ac600578c6fc36  Data\Frontend\Wormapedia\wpd_lostmissions.tga
cb61732be155eb40cde1004a14638e46  Data\Frontend\Wormapedia\wpd_lotterystrike.tga
b2a953511f74d8518596645901faa735  Data\Frontend\Wormapedia\wpd_lowgrav.tga
0bb831f5d216b180495a1bcfcaff9be3  Data\Frontend\Wormapedia\wpd_megamine.tga
676c294eda6fe6a6602b3c259b493f88  Data\Frontend\Wormapedia\wpd_mine.tga
f117b9647772385657cccfa5fb8cdafa  Data\Frontend\Wormapedia\wpd_mortar.tga
f3c47de713202bd5448b79dfe47a7cc5  Data\Frontend\Wormapedia\wpd_niagra.tga
2f3a9c1878cb32ec03038aee1691341f  Data\Frontend\Wormapedia\wpd_ninjarope.tga
566a2712787317a399194cda54421b65  Data\Frontend\Wormapedia\wpd_nuke.tga
4dacd9607ca6b54d8bb93e959fa9d1e2  Data\Frontend\Wormapedia\wpd_oldwoman.tga
b895dac27a6eeb8afc67a6db12aea3ff  Data\Frontend\Wormapedia\wpd_parachute.tga
d84875883c0b256c0314dbbff252c9cd  Data\Frontend\Wormapedia\wpd_petrolbomb.tga
fb9d256cd2a54867051a7c023a98a286  Data\Frontend\Wormapedia\wpd_pigeon.tga
06aba583e3ceb56fc56df2830c0752a3  Data\Frontend\Wormapedia\wpd_pinball.TGA
1fef7e12f977def641bfab5e7deb3097  Data\Frontend\Wormapedia\wpd_pinkbeard.tga
3a502057762a33dcf23339f0f2db8f26  Data\Frontend\Wormapedia\wpd_prod.tga
5a7cc35d392ccb19674fc0567e213285  Data\Frontend\Wormapedia\wpd_prototype.tga
3164a021d1a66436839e96c6ffe30933  Data\Frontend\Wormapedia\wpd_puppetmaster.TGA
a03f10f649e779993eb09743c97b1a85  Data\Frontend\Wormapedia\wpd_religion.tga
b890a188bc14929aabc782d99544031a  Data\Frontend\Wormapedia\wpd_sally.tga
4d9fb194246decf50201bfbcc473fe65  Data\Frontend\Wormapedia\wpd_scalesofjustice.tga
f798f98b33227911dc0ca40f8ea11215  Data\Frontend\Wormapedia\wpd_sheep.tga
e6c26ff6bb5f798b1be0c4dd58ad1b87  Data\Frontend\Wormapedia\wpd_shotgun.tga
cb6a6c648e73b6cb8abc080063b98d1e  Data\Frontend\Wormapedia\wpd_Shrines.TGA
3ab79a21fb6b9cdd346c91210a5a1298  Data\Frontend\Wormapedia\wpd_skipgo.tga
751ba8782aa305efa5f627fcfa136e5a  Data\Frontend\Wormapedia\wpd_stickybomb.tga
ce50e50531f900f9e7a10b68379ed70d  Data\Frontend\Wormapedia\wpd_supersheep.tga
4f89c94cb29fa9c9669fb72966aec359  Data\Frontend\Wormapedia\wpd_surrender.tga
966970392c02eb4e724719976c9ef52b  Data\Frontend\Wormapedia\wpd_tapper.tga
97adbeabf5df00da736c307e2497fb3c  Data\Frontend\Wormapedia\wpd_teleport.tga
20fa15921815945649934482f0125f09  Data\Frontend\Wormapedia\wpd_uzi.tga
63099ebf00b4b2567b8d92e754caf335  Data\Frontend\Wormapedia\wpd_wormselect.tga
6d1d06637e1fea9e09c535026071451a  Data\Frontend\Wormapedia\wpd_wormwear.tga
83674bdc856d55737571b71f27c8c65a  Data\Language\PC\English.xom
14a32832593a50a7643505f6a858d02a  Data\Language\PC\French.xom
3c095fae79cb5b9185b1399a7a5094f5  Data\Language\PC\German.xom
cf4926a4e53caadcc89fcb441a4aeea9  Data\Language\PC\Italian.xom
9bba25090d82e2ca99db5fbac588f42d  Data\Language\PC\Spanish.xom
4264d422dca8267c642c697423775516  Data\Maps\2Player.xom
464b388fce4cb96bad48f9aba6dfa47b  Data\Maps\4Player.xom
8b31d2680d01deac2fe65d48c55a35f9  Data\Maps\aitest.xom
0e838e1c8985fe98fc3aea1b5ca4d3b4  Data\Maps\Alien.txt
74e15445390baf9482362d03cc08f1db  Data\Maps\alien.xom
8daac479d529e1496a93dd240b978117  Data\Maps\animstest.xom
31696f7ab543d18bc4b515f5e30ffd00  Data\Maps\applecore.txt
ce41025557630e91eb3f29c8e2044c1e  Data\Maps\applecore.xom
b6d39fe4d0020b013783819edd6b4367  Data\Maps\assaultcourse.xom
388416a80168c360055bf48684b4a659  Data\Maps\atlantis.txt
ec6bdc589f5e444886fe9d5f2537c059  Data\Maps\atlantis.xom
56584428f846175683cb1a180f06ba23  Data\Maps\balloon.xom
f3ed9086adb702fccd123b4c9f989c0f  Data\Maps\beanstalk.txt
e2d8a4a8e06a019d0959588fbb52e7a8  Data\Maps\beanstalk.xom
8dd67e176454eef019413a210ae975c2  Data\Maps\boldly.txt
aca361875579cceb084ba3101c4b8bcc  Data\Maps\boldly.xom
7ca852a77fd4917043375e99bf1c27cf  Data\Maps\breakfast.txt
f2aada3403bd4fa4fc134708222eece1  Data\Maps\breakfast.xom
cd2555d635c53227cd79ef2dedd5f4b0  Data\Maps\camtest.xom
09618fbf5d4d3db9c6b42ad6a0539307  Data\Maps\chateau.txt
86ed3360091c0489b0d5a6c9c2ba20c6  Data\Maps\chateau.xom
f0c57053feef5703a98b141a1fc54c1d  Data\Maps\cherry.txt
4ce22b70469bb8a8a717ecdace0f15b5  Data\Maps\cherry.xom
6914c5755e7897eab3bca7d04e196886  Data\Maps\Chute1.xom
3c04d3286fb4256d0eab32c767fffc71  Data\Maps\chute2.xom
9e2b686794ea5fc272f4a38c66eecf17  Data\Maps\chute3.xom
19d6c7ff5ab07b0eddb9c45f7fa1af03  Data\Maps\Clean.txt
fe6a2c15563ef29a90928964bfb83875  Data\Maps\clean.xom
ca54aa42b2336639fa1dea4ce33943e9  Data\Maps\collide.xom
0bad8ca8076170370e239defa59f6963  Data\Maps\cooped.xom
6fbd18b1d033554aac8fabd6ba92dbdd  Data\Maps\countingsheep.txt
5daf865649bcd5ed6c506134cecbc5ca  Data\Maps\countingsheep.xom
3762970f9f2fbdbfeb9051d04c89d4c9  Data\Maps\crate britain.xom
c8f039e74af57cf7c79260b48063a0c2  Data\Maps\CrateBritain.txt
d590b22da4ad39a25dc9bf233aa83ad9  Data\Maps\cratefun.xom
4d851d2236d04db174b2def22925bd8c  Data\Maps\cratetest.xom
e1ee7b9b316f961d5b932c68c687162b  Data\Maps\crocketeer.txt
eb86b515b3b7119cc3ea3f94529c5109  Data\Maps\crocketeer.xom
a8041e70c1b6a357080ba91422d9585e  Data\Maps\CropCircle.txt
bb7a0b27bd98c1956b5247f036ad50d8  Data\Maps\cropcircle.xom
6dd82f33f497ac0e86b2ccd513dbf13a  Data\Maps\crust.xom
e167c03f386b788e21c74369f2c6aa16  Data\Maps\dday.xom
7f96c6a9bd04f5c328b4d6847eb90a9e  Data\Maps\Deathmatch1.xom
9da24bd6362d6951ff6ead264b03a257  Data\Maps\Deathmatch10.xom
0755d41b67d56626dd26cd39a6e8bd2d  Data\Maps\Deathmatch2.txt
7026351168f08e46f33e14368c5e4015  Data\Maps\Deathmatch2.xom
3b0e76cebdf60bbebea01c1ace999afe  Data\Maps\Deathmatch3.xom
eae4ba6967ada691402c88c8d1902fc4  Data\Maps\Deathmatch4.xom
8f270246d79a136bdbb8ab37efac09e9  Data\Maps\Deathmatch5.xom
e98951da0ffed2673797279b1ff0b585  Data\Maps\Deathmatch6.xom
3e0a1837f0411ad245865fd6ac69616d  Data\Maps\Deathmatch7.xom
5757c06b229d9a751b0abc55643ea263  Data\Maps\Deathmatch8.xom
8289c0ec6d0446b5f07364ba2060c7ab  Data\Maps\Deathmatch9.xom
8a6017d10b6b0f011da91fb5581108e3  Data\Maps\deathtest.xom
b929a8b6b4fe2618084e6393c6db6e8f  Data\Maps\driving.xom
386ab3e0f99f08e2327896da213a5c47  Data\Maps\dumps.txt
22e2f62fdd6ca679f9c89cbeafef0bc9  Data\Maps\dumps.xom
7363b9c049b99e3c9543cfda04b1996d  Data\Maps\E3demo.xom
f10f10dee4e57cc6823b4e959f8eb50d  Data\Maps\E3multi.xom
8da4883fb6069f51786197cc53a3fa5f  Data\Maps\E3single.xom
3271a3b6697f9b88fc032c7f5c047a3a  Data\Maps\falling.xom
052541d86450793ea172d672ecc3bbd2  Data\Maps\farmyard.xom
7f523f850a2458749df914ac863ab786  Data\Maps\FLATTEST.XOM
5e528c15637f62a3ceceaa5ad5f7647e  Data\Maps\FunFair.txt
3b4cfbee58e63c3241fa0d7c4673d399  Data\Maps\funfair.xom
5794a3a732e94ac93a275d958974a66d  Data\Maps\Graveyard.txt
92d8f8af2b5f94cfc9478ed311d63d8b  Data\Maps\graveyard.xom
771a8dfeb9cb37808cff4a92cd55ee4a  Data\Maps\helterskelter.txt
8cde32437dbeffc6275550a821e77c47  Data\Maps\helterskelter.xom
52b3fcf8a30833efbec8f7e9c6561ddf  Data\Maps\hide.txt
da65e22bcc7a740ece9f33e50f8877f4  Data\Maps\hide.xom
12b40323e621475d858d19ff46c95d53  Data\Maps\highstakes.xom
a1ad210667a9d5cd6ea56fc8d1f86892  Data\Maps\holiday.txt
414cccb525fb137030ff5566fcdee8c8  Data\Maps\holiday.xom
d8a4cb3d5cc41d42d4f2bea96f19c422  Data\Maps\homing.xom
391d39cdecd0842f5a2cceb61fffd313  Data\Maps\hookline.txt
74e2a5a75dba9770c651e6faf95869e0  Data\Maps\hookline.xom
e62c46d9521107a710ec28e45cfb4d32  Data\Maps\horror.xom
aea305a89e6969bbcca9d914dc6a209e  Data\Maps\ice.txt
e418a2b689c1b629a8a41db2fcaafb1e  Data\Maps\ice.xom
c26d7875c3a16b84717ed2a3434a4f27  Data\Maps\islands.xom
1ba2c40db810dda999aaf448f70edc8c  Data\Maps\jeggett.xom
365c59a6230ae01d5e9d6001ef1184f9  Data\Maps\jetpackchall2.xom
527b5e6a4dfd06975bf1c6a5d20dc378  Data\Maps\jetpackchall3.xom
3422f894cac81338193348ef1e62e390  Data\Maps\Kong.txt
b31d5baf627dac8cbfce8dbc4accc8fb  Data\Maps\kong.xom
263bbdcaccc4e7dba71d295609421b13  Data\Maps\landing.txt
14d4a9bdfa5396239795f6f2b8d7fdef  Data\Maps\landing.xom
e524204d711c3d45521b0deaa8dd5786  Data\Maps\leek.txt
94dc3f02d106dc7d249d9cd27cb2925b  Data\Maps\leek.xom
7906dad6e2dc4546888720af4065ead2  Data\Maps\MD Random1.xom
b9c89c25d54941e62c1edd3b9fa552a5  Data\Maps\MD Random2.xom
6344ee556e972cdd84eb7053cba16461  Data\Maps\MD Random3.xom
ce62257b7a8a3f577d3d58bf2d743fbd  Data\Maps\MD Random4.xom
a15cad713440e3af67eb0dded6bd01c8  Data\Maps\MD Random5.xom
94cc0a6d42b35be63a0827d022c9ec19  Data\Maps\MD Random6.xom
bf7b9b4b6f9edf45d7a85975089ecc8f  Data\Maps\MD Random7.xom
2d315d0faccbd466461ad391358b614a  Data\Maps\MD Random8.xom
06342da6aad6c732aa8fca346ef91cd1  Data\Maps\MD Random9.xom
67daef33a483ec25ec69f399ad0f2be2  Data\Maps\mike.xom
4f1838b6857967fbcbcb98882fd3f0c4  Data\Maps\multiapplecore.xom
56eb664db79ece4aefbe6d240e57efbb  Data\Maps\multifunfair.xom
6355e35f98fd9efff77a8004052210c6  Data\Maps\multipegasus.xom
4991eb82575fc1458e41fd1b3c9809a4  Data\Maps\multitreevillage.xom
5069b854d7ada79ad8704a3278fb28e2  Data\Maps\normaltest.xom
d9cda4455c4764b631fe9bb7c2e0c0d9  Data\Maps\notpc.txt
769ef477fdb2cc3045c44aa9c2faf43f  Data\Maps\notpc.xom
21a9ac1cdbd371f9916b98914f53ef20  Data\Maps\pack.txt
e50e7e796268588d68eeded48c2fcae5  Data\Maps\pack.xom
ca22f8b7307d2f6adc386124fc1826a4  Data\Maps\pdemo.xom
43415370b8922e7cd06385113cdf4f82  Data\Maps\pdemo2.xom
f9ec982c435077fe1640aa415745348e  Data\Maps\pegasus.xom
9864b3d12ec1b08006e4291c5ef45eea  Data\Maps\pirate.xom
8bdab3aadde0fcc986d05b05fd5e31de  Data\Maps\piratetest.xom
f93078b60dd8905430b93ee2442ef691  Data\Maps\piratetest2.xom
1b56a4b1b26aa5650ec04854451bafec  Data\Maps\PLAICE.txt
256ed007105abdb356d8d32b051b4de7  Data\Maps\plaice.xom
b93b28b0eac5452af14ff36ca2eab73f  Data\Maps\pleasenomoreislands.xom
076cea2788b3d6027e6a48f846d6a4fc  Data\Maps\ps2test.XOM
89084baa9f3377bbdf5ad52e06d9946f  Data\Maps\random.xom
88e1caa7003e1bb90ef73553b2f925dd  Data\Maps\rum.txt
9a640c24b0cf9478ac51ac58a5643f60  Data\Maps\rum.xom
09f33e34af1da39f8df5804a7a467fc1  Data\Maps\SCHOOLS.txt
778937cfbceb5f889c6357ffc1318076  Data\Maps\schools.xom
432372ab64150de71b05e011750632b0  Data\Maps\scriptai.xom
77fa92aec7a58d660183f3ff303181cb  Data\Maps\Sheep1.xom
62cda8e6765ad44dfe322eddd6c48681  Data\Maps\Sheep2.xom
c9bcf9b5d265c06e7b014403fb410e04  Data\Maps\Sheeptest.xom
68a52e0985e44c5e26a737b861ae4a91  Data\Maps\Showdown.txt
14a5bc42be3c298c26700d4ee96e7afa  Data\Maps\showdown.xom
c5534b7d405bf365fac218cb8ef2b405  Data\Maps\snow.xom
d76c00d09e6f6521f47c9d6616a209fc  Data\Maps\spacestation.txt
7557af211631b2bddcabb01dab531022  Data\Maps\spacestation.xom
76435fd531b638afc8bc451440fe7b45  Data\Maps\stalag.xom
5cb35141d55b4bcd0c5aa84229f2de5e  Data\Maps\StevesFlattest.XOM
d09f1a9cd24ae3b7b76257112ab4c01a  Data\Maps\submission.xom
a26af408df34460f7051b3201533cb49  Data\Maps\TargetHunt.xom
55522a4f45267a22314617763fb2214a  Data\Maps\TargetHunt2.xom
6c46877180ff099e8dc39069ff5711b7  Data\Maps\TargetHunt4.xom
573e583f143ff2f82f693f5d8d2e1b30  Data\Maps\team17.txt
64ffb6b5885ba34c5e575e38b6839f3d  Data\Maps\team17.xom
01c403068000994bd42c7f852c05f9e2  Data\Maps\tennis.xom
377114936615b5bdf2780da924968a36  Data\Maps\testtubes.txt
dfbb85761a0f4a55137baeabd9fbb94a  Data\Maps\timbers.txt
9b6bfc5d3552d11cb5df9b3f1a4e25c0  Data\Maps\timbers.xom
dc4bb077548ffcadd467c28fbc35023d  Data\Maps\treevillage.txt
eae53629827069c9be06afc52e3048c1  Data\Maps\treevillage.xom
d7cbe217dc9ce904e8ee37588571de7d  Data\Maps\Trial.xom
3b960dcb69157c2c792a4571907d94b6  Data\Maps\Trial_custom.txt
320b4db758e15d22aa8c6d5ee02bbcd6  Data\Maps\tutorial1.xom
cebe0d063c64c098f86b9868a38e86fb  Data\Maps\tutorial2.xom
089a43a2d380aaa3334abe9642530ebe  Data\Maps\tutorial3.xom
611a84b06a63cd7bac373a3d82aee30d  Data\Maps\Tutorial4.xom
83f41ffa5571b3e2adb20744d0ce00c5  Data\Maps\tutorial5.xom
6e07b07b105d2791ab1c51474b9e276b  Data\Maps\unitcube.xom
2a7c87a74bf06bdd080c59d9e7078119  Data\Maps\VsCpu.xom
f7b6b5823972bbfb1120ef9d23297c42  Data\Maps\w.xom
73c791a18629c9a9622067419a03b0ce  Data\Maps\wormisland.xom
59dbeca5b6470fcc085ba958e2c2a4e0  Data\Scripts\1PTutorial.lub
3d797ce88d6b6e895fe87dd9d7a945cb  Data\Scripts\2Player.lub
924849aea353db3fa275bfa1977215e5  Data\Scripts\4Player.lub
d482bf16166296e83df932a59f616e5b  Data\Scripts\aitest.lub
52554ca4c5fc54fe3a358a63d4606d3f  Data\Scripts\ALIEN.lub
814e506c91ab04cd541033537e46aab4  Data\Scripts\animstest.lub
9337aa0aed78b520a49b1178fe88182d  Data\Scripts\applecore.lub
211350a061e6be198954d7a8027e3caf  Data\Scripts\attract.lub
ae77aa48b0ff4b6b528e51d02d8497b8  Data\Scripts\BALLOON.lub
47b815b40d9601b146e30ec526c66f07  Data\Scripts\beanstalk.lub
4c2d091b3c796df21181c4438db11d7b  Data\Scripts\boldly.lub
072dfd921506b48dcc58847620d2b97b  Data\Scripts\BREAKFAST.lub
2f543559b89df0261f1c73a963892324  Data\Scripts\camtest.lub
d196caecd316a8c08447e689d9cffa1d  Data\Scripts\cherry.lub
a16770c73fee8aef8226b432548e1f63  Data\Scripts\Chute1.lub
9dfb0f9c535d36dc18344ef380481baf  Data\Scripts\Chute2.lub
d7c72a84469bcacbeecec975b28f667f  Data\Scripts\Chute3.lub
51cac1ed0a7e68b15f4ead75e7eebc87  Data\Scripts\clean.lub
f8eb084668a7ecc43fabf7cb9549b960  Data\Scripts\COLLIDE.lub
a8da2bbaac9a029e4ad7cfdda277efff  Data\Scripts\cooped.lub
d6d7705b57bc3cf5e4a4d70bd0e50321  Data\Scripts\countingsheep.lub
2d14af7deb39ee812e1d4c914014f5d3  Data\Scripts\CrateBritain.lub
b9b5f1867426e89ba9d17de3e49eb6bc  Data\Scripts\cratefun.lub
07b78e535359391d32d9638e635e5c17  Data\Scripts\cratetest.lub
388e40b24f9a5c1094e55f9d964fde09  Data\Scripts\CROCKETEER.lub
8c9c269e2f74c0ac9747850ed4c7184f  Data\Scripts\cropcircle.lub
6be5a7aa5ad9556ff3a54cfa4c6515cb  Data\Scripts\crust.lub
7727c3a06033587eb0b52a1dc4843ace  Data\Scripts\crustTEST.lub
2c8091970e8f20a0372b1d437ccf772b  Data\Scripts\dday.lub
d4e4b116c6b090ab58ece87333c05ad3  Data\Scripts\Deathmatch1.lub
73acf2285984cedb98295e2bfe86fadd  Data\Scripts\Deathmatch10.lub
2a9f1f87f5160e92876772bfa16e9007  Data\Scripts\Deathmatch2.lub
10ceea1088ab885b02b8ac88c31e8f98  Data\Scripts\Deathmatch3.lub
9c528d88f8744385e0d0094ebecdb355  Data\Scripts\Deathmatch4.lub
d19fd0cdabbeb2001e790f136d413b45  Data\Scripts\Deathmatch5.lub
598705d82ef8dde26f8af5142e741bdb  Data\Scripts\Deathmatch6.lub
25778516639f9b1426b810461209739c  Data\Scripts\Deathmatch7.lub
8776404bdeb66cd08e77bb9b52a22920  Data\Scripts\Deathmatch8.lub
e7eb41356d2b27234899f356075c9016  Data\Scripts\Deathmatch9.lub
f940ef574533da6a9a0ea500f9736a93  Data\Scripts\deathtest.lub
258ffdebe2f62115be947595d6470417  Data\Scripts\driving.lub
5540b240c56a738988cb3fcf47931e04  Data\Scripts\drivingdemo.lub
7b25a01900827d02ed3631189f6d4ee2  Data\Scripts\E32AI.lub
7cb0bfbd1d47ff551181ffd1de69ceb0  Data\Scripts\E3multi.lub
f2741a3307ae6a56482c50141f1b60d9  Data\Scripts\E3single.lub
76fa9282a4ca9a1b10678a413f8777cd  Data\Scripts\EarthquakeTest.lub
90a92987a3c806460288d32957244735  Data\Scripts\ex1.lub
7d8d1e81b86cc4ef272f583e79ea5ce6  Data\Scripts\ex2.lub
a2dde5465f6136d54eb75668d1bdf505  Data\Scripts\ex3.lub
6207ea1b1a2bb8b300836562dfd250dc  Data\Scripts\ex4.lub
adfa5c74477971e1c53a4a31dbccd560  Data\Scripts\ex5.lub
ea7b1c20cedbf37e5517f6dc07479bf6  Data\Scripts\ex6.lub
bb99230d47a0d3a779868f45c2549396  Data\Scripts\ex7.lub
5fb591866eb4da2758a6be6cd8046929  Data\Scripts\ex8.lub
da98df4946f5572db33153852a46dcc4  Data\Scripts\FALLING.lub
f45bebd6f9167fc5cc3821cce1985966  Data\Scripts\funfair.lub
6a9e09a216d27fbd837bc60de1631ab5  Data\Scripts\graveyard.lub
f8f4234a7b4bd5174a965abf9fdc2eb5  Data\Scripts\helterskelter.lub
f0ff800ea003c02bafb6ab75a35e2ba5  Data\Scripts\hide.lub
6352eba3a3221f911261637f5662fb83  Data\Scripts\highstakes.lub
bb5d2b56a9866013ea7170d8adf3c903  Data\Scripts\holiday.lub
daebac73c9ee3057b4f195519e76ea7c  Data\Scripts\HOMING.lub
1166b530958df44d55a16fb7ad170043  Data\Scripts\hookline.lub
8f41639119cb8b5eb180926783e6eada  Data\Scripts\ICE.lub
0beacf9dab3337ee45e128c335ba2399  Data\Scripts\jeggett.lub
c572a75353dcf197cd7aa2c97e047687  Data\Scripts\jetpackchall2.lub
e46bb4ca92657bea33f46594779b6ed5  Data\Scripts\jetpackchall3.lub
a00f9feaef2a5397ed98ac2d59f007de  Data\Scripts\landing.lub
007911e24b203e0c51eff1df1f80b655  Data\Scripts\leek.lub
c84c34f9fd5a119ccc9762fbfbb378c1  Data\Scripts\level1.lub
94fdcfc649b5dde54b0ea5766c45e114  Data\Scripts\level1demo.lub
b8d93d60a448740b4652a0c3f0c2605f  Data\Scripts\MartinTest.lub
445631348698e237aedd3494b0287f9b  Data\Scripts\mike.lub
849410e05ed3b70fd2dec50290a35bc9  Data\Scripts\notpc.lub
cfa2c7a40a5d3cfa46fe34350ace3b10  Data\Scripts\pack.lub
bcef69fdd6b313bfeee7d4aa10874a96  Data\Scripts\ParticleTest.lub
c310b393635ac33a375ebb9461ef0a6e  Data\Scripts\ParticleTest2.lub
4f9b7bbf7456bfd6b0a004aa7e0a46c3  Data\Scripts\pdemo.lub
4f9b7bbf7456bfd6b0a004aa7e0a46c3  Data\Scripts\pdemo2.lub
f318c78fda43cdb165783464c1260780  Data\Scripts\pegasus.lub
5a0a8c3d5a20f5f3e314d45644a463d6  Data\Scripts\PLAICE.lub
cf1e5194079e8e6c34d95ccb0fbbcbcc  Data\Scripts\PS2Vs.lub
42140e322201a3c2d5334a5fe8ff78d5  Data\Scripts\PS2Vsdemo.lub
3e91c6e107c9b43b49e2415654694385  Data\Scripts\rum.lub
caf355e70d6e07a981d6ad4027070535  Data\Scripts\SCHOOLS.lub
1abc3bff50f11121fda303b288766a86  Data\Scripts\scriptai.lub
602794bcbf8ce6f113f732f42a0aaa18  Data\Scripts\ShakeTest.lub
daa3e28e41b2cd5140930e724cf66d3b  Data\Scripts\ShakeTest2.lub
c54709a9ea77e2434287956eb4508778  Data\Scripts\ShakeTest3.lub
6e6ca85e821fe6b16d2599e73c7abbc8  Data\Scripts\Sheep1.lub
14e9df14e94174f6ebe609e210dbfcb5  Data\Scripts\Sheep2.lub
f749451710c1b59cfbf5f18591672f1d  Data\Scripts\SHOWDOWN.lub
a001ea3936a8936fcd1b019ce3fe3dea  Data\Scripts\spacestation.lub
9dec85ddc01c1a935e1d35a61976fb0a  Data\Scripts\stdlib.lub
b240d45c4b5dffa174b4d05522630589  Data\Scripts\stdvs.lub
f9a7117a79e08deea460fd292e2fb31e  Data\Scripts\submission.lub
0d09798cf0c41da28728bc1afb3920af  Data\Scripts\TargetHunt.lub
b193789f82277f080a23ca8dcb0936d6  Data\Scripts\TargetHunt2.lub
ad5e1be52e017cbf8763c5c62fcac147  Data\Scripts\TargetHunt4.lub
703e0225a2d7cbec3de691591811936c  Data\Scripts\team17.lub
8e67d4634b4959da85ca329f428a650c  Data\Scripts\timbers.lub
f59cc89feb79f2377b0cde5c9293e3a6  Data\Scripts\treevillage.lub
e5a4c77ac8ed6add5e4e7cb35238f939  Data\Scripts\TRIAL.lub
8c973042a19d6b4415a6440e5acf0fd9  Data\Scripts\tutorial1.lub
c53745b11a6bb8f90c99f23b5a3f576b  Data\Scripts\tutorial2.lub
4971706f731f7811bdaf8e4e16e9ec19  Data\Scripts\tutorial3.lub
1228fbf7830f786af6a09825794e11e0  Data\Scripts\Tutorial4.lub
842a9150122d04ed755508e52c006946  Data\Scripts\tutorial5.lub
c90ca974f9e4213fcc8c591086fb5ddf  Data\Scripts\VsCpu.lub
e712685ad1853e6c95b15aca0a1f3139  Data\Scripts\WormIsland.lub
8a28f90d4d22c678a6064c939d9df739  Data\Scripts\Wormpot.lub
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank02\B02 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank03\B03 Texture List.txt
dfcebababa69cc875bfcf9989431a6de  Data\Themes\Custom\Bank03\Loch Ness Steps.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank04\B04 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank05\B05 Texture List.txt
1720d5f35ca10da26d55edad7de80a7b  Data\Themes\Custom\Bank05\Textures_Wormandveanstalk2.txt
1720d5f35ca10da26d55edad7de80a7b  Data\Themes\Custom\Bank05\wormandbeanstalk2.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank06\B06 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank07\B07 Texture List.txt
57138479d8b0b2733bce530e0618d663  Data\Themes\Custom\Bank07\Crate Britain.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank08\B08 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank09\B09 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank10\B10 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank11\B11 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank12\B12 Texture List.txt
449156752c43ff4fa41d73c9ef35bd02  Data\Themes\Custom\Bank12\funfair.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank13\B13 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank14\B14 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank15\B15 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank16\B16 Texture List.txt
75042b53540272f6788ec387add8c346  Data\Themes\Custom\Bank16\Graveyard.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank17\B17 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank18\B18 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank19\B19 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank20\B20 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank21\B21 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank22\B22 Texture List.txt
0288e4ffa02ba8caf6db9b6743e2f852  Data\Themes\Custom\Bank22\breakfast.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank23\B23 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank24\B24 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank25\B25 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank27\B27 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank28\B28 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank29\B29 Texture List.txt
18bf002ac29248b3cafe44f673b6ba10  Data\Themes\Custom\Bank29\helterskelter.txt
d7008561b3ac913641f472a0e0c51fb9  Data\Themes\Custom\Bank29\Texture_helterskelter.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank30\B30 Texture List.txt
28e475f433eab5f479cc1aee41e2a3a0  Data\Themes\Custom\Bank32\B30 Texture List.txt
ba1f09785ca6f1792649acf77ae4e526  Data\Themes\Custom\Bank35\Texture_Treevillage.txt
d9cda4455c4764b631fe9bb7c2e0c0d9  Data\Themes\Custom\Bank36\notpc.txt
bcd674cfe9b276d01038b2ef93b57238  Data\Themes\ThemeArctic\ThemeArctic.txt
66f589104f27224b5d3d92d8e1d31247  Data\Themes\ThemeEngland\ThemeEngland.txt
ba44055d12c6f5316ae73faedb88f2d9  Data\Themes\ThemeHorror\H Detail List.txt
ccccf612bd1a0205068d2e26bfbf1e12  Data\Themes\ThemeHorror\H Texture List.txt
acb8517e424e7a01af29cca999a767b4  Data\Themes\ThemeHorror\ThemeHorror.txt
ec4f48d23613b7cd871ae7850079bbde  Data\Themes\ThemeLunar\LDetail list.txt
cb87e388b11e841e35ae5c278071ac7d  Data\Themes\ThemeLunar\texture list.txt
04af32acfa209fcbf84534763136807f  Data\Themes\ThemeLunar\ThemeLunar.txt
c26463d8daa6603074d60df93e045f3a  Data\Themes\ThemePirate\P Detail List.txt
f3aaf3bb79899e272abac5c9b132c842  Data\Themes\ThemePirate\P Texture List.txt
b52c45ec796b88b076a29c21d8dc308c  Data\Themes\ThemePirate\ThemePirate.txt
9963ada75c0ce7e98f34a766e0d5a9bc  Data\Themes\ThemeWar\ThemeWar.txt
4fc199b356130a8fb4af724e2e9ccbe1  Data\Themes\Tutorial\Tutorial03\Texture_Kong.txt
807c82058b4423adc9f3daf639e1e7d5  bin\XomClsDb.dat
561fa2abb31dfa8fab762145f81667c2  bin\msvcp71.dll
86f1895ae8c5e8b17d99ece768a70732  bin\msvcr71.dll
e1102cedf0c818984c2aca2a666d4c5f  bin\unicows.dll
  bin\Worms3D.exe
  Launcher.exe
'@

$versions = @{
    '4ee280550fdb3ee31096fd8de49470c3' = 'V.2 Euro (???)'           # Launcher.exe 1073 Euro Cracked ???
    '5f2d24f995e85c70076f00cbecec4788' = 'V.2 Euro (iNCQRiT)'       # Launcher.exe 1073 Euro Cracked iNCQRiT
    'bd30841ee9dbd8f34a830ac94be1ec51' = 'V.2 Euro (TNT)'           # Launcher.exe 1073 Euro Cracked TNT
    '39a2d3f7bb9a64705ef00bc5e819106d' = 'V.1 Euro'                 # Launcher.exe 1003 Euro License
    '835570280dd4d9a70578200550bfbc5c' = 'V.2 Euro'                 # Launcher.exe 1073 Euro License
    'f48ef26afff1e151ff401dc3c54eb037' = 'V.1 Polish'               # Launcher.exe 1073 Polish License
    '04dc9cc9b0e810f024901b61fcddf210' = 'V.1 Russian'              # Launcher.exe ???? Russian License
    '795db6cd5e9aab9f1d2da17cf28f1a26' = 'V.1073 Euro (DEViANCE)'   # Worms3D.exe 1073 Euro Cracked DEViANCE
    'b0c2145b8d3fe597d6da82eb3f989747' = 'V.1073 Euro (SecuROM)'    # Worms3D.exe 1073 Euro License
    '6c62ceb6860881f194fd771d0fb7c81a' = 'V.1053 Euro (SecuROM)'    # Worms3D.exe 1053 Euro License
    'a45d4571ad931534a828c1195976cc5b' = 'V.1003 Euro (SecuROM)'    # Worms3D.exe 1003 Euro License
    'a68f0b51b6e93fa65a02b3599b21e34b' = 'V.1073 Polish (SecuROM)'  # Worms3D.exe 1073 Polish License
    '952199212418e930f5dbb743eecf044e' = 'V.???? Russian (SecuROM)' # Worms3D.exe ???? Russian License
}

$list -split '\r?\n' | ForEach-Object {
    $checks++
    $hash, $path = $_ -split '\s\s', 2
    if ( -not (Test-Path $path) ) {
        $errors++
        Write-Host "[ FAIL ]" -NoNewline -ForegroundColor Red
        Write-Host " $path`n  Not exist"
        return
    }
    $received = (Get-FileHash $path -Algorithm MD5).Hash.ToLower()
    if ( $hash ) {
        $expected = $hash
        if ( $received -ieq $expected ) {
            Write-Host "[  OK  ]" -NoNewline -ForegroundColor Green
            Write-Host " $path"
        }
        else {
            $errors++
            Write-Host "[ FAIL ]" -NoNewline -ForegroundColor Red
            Write-Host " $path`n  Expected: $expected`n  Received: $received"
        }
    }
    else {
        if ( $received -in '4ee280550fdb3ee31096fd8de49470c3',
                           '5f2d24f995e85c70076f00cbecec4788',
                           'bd30841ee9dbd8f34a830ac94be1ec51',
                           '795db6cd5e9aab9f1d2da17cf28f1a26' ) {
            Write-Host "[  OK  ]" -NoNewline -ForegroundColor Green
        }
        else {
            $errors++
            Write-Host "[ FAIL ]" -NoNewline -ForegroundColor Red
        }
        if ( $versions[$received] ) {
            Write-Host " $path`n  Detected: $($versions[$received])"
        }
        else {
            Write-Host " $path`n  Unknown"
        }
    }
}

Write-Host "
Errors: $errors
Valid:  $($checks-$errors)
Total:  $checks

Done, press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
