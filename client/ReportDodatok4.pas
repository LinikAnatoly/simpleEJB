unit ReportDodatok4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,XSBuiltIns,
  Dialogs, DialogFormUnit, Buttons, StdCtrls, ComCtrls , ENPlanWorkController,ENHumenItemController;

type
  TfrmReportDodatok4 = class(TDialogForm)
    lblEPRenName: TLabel;
    edtEPRenName: TEdit;
    spbEPRen: TSpeedButton;
    spbEPRenClear: TSpeedButton;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    lblExecuter: TLabel;
    edtFINExecutorName: TEdit;
    spbFINExecutor: TSpeedButton;
    lblYearGen: TLabel;
    edtYearGen: TComboBox;
    lblMonthGen: TLabel;
    edtMonthGen: TComboBox;
    btnTransportDepartment: TSpeedButton;
    btnClearTransportDepartment: TSpeedButton;
    edtTransportDepartmentName: TEdit;
    edtENWorkerWorkerFactName: TEdit;
    spbENWorkerWorkerFact: TSpeedButton;
    lblPersonal: TLabel;
    gbGroup: TGroupBox;
    rbFinExecutor: TRadioButton;
    rbFinWorker: TRadioButton;
    edtTypeName: TEdit;
    spbType: TSpeedButton;
    spbClearType: TSpeedButton;
    lblType: TLabel;
    lblState: TLabel;
    edtStateName: TEdit;
    spbState: TSpeedButton;
    spbClearState: TSpeedButton;
    cbDisconnection: TComboBox;
    lblDisconnection: TLabel;
    chkShowWorkFinish: TCheckBox;
    chkShow_doll: TCheckBox;
    chkShow_rechetka: TCheckBox;
    procedure spbEPRenClearClick(Sender: TObject);
    procedure spbEPRenClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure spbFINExecutorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTransportDepartmentClick(Sender: TObject);
    procedure btnClearTransportDepartmentClick(Sender: TObject);
    procedure spbENWorkerWorkerFactClick(Sender: TObject);
    procedure rbFinWorkerClick(Sender: TObject);
    procedure rbFinExecutorClick(Sender: TObject);
    procedure spbTypeClick(Sender: TObject);
    procedure spbStateClick(Sender: TObject);
    procedure spbClearTypeClick(Sender: TObject);
    procedure spbClearStateClick(Sender: TObject);
  private
    { Private declarations }
  public
    renCode: Integer;
    renName: String;
    transportDepartmentCode : Integer;
    typeCode, stateCode : String;

    ENPlanWorkObj: ENPlanWork;
    ENHumenItemObj:ENHumenItem;
    reportType: Integer;
    { Public declarations }
  end;

var
  frmReportDodatok4: TfrmReportDodatok4;

implementation

{$R *.dfm}
 uses  FINExecutorController, ShowFINExecutor,
  ShowFINExecutorTree , ShowENDepartment , ENDepartmentController ,
   ChildFormUnit , EnergyproController , DMReportsUnit, ShowENTransportDepartment, ENTransportDepartmentController ,
  ShowFINWorker,
  FINWorkerController,
  ENConsts, ENDeliveryTimeController, EditENDeliveryTime,
  ENDeliveryKindController, FINWorkerKindController, ShowENPlanWorkType,
  ShowENPlanWorkState;

procedure TFrmReportDodatok4.spbEPRenClearClick(Sender: TObject);
begin
  renCode := 0;
  renName := '';
  edtEPRenName.Text := '';
  
end;

procedure TFrmReportDodatok4.spbEPRenClick(Sender: TObject);
var
    frmENDepartmentShow: TfrmENDepartmentShow;
   f : ENDepartmentFilter;
begin
  f := ENDepartmentFilter.Create;
   SetNullIntProps(f);
   SetNullXSProps(f);
   f.code := 1;

   frmENDepartmentShow:=TfrmENDepartmentShow.Create(Application,fmNormal, f);
   try
      with frmENDepartmentShow do begin

        if ShowModal = mrOk then
        begin

          renCode := ENDepartmentShort(tvDep.Selected.Data).code;
          renName := ENDepartmentShort(tvDep.Selected.Data).shortName;
          edtEPRenName.Text := renName;
        end;
      end;
   finally
      frmENDepartmentShow.Free;
   end;

end;

procedure TFrmReportDodatok4.btnOkClick(Sender: TObject);
var
  argNames, args: ArrayOfString;
  reportName: String;
  //var ys,ms,ds,yf,mf,df: Word;
