# sig.sum: Summation of filterbank channels #

Once an audio waveform is decomposed into channels using a filterbank:
```
f=aud.filterbank(a)
```

![https://miningsuite.googlecode.com/svn/wiki/SigSum_ex1.png](https://miningsuite.googlecode.com/svn/wiki/SigSum_ex1.png)

An envelope extraction, for instance, can be computed using this very simple syntax:
```
e=sig.envelope(f)
```

![https://miningsuite.googlecode.com/svn/wiki/SigSum_ex2.png](https://miningsuite.googlecode.com/svn/wiki/SigSum_ex2.png)

Then the channels can be summed back using the `sig.sum` command:
```
s=sig.sum(e)
```

![https://miningsuite.googlecode.com/svn/wiki/SigSum_ex3.png](https://miningsuite.googlecode.com/svn/wiki/SigSum_ex3.png)

The summation can be divided by the number of channels using the command:
```
s=sig.sum(…,'Mean')
```

<br>
<h2>Summary of filterbank channels</h2>

If we compute for instance an autocorrelation from the envelopes:<br>
<pre><code>ac=sig.autocor(e)<br>
</code></pre>

<img src='https://miningsuite.googlecode.com/svn/wiki/SigSum_ex4.png' />

Then we can sum all the autocorrelation using exactly the same <code>sig.sum</code> command:<br>
<pre><code>s=sig.sum(e)<br>
</code></pre>

<img src='https://miningsuite.googlecode.com/svn/wiki/SigSum_ex5.png' />

This summation of non-temporal signals across channels is usually called <i>summary</i>.