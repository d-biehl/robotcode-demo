language: de
*** Variablen ***
${AKTUELLER_TAG}
${ANTWORT}

*** Testfälle ***
Scenario: Das Gerät kennt den aktuellen Tag
    Angenommen Es ist Freitag
    Wenn ich Alexa frage ob heute Freitag ist
    Dann Sagt es: Nein

Einfaches Fehlgeschlagenes Scenario
    Angenommen Es ist Montag
    Wenn ich das Gerät frage ob heute Freitag ist
    Dann Sagt es: Ja

*** Schlüsselwörter ***
Es ist ${Tag}
    Set Test Variable    ${AKTUELLER_TAG}    ${Tag}

Ich ${Gerät} frage ob heute ${Tag} ist
    IF    $AKTUELLER_TAG==$Tag
        Set Test Variable    $ANTWORT    Ja
    ELSE
        Set Test Variable    $ANTWORT    Nein
    END

Sagt es: ${erwartete_antwort}
    Should Be Equal    ${ANTWORT}    ${erwartete_antwort}
