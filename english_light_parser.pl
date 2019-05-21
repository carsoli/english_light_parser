%subject verb object 
s(s(NP,VP)) --> noun_phrase(NP), verb_phrase(VP).
s(s(NP,VP,C,S2)) --> noun_phrase(NP), verb_phrase(VP), conjunction(C), s(S2).


%NOUN PHRASES =====
%determiner, nominal or determiner, noun
noun_phrase(np(D,AN)) --> determiner(D), nominal(AN). 
noun_phrase(np(D,N)) --> determiner(D), noun(N).
noun_phrase(np(N)) --> nominal(N).
noun_phrase(np(N)) --> noun(N).
%with prepositional phrases FOLLOWING NOUN PHRASES
%(...after school/..behind the building.)
%in the shed behind the building, in the large empty room after school.
noun_phrase(np(D,AN,PP)) --> determiner(D), nominal(AN), prepositional_phrase(PP). 
noun_phrase(np(D,N,PP)) --> determiner(D), noun(N), prepositional_phrase(PP).
noun_phrase(np(AN, PP)) --> nominal(AN), prepositional_phrase(PP).
noun_phrase(np(N,PP)) --> noun(N), prepositional_phrase(PP).
%with clauses and no preposition; the girl who won the competition....(should be followed by verb phrase)
noun_phrase(np(D,AN,C)) --> determiner(D), nominal(AN), clause(C). 
noun_phrase(np(D,N,C)) --> determiner(D), noun(N), clause(C).
noun_phrase(np(AN,C)) --> nominal(AN), clause(C).
noun_phrase(np(N,C)) --> noun(N), clause(C).
%with clauses preceded by prepositional phrases, the girl in the black skirt who won the compeition...
%the girl under the orchid in the garden(prepositional extension) who won the compeition...
noun_phrase(np(D,AN,PP,C)) --> determiner(D), nominal(AN), prepositional_phrase(PP), clause(C). 
noun_phrase(np(D,N,PP,C)) --> determiner(D), noun(N), prepositional_phrase(PP), clause(C).
noun_phrase(np(AN, PP,C)) --> nominal(AN), prepositional_phrase(PP), clause(C).
noun_phrase(np(N,PP,C)) --> noun(N), prepositional_phrase(PP), clause(C).
%with clauses followed by prepositional phrases, the girl who won the competition in Constraint Programming...
noun_phrase(np(D,AN,C,PP)) --> determiner(D), nominal(AN), clause(C), prepositional_phrase(PP). 
noun_phrase(np(D,N,C,PP)) --> determiner(D), noun(N), clause(C), prepositional_phrase(PP).
noun_phrase(np(AN, C,PP)) --> nominal(AN), clause(C), prepositional_phrase(PP).
noun_phrase(np(N,C,PP)) --> noun(N), clause(C), prepositional_phrase(PP).
%repeat all noun_phrases with conjunction of another noun phrase***
%the sunny weather and clear sky blessed the day.
noun_phrase(np(D,AN,C,NP2)) --> determiner(D), nominal(AN), conjunction(C), noun_phrase(NP2). 
%either dogs or cats pooped in the garden. 
noun_phrase(np(D,N,C,NP2)) --> determiner(D), noun(N),conjunction(C), noun_phrase(NP2). 
noun_phrase(np(N,C,NP2)) --> nominal(N), conjunction(C), noun_phrase(NP2).
noun_phrase(np(N,C,NP2)) --> noun(N), conjunction(C), noun_phrase(NP2).
noun_phrase(np(D,AN,PP,C,NP2)) --> determiner(D), nominal(AN), prepositional_phrase(PP), conjunction(C), noun_phrase(NP2). 
noun_phrase(np(D,N,PP,C,NP2)) --> determiner(D), noun(N), prepositional_phrase(PP), conjunction(C), noun_phrase(NP2).
%the happy kid who was on the riverside and the duck that was in the water became friends.
noun_phrase(np(AN, PP,C,NP2)) --> nominal(AN), prepositional_phrase(PP), conjunction(C), noun_phrase(NP2).
%A boy in the blue jeans and a girl ... loudly laughed
noun_phrase(np(N,PP, C,NP2)) --> noun(N), prepositional_phrase(PP), conjunction(C), noun_phrase(NP2).
noun_phrase(np(D,AN,C,CON, NP2)) --> determiner(D), nominal(AN), clause(C), conjunction(CON), noun_phrase(NP2). 
noun_phrase(np(D,N,C,CON,NP2)) --> determiner(D), noun(N), clause(C), conjunction(CON), noun_phrase(NP2).
noun_phrase(np(AN,C,CON,NP2)) --> nominal(AN), clause(C), conjunction(CON), noun_phrase(NP2).
noun_phrase(np(N,C,CON,NP2)) --> noun(N), clause(C), conjunction(CON), noun_phrase(NP2).
noun_phrase(np(D,AN,PP,C,CON,NP2)) --> determiner(D), nominal(AN), prepositional_phrase(PP), clause(C), conjunction(CON), noun_phrase(NP2). 
noun_phrase(np(D,N,PP,C,CON,NP2)) --> determiner(D), noun(N), prepositional_phrase(PP), clause(C), conjunction(CON), noun_phrase(NP2).
noun_phrase(np(AN, PP,C,CON,NP2)) --> nominal(AN), prepositional_phrase(PP), clause(C),conjunction(CON), noun_phrase(NP2).
noun_phrase(np(N,PP,C,CON,NP2)) --> noun(N), prepositional_phrase(PP), clause(C), conjunction(CON), noun_phrase(NP2).
noun_phrase(np(D,AN,C,PP,CON,NP2)) --> determiner(D), nominal(AN), clause(C), prepositional_phrase(PP),conjunction(CON), noun_phrase(NP2). 
noun_phrase(np(D,N,C,PP,CON,NP2)) --> determiner(D), noun(N), clause(C), prepositional_phrase(PP), conjunction(CON), noun_phrase(NP2).
noun_phrase(np(AN, C,PP,CON,NP2)) --> nominal(AN), clause(C), prepositional_phrase(PP), conjunction(CON),noun_phrase(NP2).
noun_phrase(np(N,C,PP,CON,NP2)) --> noun(N), clause(C), prepositional_phrase(PP),conjunction(CON),noun_phrase(NP2).


