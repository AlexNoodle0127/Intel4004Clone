Sup, Welcome to my readme to whoever is reading this. I am Alex Gomez, I am just a normal student at a community college rn doing IT
and planning on transferring to an ECE program. I was motivated to do this project a little over a week ago after trying to learn
some assembly and eventually ending up creating a basic shell in assembly. I thought that was an OS but I was wrong as techincally 
that is not what an OS is, and Operating System in a traditional sense is going from straight binary to being able to create logic 
and software to go behind that logic. I remember my professor Mr. Surratt saying that the shell I was creating and although I felt embarrased 
at that moment what he did I am forever grateful for. Instead of ending it at that, he gave me a subtle hint. You see in the classroom
I was in there is a poster on the left that has an NES diagram and aprt of that diagram is an ALU, he pointed to that and gave me a 
hint to learn about what an ALU is. You see I was diving into a little bit of VHDL before but after that I was driven and I wanted to
learn this ALU.

Hence why the first commit contains the ALU, while learning this alu by typing it 100 times from memory to truly internalize it.
I wanted to do more than the ALU and I started on a journey from late October to now (11/2/2025) to where I want to make the Intel 4004,
Intel 8008, 8088 and possibly not stopping at the i286 but going to the pentium. I want to internalize every part by typing 100+ times
of each module because this stuff fascinates me to a level my neurodivergent mind has never been to. You see I love gaming and when
this project literally is more intruiging than my love for gaming which has been with me since 2009 when I was 3 years old. That is saying something.

This is a project that covers the 4004 and also this repo in this README will explain my new idea for what a computer can be. You see
when I look at the modern computer I notice two things, one of them is the fact that we keep trying to shrink dyes in silicon to a point where
we are running to a standstill in the computer industry that we cannot ignore. When it gets to a point where we are limiting quantum limitations
in my mind I think that we need to rethink the computer. Because after hitting your head on the brick wall so many times expecting a different result,
you are going to get tired and not wanting to do it anymore. I think the main catalyst that other computing types (Quantum, Light, Symbolic) are being
researched in developed is because they realize my next point as well. Although Von Neumann is a once in human history spectacle that created the modern
computer as we know it, I think Von Neumann's theory for computing is up. 

So what do we do? Do we ditch all the software that was created for x86, ARM, and PowerPC? Well no because the fact is these new compute types
have a core issue, its hard to implement and its going to take a very long time before it happens. So before I even learned how to make an ALU I came
up with a vision, a vision to change computing from the fundamental level, to create a new meta-architecture. I know I sound like I am on crack saying
this I know, plus im 19 I doubt anyone will take this README seriously in the first place but here is the theory, its called Symbolic x86.


Symbolic x86:

There are Five main crucial parts of this meta-architecture that gives it its "magic"

SPU: The Symbolic Processing Unit

    Now you probably have heard of Symbolic Computing before, its all over AI but originally I just heard symbolic and thought it meant "meaning" based computing.
    so going into this I didn't even realize that Symbolic Computing was apart of how AIs are trained and made. But the SPU has two main jobs as of rn.
    the first is to keep track if an SID (Program IDs essentially) are enabled by the SysMan and the SysMan essentially tells it to run this certain SID.
    You see I want SIDs to be programs that users and technicians can write to to do certain core things that is important for a low level standpoint. 
    especially when it comes to Cybersecurity, there are also Default SIDs that I plan on making to do core functions, one of them is called the Binary Handler.
    You see why I call this a meta-architecture is because you can plug different architectures, compute models, and anything in between into this because of a part called the SMB, and the SPU whenever given data from SMB and given instructions from the SysMan will execute and proces the data faster than the BPU can
    and then send it back to the SMB in which then the SMB wil give the completed code. Reason I have it set up like this is because I plan on making the BPU smaller than usual to limit thermals and power draw. The SPU will help execute complex parts of Binary Oses and the BPU will be a layer that allows the Binary OS to run.

