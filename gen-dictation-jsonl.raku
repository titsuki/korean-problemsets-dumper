use v6.e.PREVIEW;
use JSON::Tiny;

my @kr = "kr.txt".IO.lines;
my @ja = "ja.txt".IO.lines;
my $idx = 1;
my $f = Format.new("%04d");
my @r = gather for (@kr Z @ja) -> ($kr, $ja) {
    take %(
        "id" => $idx,
        "sentence" => $kr.comb.map({ "_" }).join,
        "answer" => $kr.comb,
        "translation_ja" => $ja,
        "audio" => "/audio/topik1800/{$f($idx)}.mp3"
    );
    $idx++;
}

my $pidx = 1;
my @ps = gather for @r.pick(+@r).rotor(10) -> $problemset {
    take to-json {
        "id" => "topik1800-{$f($pidx)}",
        "title" => "topik1800 単語 {$f($pidx)}",
        "list" => @($problemset)
    }
    $pidx++;
}

.say for @ps
