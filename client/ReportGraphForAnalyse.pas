unit ReportGraphForAnalyse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons , DialogFormUnit, ComCtrls ;

type
  TfrmReportGraphForAnalyse = class(TDialogForm)
    cbbKvartal: TComboBox;
    lblReportKvartal: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblMonthGen: TLabel;
    cbbMonthStart: TComboBox;
    lblYearGen: TLabel;
    cbbYearStart: TComboBox;
    lbl1: TLabel;
    cbbMonthFinal: TComboBox;
    lbl2: TLabel;
    cbbYearFinal: TComboBox;
    redtRemont: TRichEdit;
    redtStaff: TRichEdit;
    grpBox: TGroupBox;
    redtAnalyseWork: TRichEdit;
    GroupBox1: TGroupBox;
    chkTeh_new: TCheckBox;
    chkTeh_showTO: TCheckBox;
    chkTeh_showKR: TCheckBox;
    chkTeh_showAVR: TCheckBox;
    GroupBox2: TGroupBox;
    chkZbyt_new: TCheckBox;
    chkZbyt_zamena_new: TCheckBox;
    chkZbyt_obstejennya_new: TCheckBox;
    chkZbyt_proverka_new: TCheckBox;
    chkZbyt_kraja_new: TCheckBox;
    chkTeh_kr: TCheckBox;
    chkTeh_to: TCheckBox;
    chkTeh_pric: TCheckBox;
    chkZbyt_zamena: TCheckBox;
    chkObstejennya: TCheckBox;
    chk_KR_and_TO_and_PRICONGOSPSPOSOB: TCheckBox;
    chkSbytZamenaAndObstejennya: TCheckBox;
    chkshowtech: TCheckBox;
    chkshowall: TCheckBox;
    chkshowzbyt: TCheckBox;
    procedure cbbKvartalChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure chkTeh_newClick(Sender: TObject);
    procedure chkZbyt_newClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    kindGraph : Integer;
  end;

var
  frmReportGraphForAnalyse: TfrmReportGraphForAnalyse;

implementation

uses
  EnergyproController, DMReportsUnit;

{$R *.dfm}

procedure TfrmReportGraphForAnalyse.btnOkClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName, strTabNumbers : String;
begin


   SetLength(argNames, 8);
   SetLength(args, 8);

  argNames[0] := 'MONTHSTART';
  argNames[1] := 'MONTHFINAL';
  argNames[2] := 'YEARSTART';
  argNames[3] := 'YEARFINAL';



  args[0] := IntToStr(cbbMonthStart.ItemIndex+1);
  args[1] := IntToStr(cbbMonthFinal.ItemIndex+1 );
  args[2] := cbbYearStart.Text;
  args[3] := cbbYearFinal.Text;

  if kindGraph = 1  then
  reportName := 'Graph/graph_AnalyseRemont';

  if kindGraph = 2  then
  begin
        argNames[4] := 'showall';
        argNames[5] := 'showtech';
        argNames[6] := 'showzbyt';

        if chkshowall.Checked then
         args[4] := '1'
       else
         args[4] := '0';

         if chkshowtech.Checked then
         args[5] := '1'
       else
         args[5] := '0';

         if chkshowzbyt.Checked then
         args[6] := '1'
       else
         args[6] := '0';


  // tezzzt reportName := 'Graph/graph_AnalyseStaffGetData';
    reportName := 'NPZ_dodat3_var2_hoe/dodat3AXForGraph';

  end;

  if kindGraph = 3  then
  begin
     if chkTeh_kr.Checked = True then
     begin
      reportName := 'Graph/graph_AnalyseWork_kr';
      makeReport(reportName, argNames, args, 'pdf');
     end;
     if chkTeh_to.Checked = True then
     begin
      reportName := 'Graph/graph_AnalyseWork_to';
      makeReport(reportName, argNames, args, 'pdf');
     end;

     if chkTeh_pric.Checked = True then
     begin
      reportName := 'Graph/graph_AnalyseWork_pric';
      makeReport(reportName, argNames, args, 'pdf');
     end;

     if chk_KR_and_TO_and_PRICONGOSPSPOSOB.Checked = True then
     begin
      reportName := 'Graph/graph_AnalyseWork_kr_to_pric';
      makeReport(reportName, argNames, args, 'pdf');
     end;

    if chkZbyt_zamena.Checked = true then
     begin
      reportName := 'Graph/graph_AnalyseWork_zamenaOblik';
      makeReport(reportName, argNames, args, 'pdf');
     end;

     if chkObstejennya.Checked = true then
     begin
      reportName := 'Graph/graph_AnalyseWork_obstejennya';
      makeReport(reportName, argNames, args, 'pdf');
     end;

     if chkSbytZamenaAndObstejennya.Checked = true then
     begin
      reportName := 'Graph/graph_AnalyseWork_zamena_obstejennya';
      makeReport(reportName, argNames, args, 'pdf');
     end;



     if chkTeh_new.Checked = true then
     begin

        argNames[4] := 'showkr';
        argNames[5] := 'showto';
        argNames[6] := 'showavr';

       if chkTeh_showKR.Checked then
       args[4] := '1'
       else
       args[4] := '0';

       if chkTeh_showTO.Checked then
       args[5] := '1'
       else
       args[5] := '0';



       if chkTeh_showAVR.Checked then
       args[6] := '1'
       else
       args[6] := '0';

      reportName := 'NPZ_dodat3_var2_svern_razv/dodat3AXForGraph';
      makeReport(reportName, argNames, args, 'pdf');
     end;

     if chkZbyt_new.Checked = true then
     begin

        argNames[4] := 'showzamena';
        argNames[5] := 'showobstejennya';
        argNames[6] := 'showproverka';
        argNames[7] := 'kraja';

        if chkZbyt_zamena_new.Checked then
       args[4] := '1'
       else
       args[4] := '0';

       if chkZbyt_obstejennya_new.Checked then
       args[5] := '1'
       else
       args[5] := '0';

       if chkZbyt_proverka_new.Checked then
       args[6] := '1'
       else
       args[6] := '0';

       if chkZbyt_kraja_new.Checked then
       args[7] := '1'
       else
       args[7] := '0';

       reportName := 'NPZ_dodat3_zbyt_svern_razv/ax_sbt_dodat3ForGraph';
       makeReport(reportName, argNames, args, 'pdf');
     end;



  end;

  if kindGraph <> 3  then
     makeReport(reportName, argNames, args, 'pdf');