%VERB PHRASES=======
verb_phrase(vp(V)) --> verb(V). %the boy cried
verb_phrase(vp(A, V)) --> adverb(A), verb(V). %the rose quickly withered
%noun phrase becomes the subject
verb_phrase(vp(V,NP)) --> verb(V), noun_phrase(NP). %...cried a river, ...blew a whistle
verb_phrase(vp(A, V, NP)) --> adverb(A), verb(V), noun_phrase(NP). %...quietly sang a lullaby
%verb that takes two subjects
verb_phrase(vp(V,NP,NP2)) --> verb(V), noun_phrase(NP), noun_phrase(NP2). %...gave the boy a book
verb_phrase(vp(A, V,NP,NP2)) --> adverb(A), verb(V), noun_phrase(NP), noun_phrase(NP2). %...happily gave the boy a book
%with prepositional phrases FOLLOWING VERB PHRASES 
verb_phrase(vp(V, PP)) --> verb(V), prepositional_phrase(PP). %...cried in the bathroom
verb_phrase(vp(A, V, PP)) --> adverb(A), verb(V), prepositional_phrase(PP). %...quickly withered in the dark
%repeat all with conjunction
verb_phrase(vp(V,C,VP2)) --> verb(V), conjunction(C), verb_phrase(VP2). %cried and laughed at the same time 
verb_phrase(vp(A, V, C, VP2)) --> adverb(A), verb(V), conjunction(C), verb_phrase(VP2).  %loudly sang and played in the rain 
verb_phrase(vp(V,NP,C,VP2)) --> verb(V), noun_phrase(NP), conjunction(C), verb_phrase(VP2). 
verb_phrase(vp(A, V, NP,C,VP2)) --> adverb(A), verb(V), noun_phrase(NP), conjunction(C), verb_phrase(VP2).
%...gave the boy a book and gave the girl flowers :: TWO SUBJECTS + CONJUNCTION ON VERB
verb_phrase(vp(V,NP,NP2,C,VP2)) --> verb(V), noun_phrase(NP), noun_phrase(NP2), conjunction(C), verb_phrase(VP2). 
%...happily gave the boy a book and laughed
verb_phrase(vp(A, V,NP,NP2,C,VP2)) --> adverb(A), verb(V), noun_phrase(NP), noun_phrase(NP2), conjunction(C), verb_phrase(VP2). 
verb_phrase(vp(V, PP, C, VP2)) --> verb(V), prepositional_phrase(PP), conjunction(C), verb_phrase(VP2).
verb_phrase(vp(A, V, PP,C,VP2)) --> adverb(A), verb(V), prepositional_phrase(PP), conjunction(C), verb_phrase(VP2).


%PREPOSITIONAL PHRASES=======
prepositional_phrase(pp(P, NP)) --> preposition(P), noun_phrase(NP).
clause(cl(RP, VP)) --> relative_pronoun(RP), verb_phrase(VP).

%NOMINALS
%1 or more adjectives then noun
nominal(nom(A, N)) --> adjective(A), noun(N).
nominal(nom(A, AN)) --> adjective(A), nominal(AN).  


%RELATIVE PRONOUNS
relative_pronoun(rp(who)) --> [who].
relative_pronoun(rp(which)) --> [which].
relative_pronoun(rp(that)) --> [that].

%CONJUNCTIONS
%coordinating conjunctions
conjunction(conj(while)) --> [while].
conjunction(conj(and)) --> [and].
conjunction(conj(or)) --> [or].
conjunction(conj(nor)) --> [nor].
conjunction(conj(yet)) --> [yet].
conjunction(conj(but)) --> [but].


