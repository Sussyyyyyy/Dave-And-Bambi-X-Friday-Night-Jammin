local defaultNotePos = {};
local spin = true;
local arrowMoveX = 0;
local arrowMoveY = 0;
function onSongStart()
    for i = 0,7 do
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x,y})
      --  debugPrint("{" .. x .. "," .. y .. "}" .. " i:".. i)
    end
end

function onUpdate(elapsed)
    songPos = getPropertyFromClass('Conductor',  'songPosition');

    currentBeat = (songPos / 1000) * (bpm / 60)

    if  spin == true then
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1] + arrowMoveX * math.sin((currentBeat + i*1) * math.pi))

            setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2] + arrowMoveY * math.cos((currentBeat + i*1) * math.pi))
        end
    end
end

function onEvent(name,value1,value2)
	if name == 'REALLY shakey arrows' then 
        arrowMoveX = value1
        arrowMoveY = value2
    end
end
