-> trial

VAR present_item = "attorney's badge"
VAR window = false
VAR rockly = false

=== inventory (-> back) ===
A list of evidence relating to the case:
+ attorney's badge[]:
    My attorney's badge! I wear it with pride.
    ++ [choose]
        ~ present_item = "box cutter"
        -> back
    ++ [back]
        -> inventory (back)
+ pet rock[]:
    A googley-eyed pet rock found at the scene of the crime. It is a dark grey color and is shaped like an oval. Covered in the victim's blood and the defendant's fingerprints.
    ++ [choose]
        ~ present_item = "pet rock"
        -> back
    ++ [back]
        -> inventory(back)
+ {window} rear window[]:
    The rear window of the murder scene was open when the police arrived.
    ++ [choose]
        ~ present_item = "rear window"
        -> back
    ++ [back]
        -> inventory(back)
+ [return]
    -> back
    
=== instructions ===
How to cross examine:
1. Navigate through the witness statements with the "prev" and "next" options.
2. Use the "evidence" button to open the list of evidence related to the case. When in the "evidence" menu, choose the piece of evidence to learn more about it.
3. Carefully search the witness statements for information that contradicits the evidence. Use the "press" button to ask the witness for more information.
4. When you've found a contradicting piece of evidence, inspect that piece of evidence in the evidence menu, and use the "choose" button to select it.
5. Then use the "present X" button on the statement you wish to condratict to progress the story.
* [Got It!]
-> t1

=== trial ===
BEGIN TRIAL:
* [Continue]
- Judge: Court is now in session for the trial of Mr. Paul Pittens.

Edgelord: The prosecution is ready, your honor.

* [Ready!]
- Wright: The defense is ready as well, your honor.

Judge: Very well. Mr. Edgelord, your opening statement, please.

Edgelord: Through the evidence presented at this trial, the prosecution will show without a shadow of a doubt that at 5:30 PM, on June 1st, Isabelle Mardered was murdered by her boyfriend Paul Pittens.

Judge: Very well. Let us move on to the testimony. The prosecution may call its first witness.

Edgelord: For my first witness, I would like to call to the stand Detective Jack Jensey, the detective in charge of the crime scene investigation.

* [continue]
    -> jensey

=== jensey ===
    Jensey: Hello!
    * [continue]
    - -> instructions

=== t1 ===
BEGIN CROSS EXAMINATION:
+ [Continue]
    -> s1
= s1
    Jensey: When we arrived at the scene, Paul was alone in the house. (1/4)
    + [press]
        Wright: Was there anything unusual about the scene of the crime?
        
        Jensey: Well, there were rocks everywhere.
        
        Wright: Yes, she was a rock collector.
        
        Judge: Rock collecting? Why would anyone have any reason to do that? Is this some newfangled fad that I'm too old to understand?
        
        Edgelord: Rocks can be valued and collected for a number of reasons. Be it rarity, luster, texture, or one of many other desirable qualities.
        
        Judge: Oh? I wonder if any of the rocks in my yard are worth anything...
        
        Wright: I wouldn't think so Your Honor.
        
        Judge: Ah that's a shame. I have so many, for a moment I though I stood to make a fortune!
        
        Wright: Getting back on track, Detective, besides the rocks, was there anything unusual about the room?
        
        Jensey: Besides the rocks? The rear window leading to the back yard was open, but that's about it.
        
        (Hm, that could be important, I should make a note of that.)
        
        ~ window = true
        "Rear window" added to evidence.
        ++ [continue]
            -> s2
    + [present {present_item}]
        -> present_incorrect
    + [evidence]
        -> inventory(-> s1)
    + [next]
        -> s2
= s2
    Jensey: There was a bloody rock with googley eyes on the table. (2/4)
    + [press]
        Wright: Tell me more about this rock.
        
        Jensey: The blood on the rock was determined to belong to the victim, and a fingerprint analysis revealed prints belonging to the victim on the rock.
        
        (Urk! Not good!)
        
        Jensey: Further, when questioned, the defendant identified the rock as belonging to him.
        
        (Urk! Double not good!)
        ++ [continue]
            -> s3
    + [present {present_item}]
        -> present_incorrect
    + [evidence]
        -> inventory(-> s2)
    + [prev]
        -> s1
    + [next]
    - -> s3