SMB: The Smart Memory Bridge

    This is the bread and butter of this whole process because this has two crucial functions that makes this meta-architecture work in a theory standpoint.
    The first function of the SMB is to convert Binary to Symbolic or to any other compute type that can be imported in the future. Think of SMB like an airport hub, pedestrians get off the plane and wait for their next flight and when they do that they can stop to get a drink (L1 Cache), maybe a snack (L2 Cache), or maybe a full fledged meal (L3 Cache) and also they have a plane ticket, with a seat number (Register), a destination (The place its going) and an airline (the operation its given). The Smart memory bridge converts data and is a "bridge" in a literal sense as everything passes through here and you can't get to the other side without passing through this bridge. 

BPU: The Binary Processing Unit

    This is pretty standard as I think anyone that is reading this will probably know what this is if not I will clear it up. In classical computing (modern day computing). Other than in R&D fields Binary is still used and its in every processor that is available to the public, anything computer related in the modern world will probably have Binary in it. Think of a phone with an architecture of ARM. Because that is a binary processor, same with x86 and PowerPC (guys remember the Cell prcessor on a PS3? Yeah that was a treat and it was ran on this). But there is one very fundamental thing that is different from this BPU. This is a modular BPU meaning that whenever SysMan detects an OS loaded that is differnt from x86, It will check to see if it has a plugin to run it that is stored on the OMS and if SysMan found it (lets say PowerPC) It will then insert it into the BPU. The BPU is a modular plug-n-play architecture essentially.

SysMan:
    I already talked about SysMan alot and its probably one of my favorite ideas that I came up in my head. You see I remember last week in the office chair at my job I was biting my nail leaning back thinking of a way to really make this architecture "click" and I came up with it. I imagined in my head in  a high clarity + motion of a user, expierencing a constant BSOD on their machine, now usually they say "screw it" and either go to a repair shop, throw it way, or they actualy know how to fix it but its never fun. But what if even when the OS fails, what if there was a way where you can press a certain amount of keys at the same time and a shell comes up labled SysMan, I imagined this in my head and realized right away that this was the missing key. Because not only this allows for users to check logs SysMan dumps into the OMS but SysMan also can be directed to run certain programs stored in either the SIDs or the OMS. Think of SysMan like the shell to a hardware based OS and the OMS being the permanent storage where every program, plugin and logs are kept. Becuase I want users to be able to learn their machines and to make programs for their machines and maybe one day make it possible to run retro consoles based on different architectures natively. That is what SysMan is, I also want SysMan to be a hardware level supervisor like how the PS3s SysCon was. 

OMS: The Operating System Manager
    This is the permanent storage for the CPU, there is a small amount on the dye itself and then if motherboard manufacturers add the feature, maybe eventually on the motherboard, or maybe someone can create an SID or plugin where the SysMan will use a hard-drive connected for it, there is a lot of possibilites here. But this stores all the permanent memory, the different architectures and maybe even older consoles at a hardware native level.

As you can see this is what I want for the Post-Von Neumann era to represent. Modularity, Adaptability, and most importantly, User-Friendly. I want people to feel liek they own their systems again and this is by far the best way for it. I want computers to be better, I want them to be secure I am willing to study 80 hours a damn week if I have to make sure this idea gets to the right person. I have the blueprint and now I want a team to help me make this a reality, I wanna learn everything about the computer I am tired of hearing the "What" this does, I wanna know "Why" this works and "How" it works. Its why I went on a journey exploring 
everything about the compmuter from Python to VHDL because I am curious, and I want everyone else to be curious and have a passion to learn the whole stack of
Computing. It may just be me that has this "fixation" with computers but I want the right mentor I want someone to help me learn everything there is so I can 
make this project a reality. 

I don't just want a job or degree, I want to improve computers anyway I damn can. I also want to eventually make a Youtube Channel teaching the full stack of the computing process.
I wnt to encourage other peers to think outside the box, I want to teach more people about VHDL because it seems like no one knows it other than ECE majors. I talk to my friend and mention VHDL and they have no idea what it is and it sucks. I feel like that is the reason why we are in a shortage of system-architects and chip designers globally.
Not because its just hard its because it seems like no-one has heard of it in my age group. There is alot of smart programmers out there that are more than capable of learning it and now there is an imbalance between IT, CS, and ECE that I think is preventing growth in the industry. 

But anyways thats the end of my rant, now to do night audit at my job here as a Hotel Front Desk Attendant. 
