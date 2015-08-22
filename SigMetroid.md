# sig.metroid: Metrical centroid and strength #

Provides two description derived from the metrical analysis carried out using `sig.metre`, with a further selection of primary metrical levels.

  1. **Dynamic metrical centroid**: an assessment of metrical activity that is based on the computation of the centroid of the selected metrical levels. The resulting metrical centroid curve indicates the temporal evolution of the metrical activity expressed in BPM, so that the values can be compared with the tempo values also in BPM. High BPM values for the metrical centroid indicate that more elementary metrical levels (i.e., very fast levels corresponding to very fast rhythmical values) predominate. Low BPM values indicate on the contrary that higher metrical levels (i.e., slow pulsations corresponding to whole notes, bars, etc.) predominate. If one particular level is particularly dominant, the value of the metrical centroid naturally approaches the corresponding tempo value on that particular level.<p>
<ol><li><b>Dynamic metrical strength</b>: indicates whether there is a clear and strong pulsation, or even a strong metrical hierarchy, or whether on in the other hand the pulsation is somewhat hidden, unclear, or there is a complex mixture of pulsations. Instead of simply identifying beat strength with the autocorrelation score of that main metrical level, we sum the autocorrelation scores of the selected metrical levels. The metrical strength is increased by any increase of autocorrelation score at any dominant level, or if new dominant levels are added to the selection. Whereas the autocorrelation score is a value lower than 1, the metrical strength can exceed 1.</li></ol>

When <code>sig.metroid</code> is used for academic research, please cite the following publication:<br>
<br>
<table><thead><th>Lartillot, O., Cereghetti, D., Eliard, K., Trost, W. J., Rappaz, M.-A., Grandjean, D., "Estimating tempo and metrical features by tracking the whole metrical hierarchy", 3rd International Conference on Music & Emotion, Jyväskylä, 2013.</th></thead><tbody></tbody></table>

<br>
<h2>Flowchart Interconnections</h2>

<code>sig.metroid</code> accepts as input data type either:<br>
<ul><li><code>sig.metre</code> objects,<p>
</li><li><code>sig.autocor</code> objects,<p>
</li><li>onset detection curve (resulting from <code>sig.onsets</code>), frame-decomposed or not, channel-decomposed or not,<p>
</li><li>and all the input data accepted by <code>sig.onsets</code>.<p></li></ul>

<br>
<h2>Options</h2>

For each frame, the dominant metrical levels are selected and the centroid of their periodicity (in seconds) is computed, using as weights the amount of autocorrelation score at that specific level that exceeds the autocorrelation score of the underlying metrical sub-levels. In this way, any sudden change in the number of selected metrical levels from one time frame to the successive one does not lead to abrupt changes in the metrical centroid curve.<br>
<br>
<ul><li><code>sig.metroid(…,'Gate')</code> uses a simpler method, where the weights are simply identified to the corresponding autocorrelation scores, leading to possible abrupt changes in the metrical centroid curve.</li></ul>

If several metrical hierarchies are detected in parallel, separate metrical centroid and strength curves for each individual metrical hierarchy. The multiple metrical centroid and strength curves are then combined into one metrical centroid curve and one metrical strength curve. The combined metrical centroid curve is the weighted average of the metrical centroid curves of the separate metrical hierarchies, using the metrical strengths as weights. The combined metrical strength is the summation of the metrical strength curves of the separate metrical hierarchies.<br>
<br>
<ul><li><code>sig.metroid(…,'Combine',0)</code> does not perform the combination of the metrical centroid and strength curves, displaying therefore as many curves as metrical hierarchies detected.