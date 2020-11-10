$out_dir = "build";
$pdflatex = "pdflatex -synctex=1 -halt-on-error %O %S";
$sleep_time = 1;
$pdf_mode = 1;
$pdf_previewer = 'zathura';
@generated_exts = (@generated_exts, 'synctex.gz');
ensure_path( 'TEXINPUTS', './tex' )