end;

procedure TfrmReportGraphForAnalyse.cbbKvartalChange(Sender: TObject);
begin
    if cbbKvartal.ItemIndex = 1 then
    begin
      cbbMonthStart.ItemIndex:= 0;
      cbbMonthFinal.ItemIndex:= 2;
    end;
    if cbbKvartal.ItemIndex = 2 then
    begin
      cbbMonthStart.ItemIndex:= 3;
      cbbMonthFinal.ItemIndex:= 5;
    end;
    if cbbKvartal.ItemIndex = 3 then
    begin
      cbbMonthStart.ItemIndex:= 6;
      cbbMonthFinal.ItemIndex:= 8;
    end;
    if cbbKvartal.ItemIndex = 4 then
    begin
      cbbMonthStart.ItemIndex:= 9;
      cbbMonthFinal.ItemIndex:= 11;
    end;
end;

procedure TfrmReportGraphForAnalyse.chkTeh_newClick(Sender: TObject);
begin
  inherited;
   if chkTeh_new.Checked then
   begin
      DisableControls([chkTeh_showTO , chkTeh_showKR ,  chkTeh_showAVR], false);

//     chkTeh_showTO.Checked:= True;
//     chkTeh_showKR.Checked:= True;
//     chkTeh_showAVR.Checked:= True;

     chkZbyt_new.Checked:= false;
     chkZbyt_zamena_new.Checked:= false;
     chkZbyt_obstejennya_new.Checked:= false;
     chkZbyt_proverka_new.Checked:= false;
     chkZbyt_kraja_new.Checked:= false;
     DisableControls([chkZbyt_zamena_new , chkZbyt_obstejennya_new ,  chkZbyt_proverka_new , chkZbyt_kraja_new ]);
   end
   else
   begin
     chkTeh_showTO.Checked:= False;
     chkTeh_showKR.Checked:= False;
     chkTeh_showAVR.Checked:= False;
      DisableControls([chkTeh_showTO , chkTeh_showKR ,  chkTeh_showAVR]);
   end
end;

procedure TfrmReportGraphForAnalyse.chkZbyt_newClick(Sender: TObject);
begin
  inherited;
   if chkZbyt_new.Checked then
   begin
     DisableControls([chkZbyt_zamena_new , chkZbyt_obstejennya_new ,  chkZbyt_proverka_new , chkZbyt_kraja_new ],false);


//     chkZbyt_zamena_new.Checked:= true;
//     chkZbyt_obstejennya_new.Checked:= true;
//     chkZbyt_proverka_new.Checked:= true;
//     chkZbyt_kraja_new.Checked:= true;

     chkTeh_new.Checked:= false;
     chkTeh_showTO.Checked:= False;
     chkTeh_showKR.Checked:= False;
     chkTeh_showAVR.Checked:= False;
     DisableControls([chkTeh_showTO , chkTeh_showKR ,  chkTeh_showAVR]);
   end
   else
   begin
     chkZbyt_zamena_new.Checked:= false;
     chkZbyt_obstejennya_new.Checked:= false;
     chkZbyt_proverka_new.Checked:= false;
     chkZbyt_kraja_new.Checked:= false;
     DisableControls([chkZbyt_zamena_new , chkZbyt_obstejennya_new ,  chkZbyt_proverka_new , chkZbyt_kraja_new ]);
   end

end;

procedure TfrmReportGraphForAnalyse.FormShow(Sender: TObject);
begin
    SetComboBoxCurrentYearWithStart(cbbYearStart, 2009, 2);
    SetComboBoxCurrentYearWithStart(cbbYearFinal, 2009, 2);
    SetComboBoxCurrentMonth(cbbMonthStart);
    SetComboBoxCurrentMonth(cbbMonthFinal);


    if kindGraph = 1 then
    begin
     redtRemont.Visible := True;
      HideControls([chkshowall,chkshowtech,chkshowzbyt]);
    end;

    if kindGraph = 2 then
    begin
     redtStaff.Visible := True;

      HideControls([chkshowall,chkshowtech,chkshowzbyt],false);
      chkshowall.Checked:=false;
      chkshowtech.Checked:=false;
      chkshowzbyt.Checked:=false;

    end;


    if kindGraph = 3 then
    begin
     grpBox.Visible:= True;
     redtAnalyseWork.Visible:=True;
     HideControls([chkshowall,chkshowtech,chkshowzbyt]);
    end;


    //cbbKvartal.ItemIndex := 1;
    //cbbKvartalChange(sender);

    DisableControls([chkTeh_showTO , chkTeh_showKR ,  chkTeh_showAVR]);
    DisableControls([chkZbyt_zamena_new , chkZbyt_obstejennya_new ,  chkZbyt_proverka_new , chkZbyt_kraja_new ]);


end;

end.