= s3
    Jensey: We arrested Paul because he was the only one who could have done it, since there was no-one else in the house, and the front entrance was the only way out. (3/4)
    + [press]
        Wright: Was was the scope and methods of your investigation?
        
        Jensey: After we arrested Paul, we searched the house and surrounding area. Lowkey ran out of ideas after that.
        
        Wright: But you thoroughly searched the house, and found nobody else?
        
        Jensey: Correctamundo!
        ++ [continue]
            -> s4
    + [present {present_item} ]
        { present_item == "rear window":
            -> rear_window
        - else:
            -> present_incorrect
        }
    + [evidence]
        -> inventory(-> s3)
    + [prev]
        -> s2
    + [next]
        -> s4

= s4
    Jensey: He got caught red-handed! Bruh moment! (4/4)
    + [press]
        Wright: Bruh moment?
        
        Jensey: Yeah.
        
        ++ [What is that?]
            Wright: What is a "Bruh Moment?"
        
            Jensey: You know, like when something happens that makes you say: "Bruh!"
        
            Wright: Oh, um, I see.
            
            (I don't really get it, but if I don't find a contradiction soon I'm gonna find myself in a huge "bruh" moment!)
        
        ++ [Your life is one big bruh moment]
        
        Wright: Your life is one big bruh moment.
        
        Jensey: Not cool bruh!
        
        -- 
        ++ [continue]
            -> s1
    + [evidence]
        -> inventory(-> s4)
    + [present {present_item}]
        -> present_incorrect
    + [prev]
        -> s3
= present_incorrect
    + [OBJECTION!]
    - Wright: OBJECTION!
    
    Wright: This piece of evidence exposes a condratiction in the witness testimony!
    
    Judge: ?

    Edgelord: And how does that show a contradiction?
    
    Judge: Hm, yes I don't see it either.
    
    + [Oops!]
    - Wright: Sorry Your Honor, I really thought I had something there.
    
    Edgelord: I advise you think more carefully before the next time you open your mouth.
    
    (Better review the evidence if I want to find the inconsistency in this guy's testimony...)
    
    + [continue]
        -> s1
    
=== rear_window ===
+ OBJECTION!
- Wright: You state that you arrested Paul because he was the only one in the house, and the front entrance was the only way out, is that correct?

Jensey: Too true. The front entrace was being watched by a witness the whole time, so we know nobody went through it. Ergo my man, Paul is the only one who could have done the murder.

Wright: There is a contradiciton in your assertion.

Jensey: Oh really?

Wright: You say that the front entrance was the only way out, however, the rear window of the kitchen was open when the police arrived! The front entrance was not the only way out at the time of the murder!

Judge: Oh, you're right!

Wright: Paul is not the only person who could have been in the building, since the real killer could have left through the window!

Edgelord: The killer jumping through the window? Ridiculous. The window was only open so that the departed Ms. Mardered could get some fresh air. There is no proof that anyone went through that window!

Wright: Still, this opens the possiblity of a third party!

Edgelord: Third party or not, this doesn't change the fact that the murder weapon belonged to the defendant, and bears his prints. Thank you Detective, that will be all for now.

Jensey: No problem Mr. Edgelord.

Edgelord: For my next witness, I summon the defendant, Paul Pittens to the stand.

(I made some progress, but I'm not out of the woods yet. Lets see what Paul has to say on the stand.)

+ [continue]
- -> paul

=== paul ===
Paul: Hello everyone. I'm Paul. :(

Edgelord: Mr. Pittens, you were the boyfriend of the victim in this case, is that correct?

Paul: That is correct. :(

Judge: A crime of passion? Oh how the heart can move a man to violence!

Edgelord: Mr. Pittens, would you mind telling us about the pet rock found at the crime scene, and you relationship with said rock?

Paul: If I have to...
+ [continue]
- -> t2

VAR photo = false
// Paul Pittens
=== t2 ===
BEGIN CROSS EXAMINATION:
+ [continue]
- -> s1

=s1
Pittens: Rockly is my pet rock. Izzy gave him to me. :( (1/3)
+ [press]
    Wright: How long have you had Rockly?
    
    Pittens: Almost a year now. Izzy loved it when I carried it around with me.
    
    Wright: Is that so?
    
    Pittens: It is. I have an "adoption photo" Izzy took when she first gave me Rockly, if you'd like to see.
    
    Wright: Sure.
    ~ photo = true
    ++ [continue]
+ [present {present_item}]
    -> present_incorrect
+ [evidence]
    -> inventory(-> s1)
+ [next]
-
    { 
    - photo:
        -> s1_5
    - else:
        -> s2
    }
=s1_5
Pittens: Here is a photo of Rockly.
Pittens shows a picture of a light-gray googley-eyed rock that is shaped like a sphere. (1.5/3)
+ [press]
    Wright: Cute.
    
    Pittens: You think?
    ++ [continue]
    -- -> s2
+ [present {present_item} ]
    { present_item == "pet rock":
        -> wrong_rock
    - else:
        -> present_incorrect
    }
+ [evidence]
    -> inventory(-> s1_5)
+ [prev]
    -> s1
+ [next]
    -> s2

=s2
Pittens: Somehow, when I entered her house, Rockly was sitting bloody on the table next to her head! (2/3)
+ [press]
    Unfinished
    ++ [continue]
    -- -> s3
+ [present {present_item}]
    -> present_incorrect
+ [evidence]
    -> inventory(-> s2)
+ [prev]
    { 
    - photo:
        -> s1_5
    - else:
        -> s1
    }
+ [next]
    -> s3
=s3
Pittens: We weren't perfect, but I didn't kill her, I swear! (3/3)
+ [press]
    Wright: Why do you say that you two weren't perfect?
    
    Pittens: Well all she wanted to talk about was rocks. Made me watch geology programs on the TV, go geode hunting, and she made me go to all the rock collecting meet-ups she attended.
    
    Wright: If her obsession with rocks bothers you so much, why did you carry that pet rock with you everywhere?
    
    Pittens: Because she gave it to me, and I loved her. :(
    
    -> s1
+ [present {present_item}]
    -> present_incorrect
+ [evidence]
    -> inventory(-> s3)
+ [prev]
    -> s2
= present_incorrect
    + [OBJECTION!]
    - Wright: OBJECTION!
    
    Wright: This piece of evidence exposes a condratiction in the witness testimony!
    
    Judge: ?

    Edgelord: And how does that show a contradiction?
    
    Judge: Hm, yes I don't see it either.
    
    + [Oops!]
    - Wright: Sorry Your Honor, I really thought I had something there.
    
    Edgelord: I advise you think more carefully before the next time you open your mouth.
    
    (Better review the evidence if I want to find the inconsistency in this guy's testimony...)
    
    + [continue]
        -> s1
    
=== wrong_rock ===
That's all I had time for.

Hope you enjoyed!
-> END
+ [continue]
- -> linda

=== linda ===
Glasshouse: i kill watch da door!
+ [continue]
- ->t3

// Linda Glasshouse (What she saw)
=== t3 ===
BEGIN CROSS EXAMINATION:
+ continue
- -> s1


=s1
-> t4
// Linda Glasshouse (The real killer was you!)
=== t4 ===
BEGIN CROSS EXAMINATION:
+ continue
- -> s1
=s1
Glasshouse: You say I did it? Where's the evidence?
-> s2
=s2
Glasshouse: 
-> END

=== breakdown ===
Glasshouse: You can't do this to me! DON'T YOU KNOW HOW MUCH I'VE SACRIFICED?!

Glasshouse collapses into a heap

-> verdict

=== verdict ===
Judge: Well I believe there is nothing left to do but to pass down the verdict.

Judge: In the trial of Paul Pittans, I find the defendant:
+ [continue]
- -> end

=== end ===
NOT GUILTY
-> END




