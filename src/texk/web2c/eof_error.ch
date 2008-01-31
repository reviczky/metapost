% catch repeated reads on closed files

@x l. 14659
rd_file:array [readf_index] of alpha_file; {\&{readfrom} files}
rd_fname:array [readf_index] of str_number;
  {corresponding file name or 0 if file not open}
@y
rd_file:array [readf_index] of alpha_file; {\&{readfrom} files}
rd_fname:array [readf_index] of str_number;
  {corresponding file name or 0 if file not open or "" if file not found}
rd_eoferror:array [readf_index] of boolean;
@z

@x L. 14684
rd_fname[n]:=s;
@y
rd_fname[n]:=s;
rd_eoferror[n]:=false;
@z

@x
@d close_file=46 {go here when closing the file}

@<Declare unary action procedures@>=
procedure do_read_or_close(@!c:quarterword);
label exit, continue, found, not_found, close_file;
var @!n,@!n0:readf_index; {indices for searching |rd_fname|}
begin @<Find the |n| where |rd_fname[n]=cur_exp|; if |cur_exp| must be inserted,
  call |start_read_input| and |goto found| or |not_found|@>;
begin_file_reading;
name:=is_read;
if input_ln(rd_file[n],true) then goto found;
end_file_reading;
@y 
@d not_found2=46 {go here when you've found nothing}
@d close_file=47 {go here when closing the file}

@<Declare unary action procedures@>=
procedure do_read_or_close(@!c:quarterword);
label exit, continue, found, not_found, not_found2, close_file;
var @!n,@!n0:readf_index; {indices for searching |rd_fname|}
begin @<Find the |n| where |rd_fname[n]=cur_exp|; if |cur_exp| must be inserted,
  call |start_read_input| and |goto found| or |not_found|@>;
begin_file_reading;
name:=is_read;
if input_ln(rd_file[n],true) then goto found;
end_file_reading;
if rd_eoferror[n] then begin
  rd_eoferror[n]:=false;
  print_err("Attempt to read past end of file");
  help2("I tried to warn you before, but it seems you missed that.")
    ("Please check your code, then try again.");
  error; jump_out;
  end
else begin
  rd_eoferror[n]:=true;
  goto not_found2;
  end;
@z

@x
if start_read_input(cur_exp,n) then goto found @+else goto not_found;
@y
if start_read_input(cur_exp,n) then goto found @+else begin
  delete_str_ref(rd_fname[n]);
  rd_fname[n]:="";
  goto not_found;
end;
@z

@x l. 17419
delete_str_ref(rd_fname[n]);
rd_fname[n]:=0;
if n=read_files-1 then read_files:=n;
if c=close_from_op then goto close_file;
@y
if n=read_files-1 then read_files:=n;
not_found2:
if c=close_from_op then begin 
  delete_str_ref(rd_fname[n]);
  rd_fname[n]:=0;
  goto close_file;
  end;
if rd_fname[n]="" then begin
  if rd_eoferror[n] then begin
    rd_eoferror[n]:=false;
    print_err("Attempt to read a nonexistant file");
    help2("I tried to warn you before, but it seems you missed that.")
     ("Please check your code, then try again.");
    error; jump_out;
    end
  else
    rd_eoferror[n]:=true;
  end
else begin 
 delete_str_ref(rd_fname[n]);
 rd_fname[n]:=0;
 end;
@z