begin
{DecodeDate(edtDateStart.date,ys,ms,ds);
DecodeDate(edtDateFinal.date,yf,mf,df);

  IF  ms <> mf then
    Begin
         Application.MessageBox(PChar('«в≥т формуЇтьс€ т≥льки в межах одного м≥с€ц€  !!!'), PChar('”вага!'),MB_ICONWARNING);
         ModalResult:= mrNone;
    end
    else

     if edtDateStart.date > edtDateFinal.date then
        Begin
         Application.MessageBox(PChar('ѕочаткова дата не може бути б≥льшою за к≥нцеву дату !!!'), PChar('”вага!'),MB_ICONWARNING);
         ModalResult:= mrNone;
       end
     else    }
    if (renCode <> 0) or ((reportType =  3 ) or (reportType =  2 ) or (reportType =  4 ) or (reportType = 0) ) then
    begin
      /////// Parameters
      if ((reportType = 1)and(rbFinWorker.Checked)) then
      begin
      SetLength(argNames, 9);
      SetLength(args, 9);
      end
      else if (reportType = 0) then
       begin
        SetLength(argNames, 9);
        SetLength(args, 9);
       end
      else
      begin
      SetLength(argNames, 9);
      SetLength(args, 9);
      end;


      argNames[0] := 'yearGen';
      args[0] := edtYearGen.Text;

      argNames[1] := 'monthGen';
      args[1] := IntToStr(edtMonthGen.ItemIndex + 1);


      argNames[2] := 'departmentCode';
      if reportType = 4 then
      args[2] := IntToStr(transportDepartmentCode)
      else args[2] := IntToStr(renCode);


      argNames[3] := 'typeCode';
      if typeCode = '' then args[3] := '0'
      else
      args[3] := typeCode;

      argNames[4] := 'stateCode';
      if stateCode = '' then args[4] := '0'
      else
      args[4] := stateCode;

      if ((reportType = 1)and(rbFinWorker.Checked)) then
      begin
         argNames[5] := 'tabNumber';
         if ((edtENWorkerWorkerFactName.Text<>'')and(ENHumenItemObj.finWorker<>nil)) then
              args[5] := ENHumenItemObj.finWorker.tabNumber
         else args[5] :='0';
      end;

      if (reportType = 0) then
      begin
         argNames[5] := 'disconnection';
         args[5] := IntToStr(cbDisconnection.ItemIndex);
      end;

      argNames[6] := 'showWorkFinish';
      if (chkShowWorkFinish.Checked = True) then
         args[6] := '1'
      else
         args[6] := '0';

          argNames[7] := 'show_doll';
      if (chkShow_doll.Checked = True) then
         args[7] := '1'
      else
         args[7] := '0';

          argNames[8] := 'show_rechetka';
      if (chkShow_rechetka.Checked = True) then
         args[8] := '1'
      else
         args[8] := '0';



      ///////

      if reportType = 0 then
        reportName := 'NPZ_dodat4/addition4'
      else if reportType = 1 then
        if rbFinExecutor.Checked then
          reportName := 'NPZ_dodat4/addition4byt' // Ёнергосбыт
        else reportName := 'NPZ_dodat4/addition4byt_p' // Ёнергосбыт
      else  if reportType = 2 then
        reportName := 'NPZ_dodat4/addition4_prypys' // предписани€
      else if reportType = 3 then
        reportName := 'NPZ_dodat4/addition4transport' // “ранспорт
      else if reportType = 4 then
        reportName := 'NPZ_dodat4/transport/transport_addition';


      makeReport(reportName, argNames, args, 'xls');
    end
    else
    begin
      Application.MessageBox(PChar('ƒл€ формуванн€ зв≥ту необх≥дно обов`€зково вибрати п≥дрозд≥л!!!'), PChar('”вага!'),MB_ICONWARNING);
      if reportType = 4 then
      begin
      if edtTransportDepartmentName.CanFocus then edtTransportDepartmentName.SetFocus;
      end
      else begin
      if edtEPRenName.CanFocus then edtEPRenName.SetFocus;
      end;
      ModalResult:= mrNone;
    end;
end;

procedure TFrmReportDodatok4.spbFINExecutorClick(Sender: TObject);
var
   frmFINExecutorTreeShow: TfrmFINExecutorTreeShow;
 //  f : EditENPlanWorkStateFilter;