%PREPOSITIONS
preposition(prep(for)) --> [for].
preposition(prep(from)) --> [from].
preposition(prep(at)) --> [at].
preposition(prep(to)) --> [to].
preposition(prep(on)) --> [on].
preposition(prep(in)) --> [in].
preposition(prep(behind)) --> [behind].
preposition(prep(after)) --> [after].


%DETERMINERS
%Articles
determiner(art(the)) --> [the].
determiner(art(a)) --> [a].
determiner(art(an)) --> [an].

%Quantifiers
determiner(quant(some)) --> [some].
determiner(quant(many)) --> [many].
determiner(quant(any)) --> [any].
determiner(quant(few)) --> [few].
determiner(quant(a,few)) --> [a,few].
determiner(quant(every)) --> [every].
determiner(quant(each)) --> [each].
determiner(quant(both)) --> [both].
determiner(quant(either)) --> [either].
determiner(quant(neither)) --> [neither].
%Possessive Determiners
determiner(poss_pronoun(my)) --> [my].
determiner(poss_pronoun(our)) --> [our].
determiner(poss_pronoun(its)) --> [its].
determiner(poss_pronoun(his)) --> [his].
determiner(poss_pronoun(her)) --> [her].
determiner(poss_pronoun(their)) --> [their].
%Numbers
determiner(num(one)) --> [one].
determiner(num(two)) --> [two].
determiner(num(three)) --> [three].


%ADVERBS
adverb(adv(quickly)) --> [quickly].
adverb(adv(secretly)) --> [secretly].
adverb(adv(quietly)) --> [quietly].
adverb(adv(smoothly)) --> [smoothly].
adverb(adv(heavily)) --> [heavily].
adverb(adv(subconsciously)) --> [subconsciously].
adverb(adv(easily)) --> [easily].
adverb(adv(happily)) --> [happily].
adverb(adv(honestly)) --> [honestly].
adverb(adv(intentionally)) --> [intentionally].
adverb(adv(suspisciously)) --> [suspisciously].


%ADJECTIVES
adjective(adj(young)) --> [young].
adjective(adj(old)) --> [old].
adjective(adj(big)) --> [big].
adjective(adj(small)) --> [small].
adjective(adj(large)) --> [large].
adjective(adj(huge)) --> [huge].
adjective(adj(empty)) --> [empty].
adjective(adj(full)) --> [full].
adjective(adj(poor)) --> [poor].
adjective(adj(rich)) --> [rich].
adjective(adj(white)) --> [white].
adjective(adj(black)) --> [black].
adjective(adj(same)) --> [same].
adjective(adj(red)) --> [red].
adjective(adj(green)) --> [green].
adjective(adj(brilliant)) --> [brilliant].
adjective(adj(smart)) --> [smart].
adjective(adj(talented)) --> [talented].
adjective(adj(gifted)) --> [gifted].
adjective(adj(quick)) --> [quick].
adjective(adj(slow)) --> [slow].
adjective(adj(bright)) --> [bright].
adjective(adg(smelly)) --> [smelly].
adjective(adg(fast)) --> [fast].


%VERBS
verb(v(was)) --> [was].
verb(v(were)) --> [were].
verb(v(ate)) --> [ate].
verb(v(ran)) --> [ran].
verb(v(slept)) --> [slept].
verb(v(bought)) --> [bought].
verb(v(worked)) --> [worked].
verb(v(pushed)) --> [pushed].
verb(v(stored)) --> [stored].
verb(v(gave)) --> [gave].
verb(v(watched)) --> [watched].
verb(v(admired)) --> [admired].
verb(v(appreciated)) --> [appreciated].
verb(v(climbed)) --> [climbed].
verb(v(lost)) --> [lost].
verb(v(sang)) --> [sang].
verb(v(blew)) --> [blew].

%NOUNS
noun(n(boy)) --> [boy].
noun(n(girl)) --> [girl].
noun(n(man)) --> [man].
noun(n(woman)) --> [woman].
noun(n(tree)) --> [tree].
noun(n(box)) --> [box].
noun(n(room)) --> [room].
noun(n(school)) --> [school].
noun(n(envelope)) --> [envelope].
noun(n(shed)) --> [shed].
noun(n(building)) --> [building].
noun(n(students)) --> [students].
noun(n(professors)) --> [professors].
noun(n(lecturers)) --> [lecturers].
noun(n(scientists)) --> [scientists].
noun(n(researchers)) --> [researchers].
noun(n(flowers)) --> [flowers].
noun(n(car)) --> [car].
noun(n(van)) --> [van].
noun(n(cat)) --> [cat].
noun(n(dog)) --> [dog].
noun(n(collar)) --> [collar].
noun(n(lullaby)) --> [lullaby].
noun(n(whistle)) --> [whistle].