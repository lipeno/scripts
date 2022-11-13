import copy
 
""" 
	Implementation of Gale Shapley (stable maching) algorithm
	This is a special case of algorithm called mcvitie-wilson, where men propose one at a time.
	Here men propose first so the algorithm is male-optimal.
	v1
	26.4.2012.
"""
 
manPreferenceList = {
 'A':  ['a', 'b', 'd', 'c', 'e'],
 'B':  ['d', 'a', 'e', 'c', 'b'],
 'C':  ['a', 'c', 'e', 'b', 'd'],
 'D':  ['d', 'c', 'a', 'b', 'e'],
 'E':   ['a', 'e', 'c', 'b', 'd']
 }
womanPreferenceList = {
 'a':  ['D', 'A', 'B', 'E', 'C'],
 'b':  ['B', 'D', 'E', 'C', 'A'],
 'c': ['A', 'E', 'D', 'C', 'B'],
 'd':  ['D', 'B', 'C', 'E', 'A'],
 'e':  ['A', 'B', 'E', 'C', 'D']
 }
 
men = sorted(manPreferenceList.keys())
women = sorted(womanPreferenceList.keys())

def matchmaker():
    manfree = men[:]
    engaged  = {}
    manPreferenceList2 = copy.deepcopy(manPreferenceList)
    womanPreferenceList2 = copy.deepcopy(womanPreferenceList)
    while manfree:
        man = manfree.pop(0)
        manLikes = manPreferenceList2[man]
        currentTargetWoman = manLikes.pop(0)
		# Check if she's already engaged
        fiance = engaged.get(currentTargetWoman)
        if not fiance:
            # She's free
            engaged[currentTargetWoman] = man
            print("  %s and %s" % (man, currentTargetWoman))
        else:
            # If he proposes to an engaged woman
            womanLikes = womanPreferenceList2[currentTargetWoman]
            if womanLikes.index(fiance) > womanLikes.index(man):
                # She prefers new guy
                engaged[currentTargetWoman] = man
                print("  %s dumped %s for %s" % (currentTargetWoman, fiance, man))
                if manPreferenceList2[fiance]:
                    manfree.append(fiance)
            else:
                # She is faithful to old fiance
                if manLikes:
                    manfree.append(man)
    return engaged

	
def check(engaged):
    inverseengaged = dict((v,k) for k,v in engaged.items())
    for she, he in engaged.items():
        shelikes = womanPreferenceList[she]
        shelikesbetter = shelikes[:shelikes.index(he)]
        helikes = manPreferenceList[he]
        helikesbetter = helikes[:helikes.index(she)]
        for man in shelikesbetter:
            mansgirl = inverseengaged[man]
            manlikes = manPreferenceList[man]
            if manlikes.index(mansgirl) > manlikes.index(she):
                print("%s and %s like each other better than "
                      "their present partners: %s and %s."
                      % (she, man, he, mansgirl))
                return False
        for woman in helikesbetter:
            womansguy = engaged[woman]
            womanlikes = womanPreferenceList[woman]
            if womanlikes.index(womansguy) > womanlikes.index(he):
                print("%s and %s like each other better than "
                      "their present partners: %s and %s."
                      % (he, woman, she, womansguy))
                return False
    return True
	
def stabilityCheck():
	print('\nEngagement stability check: ')
	if check(engaged): 
		print('->PASSED. The matching is stable.')
	else:
		print('->FAILED. This matching is not stable.')
    
# below is the main program code
print('\nListing of engagements/proposals:')
print('(If a women is engaged she will pick a more preffered man.)')
engaged = matchmaker()
 
print('\nCouples after matching:')
print('(A stable matching is an arrangment of marriages with no blocking pairs. For any number of man and women no matter how they rank each other there will always be at least one stable maching.)')
print('  ' + ',\n  '.join('%s is engaged to %s' % couple
                          for couple in sorted(engaged.items())))
stabilityCheck()
 
print('\n\nSwapping two fiances to to show a case when there is a mistake in stable matching')
engaged[women[0]], engaged[women[1]] = engaged[women[1]], engaged[women[0]]
for gal in women[:2]:
    print('  %s is now engaged to %s' % (gal, engaged[gal]))
stabilityCheck()