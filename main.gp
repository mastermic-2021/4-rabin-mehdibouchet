\\ **********************************************************************************
\\  Fonctions de l'exercice :                                                       *
\\                                                                                  *
\\    chiffre(m): Chiffre le message <clair> m                                      *
\\    dechiffre(c): Déchiffre le message <chiffré> c                                *
\\      C'est une copie de la fonction dans le fichier dec, mais en brut            *
\\      avec quelques petites modifications pour enlever les sécurités              *
\\ **********************************************************************************

chiffre(m) = [m^2%n,kronecker(m,n),m%2];
dechiffre(c)= my(s=119349608519831514272633687753853257840610359320883898920033571621089411155655436264183892500492442617061793237027828743475433775669186144782961081892218061138557544420208222283909600250757571678981154564074006979071237712820879088146788001114636489228848696272784065969767781905741765779591714126684524250640,a=1069754219625014756698611912426737612759860071700467920546175510319006680182161824471621722881484000013470811437287011668108650625628673404678321038063795330724837811804912068428887271864719366107832844269474475814929732439744202884756027420825850572786461613311878416838890638213331378004160314790352077751,u=[88493337813651414633952358503604809186410912258591066495928314614307004259515008288526799610846438930517806705295491059803115696656837987037600003559035165722555625392999884400098761992398442695851499992376812260921694392398447982887388857063007756037322125668216030616182190620027093894158499668976994720184, 30096519250526164998260866974162112527356816883492995962413763063609875120447252440292526675881251098744255974726357031638193931110189549918925651435590070066103471185254709335581599734912348419385173161743256368833110022348274531484825471463607273562647784889147841192748190031502659917255812029076187777533, -77481039367803583829114960498039147927426553770491451862313824420475083907695874214986892404004179543790970060096505663650565672725939160626035682783162695782985362758258483836816589344018073609029203330039972866144316005514826742086407128012995652068747755448320807236524647051141157534251015988434470762632],b=[1690165097121029974303579486891946639727246395778536224832027153236993476783344486251054143974041470915621945589188494206479147249413010656169289791128955241186431119279157564727700150783344016455650439000284818661792932021203876589683536261453353496952987235988565828416896756131356476723802490432963596446, 447291058989090853544769932089860202834549263585337144847464769495328603311844611613152573767453631688747735817535730684596283383939969375354450515496983982052483624447689232055688342992294584446805726971448130890630711439214303346124243522538282049631455370814223683025238114449350863646306147800346353952, 380216396304133784205532348596921277881483905654626946854008092649621644775433141901443519595117399469951177423314145211713744993410948764037053257453281413593940189558620674988190459963083284950993693667499313704009783676211803284264468773718768397877574641636013891859070685222351104669848462564337669435],v=[57119834267088628922893232417378180376357205805376131876711929512566559437588564135728890662984397206247257656527635300787878697582546145834368554078870454097516089077850751207444842414937643382528296837313588892088354454532585138598880106122317178622872228667521244128613815699991354520737139413144703173323, 7453159363082984413103116353386457977422186113680042856420636853436035714330319219227012533953885021432795005998124051209267019730257423288412392220684033530152703609129918762697720419226784852206982575538493105229658202171475172208109495116919218694860674848965247074370836301423540424080571816892438093374, -25416088117618853828804277333848269668591503007682955348298434691322643454970833900134398146922141503818962512996049557254661575581223191887240877192085917506569033402618535439210527622770036311408314514334273806489889793420633503559259808035087447186005214717401325921540480738331569013629603495652697984572, -21193976758016890091490910456454556994018572017370306892956333836793343956307534773914119437047884241474922642531784288697089585880614608636711584136066686144683429490873517854419228007851140464125632959722027489567891272034268475896579480285980721640583148930649086434274526826175297341639076055624183390927],d=[21511114190044631824901536137055418063029880976788007134403527358632633963421443689615106528390297993343616914156425562053830988250840252054166527828859670393311591586799356088206128495169788672943966061912429873009315566741079005787792292733994966532054217943925418472571176159656487233161594519789666146452, 1551006067165986024706984557671454064798533608147758529273393090662967320421115134667913757971585115899161536079155623238819802222910230136422741780126219046188021546446083043330886699922622652559628181752949733672029278916929112433256720168524796889982670994043543644711370871869462251665825335364819170172, 197162555358855412265109701495032562353655265045629886846250265688292290726689749642868748699001073450253623731848544011130434812061645738637025116619684113986019727530498538117896557955480575582440664551412370736641642099650589609183144456038852455094345191433889063953348383592208276662687241081605506477]);my([m,j,p]=c);m*=Mod(1,n);m=lift(s*m^a*(sum(i=1,3,u[i]*m^b[2+j]+v[i+(j<0)]*m^d[j+2])));if(m%2!=p,m=n-m);m;
dechiffre2(c) = read("dec")(c);


nb = 512;
nbm = 12;
mod = 1<<nbm;
mask = 2*(4^(nbm/2)-1)/(4-1);


\\ **********************************************************************************
\\  Paramètres de l'exercice :                                                      *
\\                                                                                  *
\\    n: nombre à factoriser, n = p*q avec p,q premiers et congrus à 3 mod 4        *
\\                                                                                  *
\\    m: Message <clair>. Nombre aléatoire respectant la sécurité de l'exercice     *
\\    c: Triplet au format (c,j,p). c le <chiffré>, j son symbole de legendre       *
\\      p sa parité afin de le distinguer lors du processus de déchiffrement.       *
\\                                                                                  *
\\    c_: Triplet au format (c,j,p). Identique à c sauf que j est l'opposé de c[j]  *
\\      On souhaite appliquer le déroulement de l'attaque décrite dans le cours.    *
\\    m_: Message <clair> reçu en fin d'algorithme de déchiffrement de c_           *
\\      Il verifie:                                                                 *
\\          _m = -m [p] et _m = m [q]                                               *
\\                      ou                                                          *
\\          _m = m [p] et _m = -m [q]                                               *
\\      en fonction de c[p] (la parité de c_)                                       *
\\ **********************************************************************************

n = read("input.txt");
m = random(1<<500)<<nb+mask;
c= chiffre(m);
c_= c;
c_[2]= -c[2];

m_= dechiffre(c_);
m_2= dechiffre2(c_);

\\ D'où p= pgcd( m_+m, n) 
\\ et   q= pgcd(m_-m, n) 

p= gcd(m_ + m, n);
q= gcd(m_ - m, n);

if(p<q, print(p), print(q));
