# encoding: utf-8
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/slugify'

class SlugifyTest < Test::Unit::TestCase

    def test_slugify
        assert_nothing_raised do
            assert_equal 'dummy', Slugify.convert('dummy')
        end

        assert_equal 'abcdefghijklmno', Slugify.convert('@ABCDEFGHIJKLMNO')
        assert_equal 'pqrstuvwxyz---', Slugify.convert('PQRSTUVWXYZ[\]^_')
        assert_equal '-', Slugify.convert('[')
        assert_equal '', Slugify.convert('\\')
        assert_equal '-', Slugify.convert(']')
        assert_equal '', Slugify.convert('^')
        assert_equal '-', Slugify.convert('_')
        assert_equal 'abcdefghijklmno', Slugify.convert('`abcdefghijklmno')
        assert_equal 'pqrstuvwxyz---', Slugify.convert('pqrstuvwxyz{|}~')
        assert_equal '-', Slugify.convert('{')
        assert_equal '', Slugify.convert('|')
        assert_equal '-', Slugify.convert('}')
        assert_equal '-', Slugify.convert('~')
        assert_equal 'aaaaaaaeceeeeiiii', Slugify.convert('ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏ')
        assert_equal 'dnoooooxouuuuythb', Slugify.convert('ÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß')
        assert_equal 'aaaaaaaeceeeeiiii', Slugify.convert('àáâãäåæçèéêëìíîï')
        assert_equal 'onoooooouuuuythy', Slugify.convert('ðñòóôõö÷øùúûüýþÿ')
        assert_equal 'aaaaaaccccccccdd', Slugify.convert('ĀāĂăĄąĆćĈĉĊċČčĎď')
        assert_equal 'ddeeeeeeeeeegggg', Slugify.convert('ĐđĒēĔĕĖėĘęĚěĜĝĞğ')
        assert_equal 'gggghhhhiiiiiiii', Slugify.convert('ĠġĢģĤĥĦħĨĩĪīĬĭĮį')
        assert_equal 'llijijjjkkklllllll', Slugify.convert('İıĲĳĴĵĶķĸĹĺĻļĽľĿ')
        assert_equal 'lllnnnnnnnnnoooo', Slugify.convert('ŀŁłŃńŅņŇňŉŊŋŌōŎŏ')
        assert_equal 'oooeoerrrrrrssssss', Slugify.convert('ŐőŒœŔŕŖŗŘřŚśŜŝŞş')
        assert_equal 'ssttttttuuuuuuuu', Slugify.convert('ŠšŢţŤťŦŧŨũŪūŬŭŮů')
        assert_equal 'uuuuwwyyyzzzzzzs', Slugify.convert('ŰűŲųŴŵŶŷŸŹźŻżŽžſ')
        assert_equal 'bbbbccddndnd', Slugify.convert('ƀƁƂƃƄƅƆƇƈƉƊƋƌƍƎƏ')
        assert_equal '', Slugify.convert('ƂƃƆƍƎƏ')
        assert_equal 'effgiikkwnno', Slugify.convert('ƐƑƒƓƔƕƖƗƘƙƚƛƜƝƞƟ')
        assert_equal '', Slugify.convert('Ɣƕƚƛ')
        assert_equal 'oopprsssttttttu', Slugify.convert('ƠơƢƣƤƥƦƧƨƩƪƫƬƭƫƮƯ')
        assert_equal '', Slugify.convert('Ƣƣ')
        assert_equal 'uuuzzzqq', Slugify.convert('ưƱƲƳƴƵƶƷƸƹƺƻƼƽƾƿ')
        assert_equal '', Slugify.convert('ƳƴƸƹƺƻƾƿ')
        assert_equal 'dzdzdzljljljnjnjnjaai', Slugify.convert('ǀǁǂǃǄǅǆǇǈǉǊǋǌǍǎǏ')
        assert_equal '', Slugify.convert('ǀǁǂǃ')
        assert_equal 'ioouuuuuuuuuueaa', Slugify.convert('ǐǑǒǓǔǕǖǗǘǙǚǛǜǝǞǟ')
        assert_equal 'aaaeaeggggkkoooo', Slugify.convert('ǠǡǢǣǤǥǦǧǨǩǪǫǬǭǮǯ')
        assert_equal '', Slugify.convert('ǮǯǶǷȜȝȡȢȣȴȵȶ')
        assert_equal 'jdzdzdzggnnaaaeaeoo', Slugify.convert('ǰǱǲǳǴǵǶǷǸǹǺǻǼǽǾǿ')
        assert_equal 'aaaaeeeeiiiioooo', Slugify.convert('ȀȁȂȃȄȅȆȇȈȉȊȋȌȍȎȏ')
        assert_equal 'rrrruuuusstthh', Slugify.convert('ȐȑȒȓȔȕȖȗȘșȚțȜȝȞȟ')
        assert_equal 'nzzaaeeoooooo', Slugify.convert('ȠȡȢȣȤȥȦȧȨȩȪȫȬȭȮȯ')
        assert_equal 'ooyyjdbqpacclls', Slugify.convert('ȰȱȲȳȴȵȶȷȸȹȺȻȼȽȾȿ')
        assert_equal 'zbuveejjqqrryy', Slugify.convert('ɀɁɂɃɄɅɆɇɈɉɊɋɌɍɎɏ')
        assert_equal '', Slugify.convert('Ɂɂɒɓɔɕɖɘəɚɛɜɝɞɟɣɤɥɦɧɪɫɬɭɮ')
        assert_equal 'ad', Slugify.convert('ɐɑɒɓɔɕɖɗɘəɚɛɜɝɞɟ')
        assert_equal 'gggw', Slugify.convert('ɠɡɢɣɤɥɦɧɨɩɪɫɬɭɮɯ')
        assert_equal 'mooe', Slugify.convert('ɰɱɲɳɴɵɶɷɸɹɺɻɼɽɾɿ')
        assert_equal '', Slugify.convert('ɰɳɴɷɸɹɺɻɼɽɾɿᴈ')
        assert_equal 'aaeaebcddejklmno', Slugify.convert('ᴀᴁᴂᴃᴄᴅᴆᴇᴈᴉᴊᴋᴌᴍᴎᴏ')
        assert_equal 'aabbbbbbccdddddd', Slugify.convert('ḀḁḂḃḄḅḆḇḈḉḊḋḌḍḎḏ')
        assert_equal 'ddddeeeeeeeeeeff', Slugify.convert('ḐḑḒḓḔḕḖḗḘḙḚḛḜḝḞḟ')
        assert_equal 'gghhhhhhhhhhiiii', Slugify.convert('ḠḡḢḣḤḥḦḧḨḩḪḫḬḭḮḯ')
        assert_equal 'kkkkkkllllllllmm', Slugify.convert('ḰḱḲḳḴḵḶḷḸḹḺḻḼḽḾḿ')
        assert_equal 'mmmmnnnnnnnnoooo', Slugify.convert('ṀṁṂṃṄṅṆṇṈṉṊṋṌṍṎṏ')
        assert_equal 'oooopppprrrrrrrr', Slugify.convert('ṐṑṒṓṔṕṖṗṘṙṚṛṜṝṞṟ')
        assert_equal 'sssssssssstttttt', Slugify.convert('ṠṡṢṣṤṥṦṧṨṩṪṫṬṭṮṯ')
        assert_equal 'ttuuuuuuuuuuvvvv', Slugify.convert('ṰṱṲṳṴṵṶṷṸṹṺṻṼṽṾṿ')
        assert_equal 'wwwwwwwwwwxxxxyy', Slugify.convert('ẀẁẂẃẄẅẆẇẈẉẊẋẌẍẎẏ')
        assert_equal 'zzzzzzhtwya', Slugify.convert('ẐẑẒẓẔẕẖẗẘẙẚẛẞẟ')
        assert_equal '', Slugify.convert('ẛẞẟỈỉỊịₔℇ℈ℐℑℒℓ℔℣℥Ω℧ℨ℩ℭ')
        assert_equal 'aaaaaaaaaaaaaaaa', Slugify.convert('ẠạẢảẤấẦầẨẩẪẫẬậẮắ')
        assert_equal 'aaaaaaaaeeeeeeee', Slugify.convert('ẰằẲẳẴẵẶặẸẹẺẻẼẽẾế')
        assert_equal 'eeeeeeeeoooo', Slugify.convert('ỀềỂểỄễỆệỌọỎỏ')
        assert_equal 'oooooooooooooooo', Slugify.convert('ỐốỒồỔổỖỗỘộỚớỜờỞở')
        assert_equal 'oooouuuuuuuuuuuu', Slugify.convert('ỠỡỢợỤụỦủỨứỪừỬửỮữ')
        assert_equal 'uuyyyyyyyy', Slugify.convert('ỰựỲỳỴỵỶỷỸỹ')
        assert_equal 'aeox', Slugify.convert('ₐₑₒₓₔ')
        assert_equal 'acasccccocufghhhhh', Slugify.convert('℀℁ℂ℃℄℅℆ℇ℈℉ℊℋℌℍℎℏ')
        assert_equal 'nppqrrrpxr', Slugify.convert('ℐℑℒℓ℔ℕ№℗℘ℙℚℛℜℝ℞℟')
        assert_equal 'smteltmzkabee', Slugify.convert('℠℡™℣ℤ℥Ω℧ℨ℩KÅℬℭ℮ℯ')
        assert_equal '91011121314151617181920abcd', Slugify.convert('⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛⒜⒝⒞⒟')
        assert_equal 'efghijklmnopqrst', Slugify.convert('⒠⒡⒢⒣⒤⒥⒦⒧⒨⒩⒪⒫⒬⒭⒮⒯')
        assert_equal 'uvwxyzabcdefghij', Slugify.convert('⒰⒱⒲⒳⒴⒵ⒶⒷⒸⒹⒺⒻⒼⒽⒾⒿ')
        assert_equal 'klmnopqrstuvwxyz', Slugify.convert('ⓀⓁⓂⓃⓄⓅⓆⓇⓈⓉⓊⓋⓌⓍⓎⓏ')
        assert_equal 'abcdefghijklmnop', Slugify.convert('ⓐⓑⓒⓓⓔⓕⓖⓗⓘⓙⓚⓛⓜⓝⓞⓟ')
        assert_equal 'qrstuvwxyz0', Slugify.convert('ⓠⓡⓢⓣⓤⓥⓦⓧⓨⓩ⓪')
        assert_equal 'fsaaaaaoaoajajavavafafafaf', Slugify.convert('ꜰꜱꜲꜳꜴꜵꜶꜷꜸꜹꜺꜻꜼꜽꜾꜿ')
        assert_equal 'abcdefghijklmno', Slugify.convert('＠ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯ')
        assert_equal 'pqrstuvwxyz-', Slugify.convert('ＰＱＲＳＴＵＶＷＸＹＺ［＼］＾＿')
        assert_equal '', Slugify.convert('［＼］＾｛｜｝')
        assert_equal 'abcdefghijklmno', Slugify.convert('｀ａｂｃｄｅｆｇｈｉｊｋｌｍｎｏ')
        assert_equal 'pqrstuvwxyz-', Slugify.convert('ｐｑｒｓｔｕｖｗｘｙｚ｛｜｝～')

        assert_equal 'abcdefghijklmnopqrstuvwxyz', Slugify.convert('abcdefghijklmnopqrstuvwxyz')
        assert_equal 'abcdefghijklmnopqrstuvwxyz', Slugify.convert('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
        assert_equal '0123456789', Slugify.convert('0123456789')
        assert_equal '23', Slugify.convert('²³')
        assert_equal '------------------', Slugify.convert('({})-_[],.;:=~+<>&')
        assert_equal '', Slugify.convert('|@"#§^!°*$%£`?/\\')
        assert_equal 'uu', Slugify.convert('ùµ')
    end

    def test_slugify_trim
        assert_equal '', Slugify.convert('--', true)
        assert_equal 'test', Slugify.convert('-test', true)
        assert_equal 'test', Slugify.convert('test-', true)
        assert_equal 'test', Slugify.convert('-test-', true)
        assert_equal 'test-test', Slugify.convert('-test-test-', true)
        assert_equal 'test-test', Slugify.convert('-test--test-', true)
    end

end