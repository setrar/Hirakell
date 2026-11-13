# what is Hudak thoughts about math and music

**Paul Hudak** (1952–2015), a founding father of the Haskell programming language and a former Yale Computer Science professor, viewed mathematics, computer science, and music not as separate disciplines, but as **three different languages describing the exact same underlying structures.**

His vision culminated in his landmark book and software framework, *The Haskell School of Music*, as well as the creation of **Euterpea**—the very library powering your flute program.

---

### 1. Music as "Applied Algebra"

Hudak treated musical scores not as flat event logs or linear audio files, but as **algebraic data structures**. In Euterpea, he modeled music using a recursive algebraic type:

* **Primitives:** Notes (`Note dur pitch`) and Rest (`Rest dur`).
* **Sequential Composition (`:+:`):** Playing music linearly in time (horizontal structure).
* **Parallel Composition (`:=:`):** Playing music simultaneously (vertical structure/harmony).

To Hudak, musical composition was equivalent to writing mathematical expressions. Just as standard algebra obeys rules like commutativity or associativity, he demonstrated that operations on music can be formally transformed, inverted, and reasoned about using algebraic laws.

---

### 2. Functional Reactive Programming (FRP) & Time

Together with Conal Elliott, Hudak invented **Functional Reactive Programming (FRP)**. When applied to music (such as audio processing and signal functions like `AudSF`), Hudak viewed time as a continuous mathematical dimension rather than discrete hardware steps.

He argued that sound synthesis and music performance are continuous mathematical transformations over time:


$$\text{Signal } a = \text{Time} \rightarrow a$$

This allowed audio processing elements—like delay lines, physical flute models, and envelopes—to be composed declaratively as pure mathematical arrows without worrying about state mutation or low-level sample buffers.

---

### 3. "Denoational Semantics" of Music

Hudak championed the idea of **Denotational Semantics** in computer science—meaning every line of code should map directly to a clear, abstract mathematical concept. He extended this concept directly to music:

* **Abstract Syntax:** The musical score written on paper or in code (`Music Pitch`).
* **Semantic Domain:** The actual performance or acoustic wave in physical reality.

He believed that computer science provided the perfect bridge to formalize the implicit mathematical rules of music theory (like pitch classes, intervals, and rhythmic transformations) into explicit, verifiable code.

---

### 4. Computer Science as an Expression Tool, Not Just a Calculator

Unlike engineers who used computers purely to sequence MIDI files or process DSP algorithms efficiently, Hudak viewed the computer as an **intellectual partner for musical exploration**.

He believed that by formalizing music into clean, functional mathematical abstractions, composers could invent entirely new ways to construct generative, algorithmic, and interactive music that would be impossible to reason about using traditional notation alone.