begin
   frmFINExecutorTreeShow:=TfrmFINExecutorTreeShow.Create(Application,fmNormal);
   try
      with frmFINExecutorTreeShow do begin
        DisableActions([ actEdit, actInsert ]);
        if ShowModal = mrOk then
        begin
            try
              ENPlanWorkObj.finExecutor :=
                DMReports.finExecutorShort2finExecutor(FINExecutorShort(tvDep.Selected.Data),
                                                       DMReports.getFullExecutorName(tvDep.Selected));
              edtFINExecutorName.Text := ENPlanWorkObj.finExecutor.name;
            except
              on EConvertError do Exit;
            end;
        end;
      end;
   finally
      frmFINExecutorTreeShow.Free;
   end;
end;

procedure TfrmReportDodatok4.spbStateClick(Sender: TObject);
var
   frmENPlanWorkStateShow : TfrmENPlanWorkStateShow;
begin
   frmENPlanWorkStateShow:=TfrmENPlanWorkStateShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkStateShow do begin

        if ShowModal = mrOk then
        begin
               edtStateName.Text := GetReturnValue(sgENPlanWorkState,1);
               stateCode := GetReturnValue(sgENPlanWorkState,0);
        end;
      end;
   finally
      frmENPlanWorkStateShow.Free;
   end;

end;

procedure TfrmReportDodatok4.spbTypeClick(Sender: TObject);
var
   frmENPlanWorkTypeShow : TfrmENPlanWorkTypeShow;
begin
   frmENPlanWorkTypeShow:=TfrmENPlanWorkTypeShow.Create(Application,fmNormal);
   try
      with frmENPlanWorkTypeShow do begin

        if ShowModal = mrOk then
        begin
               edtTypeName.Text := GetReturnValue(sgENPlanWorkType,1);
               typeCode := GetReturnValue(sgENPlanWorkType,0);
        end;
      end;
   finally
      frmENPlanWorkTypeShow.Free;
   end;

end;

procedure TFrmReportDodatok4.FormShow(Sender: TObject);
begin
 SetComboBoxCurrentYearWithStart(edtYearGen, 2009, 2);
 SetComboBoxCurrentMonth(edtMonthGen);
 HideControls([lblDisconnection, cbDisconnection]);
 if reportType = 0 then
 begin
    HideControls([lblDisconnection, cbDisconnection],false);
    cbDisconnection.ItemIndex := 2;
 end;

 if reportType = 4 then
 begin
  DisableControls([edtTransportDepartmentName]);
  HideControls([edtEPRenName, spbEPRen, spbEPRenClear, edtFINExecutorName, spbFINExecutor]);
  DenyBlankValues([edtTransportDepartmentName]);
 end
  else
  begin
  DisableControls([edtEPRenName, edtFINExecutorName]);
  HideControls([edtTransportDepartmentName, btnTransportDepartment, btnClearTransportDepartment]);
  DenyBlankValues([edtEPRenName]);
  end;
  if reportType = 1 then
  begin
    gbGroup.Visible:=True;
    edtENWorkerWorkerFactName.Visible:=False;
    spbENWorkerWorkerFact.Visible:=False;
    lblPersonal.Visible:=False;
  end;
end;

procedure TfrmReportDodatok4.FormCreate(Sender: TObject);
begin
  reportType := 0;
  typeCode := '';
  stateCode := '';
end;

procedure TfrmReportDodatok4.btnTransportDepartmentClick(Sender: TObject);
var
   frmENTransportDepartmentShow : TfrmENTransportDepartmentShow;
begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do begin

        if ShowModal = mrOk then
        begin
               edtTransportDepartmentName.Text := GetReturnValue(sgENTransportDepartment,1);
               transportDepartmentCode := StrToInt(GetReturnValue(sgENTransportDepartment,0));
        end;
      end;
   finally
      frmENTransportDepartmentShow.Free;
   end;

end;

procedure TfrmReportDodatok4.btnClearTransportDepartmentClick(
  Sender: TObject);
begin
  transportDepartmentCode := -1;
  edtTransportDepartmentName.Text := '';
end;

procedure TfrmReportDodatok4.spbClearStateClick(Sender: TObject);
begin
  inherited;
     stateCode := '';
   edtStateName.Text := '';
end;

procedure TfrmReportDodatok4.spbClearTypeClick(Sender: TObject);
begin
  inherited;
   typeCode := '';
   edtTypeName.Text := '';
end;

procedure TfrmReportDodatok4.spbENWorkerWorkerFactClick(Sender: TObject);
var
   frmFINWorkerShow: TfrmFINWorkerShow;
   f : FINWorkerFilter;
   plan : ENPlanWork;
   w : FINWorker;
   TempFINWorker: FINWorkerControllerSoapPort;
   eType : Integer;
   NVZType: String;
   IsNVZ: Boolean;
begin
      ENHumenItemObj:=ENHumenItem.Create;

    f :=FINWorkerFilter.Create;
      SetNullIntProps(f);
      SetNullXSProps(f);

      if renCode>0 then
    f.departmentCode :=  IntToStr(renCode);

   frmFINWorkerShow:=TfrmFINWorkerShow.Create(Application,fmNormal,f);
   frmFINWorkerShow.forReport := True;
   try

     frmFINWorkerShow.dateGet := TXSDate.Create;
     frmFINWorkerShow.dateGet.XSToNative(GetXSDate( EncodeDate(StrToInt(edtYearGen.Text),edtMonthGen.ItemIndex+1,1) ));

     frmFINWorkerShow.humenKindCode := ENHUMENITEMKIND_ELTEH;
     DisableActions([frmFINWorkerShow.actInsert, frmFINWorkerShow.actEdit, frmFINWorkerShow.actDelete]);

      with frmFINWorkerShow do
        if ShowModal = mrOk then
        begin
            try
              if ENHumenItemObj.finWorker = nil then
              begin
               ENHumenItemObj.finWorker := FINWorker.Create;
               ENHumenItemObj.finWorker.code := low(Integer);
              end;

              ENHumenItemObj.finWorker.name := GetReturnValue(sgFINWorker,1);
              ENHumenItemObj.finWorker.tabNumber := GetReturnValue(sgFINWorker,2);
              ENHumenItemObj.finWorker.positionName := GetReturnValue(sgFINWorker,3);
              ENHumenItemObj.finWorker.positionCode := StrToInt(GetReturnValue(sgFINWorker,4));
              ENHumenItemObj.finWorker.departmentName := GetReturnValue(sgFINWorker,5);
              ENHumenItemObj.finWorker.departmentCode := (GetReturnValue(sgFINWorker,6));
              if ENHumenItemObj.finWorker.priceGen = nil then ENHumenItemObj.finWorker.priceGen := TXSDecimal.Create;
              ENHumenItemObj.finWorker.priceGen.DecimalString := String(sgFINWorker.Objects[0, sgFINWorker.Row]); //GetReturnValue(sgFINWorker,7);

              ENHumenItemObj.finWorker.kindRef := FINWorkerKindRef.Create;

              ENHumenItemObj.finWorker.categor := LOW_INT;

              if GetReturnValue(sgFINWorker,8) = '' then
              begin
                ENHumenItemObj.finWorker.kindRef.code := FINWORKER_KIND_OTHER;
              end
              else
              begin
                //if StrToInt(GetReturnValue(sgFINWorker,8)) =
                ENHumenItemObj.finWorker.kindRef.code := StrToInt(GetReturnValue(sgFINWorker,8));
              end;

              ENHumenItemObj.finWorker.finCode := StrToInt(GetReturnValue(sgFINWorker,9));
              edtENWorkerWorkerFactName.Text:=ENHumenItemObj.finWorker.name;
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINWorkerShow.Free;
   end;

end;

procedure TfrmReportDodatok4.rbFinWorkerClick(Sender: TObject);
begin
if  rbFinWorker.Checked then
begin
lblPersonal.Visible:=true;
edtENWorkerWorkerFactName.Visible:=true;
spbENWorkerWorkerFact.Visible:=True;
end
else
begin
lblPersonal.Visible:=false;
edtENWorkerWorkerFactName.Visible:=false;
spbENWorkerWorkerFact.Visible:=false;
end;

end;

procedure TfrmReportDodatok4.rbFinExecutorClick(Sender: TObject);
begin
if  not rbFinExecutor.Checked then
begin
lblPersonal.Visible:=true;
edtENWorkerWorkerFactName.Visible:=true;
spbENWorkerWorkerFact.Visible:=True;
end
else
begin
lblPersonal.Visible:=false;
edtENWorkerWorkerFactName.Visible:=false;
spbENWorkerWorkerFact.Visible:=false;
end;

end;

end.
