unit EditENActIncome;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	  EnergyproController, EnergyproController2, ENActIncomeController, AdvObj , FKProvObjectController ;

type
  TfrmENActIncomeEdit = class(TDialogForm)
  
    lblCode : TLabel;
	  edtCode : TEdit;


  HTTPRIOENActIncome: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblFinDocCode: TLabel;
    lblFinDocID: TLabel;
    edtFinDocCode: TEdit;
    edtFinDocID: TEdit;
    pgc1: TPageControl;
    tsmain: TTabSheet;
    tsact: TTabSheet;
    lblDategen: TLabel;
    lblCommentGen: TLabel;
    lblNumbergen: TLabel;
    edtNumbergen: TEdit;
    dtpDategen: TDateTimePicker;
    grpContract: TGroupBox;
    lblPartnername: TLabel;
    btnContractNumberSelect: TSpeedButton;
    lblContractDate: TLabel;
    lblPartnerCode: TLabel;
    lblContractNumber: TLabel;
    edtContractNumber: TEdit;
    edtPartnerCode: TEdit;
    edtPartnername: TEdit;
    dtpContractDate: TDateTimePicker;
    grpActs: TGroupBox;
    lblActDateStart: TLabel;
    lblActDateEnd: TLabel;
    dtpActDateStart: TDateTimePicker;
    dtpActDateEnd: TDateTimePicker;
    mmoCommentGen: TMemo;
    btnPrintActIncome: TButton;
    btnCloseActIncome: TButton;
    btnUndoSignature: TButton;
    HTTPRIOENAct: THTTPRIO;
    sgENAct: TAdvStringGrid;
    ActionList1: TActionList;
    actViewENAct: TAction;
    actUpdateENAct: TAction;
    actEditENAct: TAction;
    pmActs: TPopupMenu;
    miViewAct: TMenuItem;
    miEditAct: TMenuItem;
    miUpdateENAct: TMenuItem;
    tsProv: TTabSheet;
    sgProvs: TAdvStringGrid;
    edtDatePosting: TDateTimePicker;
    lblDatePosting: TLabel;
    lblGridDescription: TLabel;
    sgProvErrorsDetailed: TAdvStringGrid;
    HTTPRIOFKProvObject: THTTPRIO;
    HTTPRIOENActIncome2Prov: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnContractNumberSelectClick(Sender: TObject);
    procedure btnPrintActIncomeClick(Sender: TObject);
    procedure btnUndoSignatureClick(Sender: TObject);
    procedure btnCloseActIncomeClick(Sender: TObject);
    procedure updateENAct(Sender : TObject; isSubContract : Boolean; grid : TAdvStringGrid; reset : Boolean = true);
    procedure pgc1Change(Sender: TObject);
    procedure actViewENActExecute(Sender: TObject);
    procedure actUpdateENActExecute(Sender: TObject);
    procedure actEditENActExecute(Sender: TObject);
    procedure changeGridDescription(isError: Boolean);
    procedure sgProvsClick(Sender: TObject);
    procedure getPostings4ENActIncome(ENActIncomeCode: Integer);

  
  private
    { Private declarations }
  public
    { Public declarations }
    provResult: FKProvResult;

end;

var
  frmENActIncomeEdit: TfrmENActIncomeEdit;
  ENActIncomeObj: ENActIncome;

  ENActHeaders: array [1..7] of String =
        ( 'Код'
          ,'Номер акту'
          ,'Дата акту'
          ,'ФИО мола с фин.кол.'
          ,'Тип'
          ,'Статус'
          , 'Додано вручну'
          //,'пользователь внесший изменение'
          //,'дата последнего изменения'
        );

   FKBadProvHeaders: array[1..12] of string =
        ('Код'
         ,'Дата'
         ,'Цех (К)'
         ,'Счет (К)'
         ,'Субсчет (К)'
         ,'КАУ (К)'
         ,'Цех (Д)'
         ,'Счет (Д)'
         ,'Субсчет (Д)'
         ,'КАУ (Д)'
         ,'Сумма'
         ,'Примечание'
        );

  FKProvErrorDetailedHeaders: array [1..2] of String =
        ('Код'
         ,'Ошибки'
        );

implementation


uses
  ShowFINServicesObject, ENServicesObjectController, ENConsts, DMReportsUnit,
  ENActController, EditENAct, ENActIncome2ProvController;

{uses
    EnergyproController, EnergyproController2, ENActIncomeController  ;
}
{$R *.dfm}



procedure TfrmENActIncomeEdit.FormShow(Sender: TObject);
 var
    TempENActIncome2Prov : ENActIncome2ProvControllerSoapPort;
    ENActIncome2ProvList: ENActIncome2ProvShortList;
    ENActIncome2ProvFil : ENActIncome2ProvFilter;
    ENActIncome2ProvObj : ENActIncome2Prov;
begin

  //HideControls([btnPrintActIncome, btnCloseActIncome]);
  SetGridHeaders(FKBadProvHeaders, sgProvs.ColumnHeaders);
  SetGridHeaders(FKProvErrorDetailedHeaders, sgProvErrorsDetailed.ColumnHeaders);

  pgc1.ActivePage := tsmain;

  if DialogState = dsView then
  begin
     DisableControls([btnContractNumberSelect]);
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([btnPrintActIncome, btnCloseActIncome, btnUndoSignature]);
    tsact.TabVisible:= false;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumbergen
      ,edtContractNumber
      ,dtpDategen
      ,edtPartnername
      ,edtPartnerCode
      //,edtFinDocCode
      //,edtFinDocID
     ]);
     HideControls([lblCode, edtCode]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

      TempENActIncome2Prov :=  HTTPRIOENActIncome2Prov as ENActIncome2ProvControllerSoapPort;
      ENActIncome2ProvFil := ENActIncome2ProvFilter.Create;
      SetNullIntProps(ENActIncome2ProvFil);
      SetNullXSProps(ENActIncome2ProvFil);
      ENActIncome2ProvFil.actIncomeRef := ENActIncomeRef.Create;
      ENActIncome2ProvFil.actIncomeRef.code  := ENActIncomeObj.code;

      ENActIncome2ProvList := TempENActIncome2Prov.getScrollableFilteredList(ENActIncome2ProvFil,0,-1);
      if High(ENActIncome2ProvList.list) > 0 then
         begin
           provResult.partId :=   ENActIncome2ProvList.list[0].partId;
           edtDatePosting.DateTime:=EncodeDate(ENActIncome2ProvList.list[0].datePosting.Year
            ,ENActIncome2ProvList.list[0].datePosting.Month,ENActIncome2ProvList.list[0].datePosting.Day);
             edtDatePosting.checked := true;
         end;

    HideControls([btnUndoSignature]);


    if (ENActIncomeObj.statusRef.code = ENACT_CLOSED) then
    begin
       btnCloseActIncome.Caption := 'Відмінити проведення акту';
    end;

    if (ENActIncomeObj.statusRef.code = ENACT_GOOD) then
    begin
       if (DialogState = dsView) then HideControls([btnCloseActIncome]);
       btnCloseActIncome.Caption := 'На підписання';
    end;

    if (ENActIncomeObj.statusRef.code = ENACT_SIGNATURE) then
    begin
       btnCloseActIncome.Caption := 'Провести у ФК';
       HideControls([btnUndoSignature], False);
    end;

    if (ENActIncomeObj.statusRef.code = ENACT_CLOSED) then
    begin
       DialogState := dsView;
       HideControls([btnContractNumberSelect]);
    end;

    if (DialogState = dsEdit) then
    begin
       DisableControls([dtpActDateStart, dtpActDateEnd, edtContractNumber, dtpDategen,
           btnContractNumberSelect, edtPartnerCode, edtPartnername]);
    end;


    edtCode.Text := IntToStr(ENActIncomeObj.code);
    edtNumbergen.Text := ENActIncomeObj.numbergen;
      if ENActIncomeObj.dategen <> nil then
      begin
        dtpDategen.DateTime:=EncodeDate(ENActIncomeObj.dategen.Year,ENActIncomeObj.dategen.Month,ENActIncomeObj.dategen.Day);
        dtpDategen.checked := true;
      end
      else
      begin
        dtpDategen.DateTime:=SysUtils.Date;
        dtpDategen.checked := false;
      end;
    mmoCommentGen.Text := ENActIncomeObj.commentGen;
    edtContractNumber.Text := ENActIncomeObj.contractNumber;

      if ENActIncomeObj.actDateStart <> nil then
      begin
        dtpActDateStart.DateTime := EncodeDate(ENActIncomeObj.actDateStart.Year,ENActIncomeObj.actDateStart.Month,ENActIncomeObj.actDateStart.Day);
        dtpActDateStart.checked := true;
      end
      else
      begin
        dtpActDateStart.DateTime := SysUtils.Date;
        dtpActDateStart.checked := false;
      end;

      if ENActIncomeObj.actDateEnd <> nil then
      begin
        dtpActDateEnd.DateTime := EncodeDate(ENActIncomeObj.actDateEnd.Year,ENActIncomeObj.actDateEnd.Month,ENActIncomeObj.actDateEnd.Day);
        dtpActDateEnd.checked := true;
      end
      else
      begin
        dtpActDateEnd.DateTime := SysUtils.Date;
        dtpActDateEnd.checked := false;
      end;

      if ENActIncomeObj.contractDate <> nil then
      begin
        dtpContractDate.DateTime:=EncodeDate(ENActIncomeObj.contractDate.Year,ENActIncomeObj.contractDate.Month,ENActIncomeObj.contractDate.Day);
        dtpContractDate.checked := true;
      end
      else
      begin
        dtpContractDate.DateTime:=SysUtils.Date;
        dtpContractDate.checked := false;
      end;



      edtPartnerCode.Text := ENActIncomeObj.partnerCode;
      edtPartnerName.Text := ENActIncomeObj.partnerName;
      edtFinDocCode.Text := ENActIncomeObj.finDocCode;

      if (ENActIncomeObj.finDocID <> Low(Integer)) then
         edtFinDocID.Text := IntToStr(ENActIncomeObj.finDocID)
      else
         edtFinDocID.Text := '';

  end;
end;



procedure TfrmENActIncomeEdit.pgc1Change(Sender: TObject);
begin
  inherited;
      if pgc1.ActivePage = tsact then
      begin
        Self.updateENAct(Sender, false, sgENAct);
      end
      else if pgc1.ActivePage = tsProv then
           getPostings4ENActIncome(ENActIncomeObj.code);
end;

procedure TfrmENActIncomeEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActIncome: ENActIncomeControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumbergen
      ,edtContractNumber
      ,edtPartnername
      ,edtPartnerCode
      ,edtFinDocCode
      ,edtFinDocID
      ,dtpActDateStart
      ,dtpActDateEnd
     ])  then
  begin
      Application.MessageBox(PChar('Заповніть обов''язкові поля!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin

     TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;

     ENActIncomeObj.numbergen := edtNumbergen.Text;

     if dtpActDateStart.checked then
     begin
       if ENActIncomeObj.actDateStart = nil then
          ENActIncomeObj.actDateStart := TXSDate.Create;
       ENActIncomeObj.actDateStart.XSToNative(GetXSDate(dtpActDateStart.DateTime));
     end
     else
       ENActIncomeObj.actDateStart := nil;

     if dtpActDateEnd.checked then
     begin
       if ENActIncomeObj.actDateEnd = nil then
          ENActIncomeObj.actDateEnd := TXSDate.Create;
       ENActIncomeObj.actDateEnd.XSToNative(GetXSDate(dtpActDateEnd.DateTime));
     end
     else
       ENActIncomeObj.actDateEnd := nil;


     if dtpDategen.checked then
     begin
       if ENActIncomeObj.dategen = nil then
          ENActIncomeObj.dategen := TXSDate.Create;
       ENActIncomeObj.dategen.XSToNative(GetXSDate(dtpDategen.DateTime));
     end
     else
       ENActIncomeObj.dategen := nil;

     ENActIncomeObj.commentGen := mmoCommentGen.Text;


     ENActIncomeObj.contractNumber := edtContractNumber.Text;

     if dtpContractDate.checked then
     begin 
       if ENActIncomeObj.contractDate = nil then
          ENActIncomeObj.contractDate := TXSDate.Create;
       ENActIncomeObj.contractDate.XSToNative(GetXSDate(dtpContractDate.DateTime));
     end
     else
       ENActIncomeObj.contractDate := nil;

     ENActIncomeObj.partnerCode := edtPartnerCode.Text;
     ENActIncomeObj.partnerName := edtPartnerName.Text;
     ENActIncomeObj.finDocCode := edtFinDocCode.Text;

     if (edtFinDocID.Text <> '') then
       ENActIncomeObj.finDocID := StrToInt(edtFinDocID.Text)
     else
       ENActIncomeObj.finDocID := Low(Integer);


    if DialogState = dsInsert then
    begin
      ENActIncomeObj.code:=low(Integer);
      TempENActIncome.add(ENActIncomeObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActIncome.save(ENActIncomeObj);
    end;
  end;
end;


procedure TfrmENActIncomeEdit.btnContractNumberSelectClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (edtContractNumber.Text <> '') then
     f.contractNumber := edtContractNumber.Text
   else
     f.contractNumber := '-1';

   //f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338)';
   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow := TfrmFINServicesObjectShow.Create(Application, fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try
                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                dtpContractDate.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                dtpContractDate.Checked := true;
                edtPartnerName.Text := GetReturnValue(sgFINServicesObject, 3);
                edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
                edtFinDocCode.Text := GetReturnValue(sgFINServicesObject, 5);
                edtFinDocID.Text := GetReturnValue(sgFINServicesObject, 6);

                DisableControls([dtpContractDate
                                 ,edtPartnerName
                                 ,edtPartnerCode
                                 ,edtFinDocCode
                                 ,edtFinDocID]);

            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;


procedure TfrmENActIncomeEdit.btnPrintActIncomeClick(Sender: TObject);
var
 argNames, args: ArrayOfString;
 reportName: String;
begin
  inherited;

  if DialogState = dsInsert then Exit;

  SetLength(argNames, 1);
  SetLength(args, 1);

  argNames[0] := 'PcodeAkt';
  args[0] := IntToStr(ENActIncomeObj.code);

  reportName := '201109/ActIncome/ActPriPer';

  makeReport(reportName, argNames, args, 'xls');

  {Печатаем кошторис}

  argNames[0] := 'PcodeAkt';
  args[0] := IntToStr(ENActIncomeObj.code);
  reportName := '201109/ActIncome/Act21';
  makeReport(reportName, argNames, args, 'xls');
end;

procedure TfrmENActIncomeEdit.btnUndoSignatureClick(Sender: TObject);
var
  TempENActIncome : ENActIncomeControllerSoapPort;
begin
  inherited;
  if Application.MessageBox(PChar('Повернути Акт у статус Черновий ??! '),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2) = IDOK then
  begin
    TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;
    TempENActIncome.unSignatured(ENActIncomeObj.code);
    Application.MessageBox(PChar('Статус изменен ..!'),PChar('Внимание !'),MB_ICONINFORMATION);
  end;
  ModalResult := mrYes;
end;

procedure TfrmENActIncomeEdit.actEditENActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
  grid : TAdvStringGrid;
begin
  inherited;
  if pgc1.ActivePage = tsact then
  begin
    grid := sgENAct;
  end;

  TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

  frmENActEdit := TfrmENActEdit.Create(Application, dsEdit);
  try
    try
      frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(grid.Cells[0,grid.Row]));
    except
      on EConvertError do Exit;
    end;

    if (frmENActEdit.ENActObj <> nil) then
    begin
      if (frmENActEdit.ENActObj.statusRef.code = ENACT_REVERSED) then
      begin
        Application.MessageBox(PChar('Акт сторновано ... використовуйте перегляд ...!!!'), PChar('Внимание !'),MB_ICONWARNING);
        exit;
      end;
      if (frmENActEdit.ENActObj.statusRef.code <> ENACT_GOOD) then
      begin
        Application.MessageBox(PChar('Акт На підписанні або вже Проведений ... використовуйте перегляд ...!!!'), PChar('Внимание !'),MB_ICONWARNING);
        exit;
      end;
    end
    else
    begin
      Application.MessageBox(PChar('Акт НЕ знайдено ...'), PChar('Внимание !'),MB_ICONWARNING);
      exit;
    end;

    if frmENActEdit.ShowModal in [mrOk, mrYes] then
    begin
      Self.updateENAct(Sender, false, sgENAct);
    end;
  finally
    frmENActEdit.Free;
    frmENActEdit:=nil;
  end;
end;

procedure TfrmENActIncomeEdit.actUpdateENActExecute(Sender: TObject);
begin
  Self.updateENAct(Sender, false, sgENAct);

end;

procedure TfrmENActIncomeEdit.actViewENActExecute(Sender: TObject);
var
  TempENAct: ENActControllerSoapPort;
begin

    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;

    frmENActEdit:=TfrmENActEdit.Create(Application, dsView);
    try
      try
        frmENActEdit.ENActObj := TempENAct.getObject(StrToInt(sgENAct.Cells[0, sgENAct.Row]));
      except
        on EConvertError do Exit;
      end;

      if frmENActEdit.ShowModal in [mrOk, mrYes] then
      begin
        Self.updateENAct(Sender, false, sgENAct);
      end;
    finally
      frmENActEdit.Free;
      frmENActEdit:=nil;
    end;

end;

procedure TfrmENActIncomeEdit.changeGridDescription(isError: Boolean);
begin
  if not isError then
  begin
    lblGridDescription.Caption := 'Список проводок';
    lblGridDescription.Font.Color := clWindowText;
  end
  else begin
    lblGridDescription.Caption := 'Список ошибочных проводок';
    lblGridDescription.Font.Color := clRed;
  end;

  sgProvErrorsDetailed.Visible := isError;
end;

procedure TfrmENActIncomeEdit.sgProvsClick(Sender: TObject);
var provId, i, j: Integer;
begin
  ClearGrid(sgProvErrorsDetailed);

  try
    provId := StrToInt(sgProvs.Cells[0, sgProvs.Row]);
  except
    on EConvertError do Exit;
  end;

  if provResult = nil then Exit;
  if provResult.partId > LOW_INT then Exit;

  for i := 0 to High(provResult.badProvList.list) do
  begin
    if provResult.badProvList.list[i].id = provId then
    begin
      if High(provResult.badProvList.list[i].detailedList.list) > -1 then
        sgProvErrorsDetailed.RowCount := High(provResult.badProvList.list[i].detailedList.list) + 2
      else
        sgProvErrorsDetailed.RowCount := 2;

      with sgProvErrorsDetailed do
        for j := 0 to High(provResult.badProvList.list[i].detailedList.list) do
        begin
          if provResult.badProvList.list[i].detailedList.list[j].prov_id <> Low(Integer) then
            Cells[0,j+1] := IntToStr(provResult.badProvList.list[i].detailedList.list[j].prov_id)
          else
            Cells[0,j+1] := '';
          Cells[1,j+1] := provResult.badProvList.list[i].detailedList.list[j].err_mes;
        end;

      break;
    end;
  end;

end;


procedure TfrmENActIncomeEdit.getPostings4ENActIncome(ENActIncomeCode: Integer);
var i: Integer;
    TempFKProvObject: FKProvObjectControllerSoapPort;
    provList: FKProvObjectShortList;

    TempENActIncome2Prov : ENActIncome2ProvControllerSoapPort;
    ENActIncome2ProvList: ENActIncome2ProvShortList;
    ENActIncome2ProvFil : ENActIncome2ProvFilter;
    ENActIncome2ProvObj : ENActIncome2Prov;
    TempENActIncome: ENActIncomeControllerSoapPort;
begin
  ClearGrid(sgProvs);

  TempFKProvObject := HTTPRIOFKProvObject as FKProvObjectControllerSoapPort;
  TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;

  {if (( provResult = nil  ) or ( provResult.partId =  LOW_INT  ) ) then
  begin
      provResult:= FKProvResult.Create;
      TempENActIncome2Prov :=  HTTPRIOENActIncome2Prov as ENActIncome2ProvControllerSoapPort;
      ENActIncome2ProvFil := ENActIncome2ProvFilter.Create;
      SetNullIntProps(ENActIncome2ProvFil);
      SetNullXSProps(ENActIncome2ProvFil);
      ENActIncome2ProvFil.actIncomeRef := ENActIncomeRef.Create;
      ENActIncome2ProvFil.actIncomeRef.code  := ENActIncomeCode;

      //ENActIncome2ProvList := TempENActIncome2Prov.getScrollableFilteredList(ENActIncome2ProvFil,0,-1);


      if High(ENActIncome2ProvList.list) > 0 then
         begin
           provResult.partId :=   ENActIncome2ProvList.list[0].partId;
         end
      else
         Exit;

  end; }
   // provList := TempFKProvObject.getProvListFromFin(provResult.partId);
   provList := TempENActIncome.getPostingsList(ENActIncomeObj.code );


  if High(provList.list) > -1 then
    sgProvs.RowCount := High(provList.list) + 2
  else
    sgProvs.RowCount := 2;

  with sgProvs do
    for i := 0 to High(provList.list) do
    begin
       if provList.list[i].id <> Low(Integer) then
        Cells[0,i+1] := IntToStr(provList.list[i].id)
      else
        Cells[0,i+1] := '';
      if provList.list[i].dt_prov = nil then
        Cells[1,i+1] := ''
      else
        Cells[1,i+1] := XSDate2String(provList.list[i].dt_prov);
      Cells[2,i+1] := provList.list[i].bal_ceh;
      Cells[3,i+1] := provList.list[i].bal_sch;
      Cells[4,i+1] := provList.list[i].bal_sub_sch;
      Cells[5,i+1] := provList.list[i].bal_kau;
      Cells[6,i+1] := provList.list[i].kor_ceh;
      Cells[7,i+1] := provList.list[i].kor_sch;
      Cells[8,i+1] := provList.list[i].kor_sub_sch;
      Cells[9,i+1] := provList.list[i].kor_kau;
      if provList.list[i].summa = nil then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := provList.list[i].summa.DecimalString;
      Cells[11,i+1] := provList.list[i].primechan;
    end;
end;


procedure TfrmENActIncomeEdit.btnCloseActIncomeClick(Sender: TObject);
var TempENActIncome : ENActIncomeControllerSoapPort;
datePosting : TXSDate;
i : Integer;
begin

   TempENActIncome := HTTPRIOENActIncome as ENActIncomeControllerSoapPort;

   if ENActIncomeObj.statusRef.code = ENACT_SIGNATURE then
   begin
      if Application.MessageBox(PChar('Вы действительно хотите провести акт?'),
                        PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin

        if (edtDatePosting.Checked) then
          begin
            datePosting := TXSDate.Create;
            datePosting.XSToNative(GetXSDate(edtDatePosting.DateTime));
            provResult := TempENActIncome.close(ENActIncomeObj.code, 1 , datePosting);
          end else
          begin
            edtDatePosting.DateTime:=SysUtils.Date;
            edtDatePosting.checked := true;
            datePosting := TXSDate.Create;
            datePosting.XSToNative(GetXSDate(edtDatePosting.DateTime));
            provResult := TempENActIncome.close(ENActIncomeObj.code, 1 , datePosting);
          end;

          if provResult <> nil then
            if ((provResult.partId = LOW_INT)
                 and (provResult.badProvList <> nil)) then
            begin

              changeGridDescription(true);

              if High(provResult.badProvList.list) > -1 then
                sgProvs.RowCount := High(provResult.badProvList.list) + 2
              else
                sgProvs.RowCount := 2;

              with sgProvs do
                for i := 0 to High(provResult.badProvList.list) do
                begin

                  if provResult.badProvList.list[i].id <> Low(Integer) then
                    Cells[0,i+1] := IntToStr(provResult.badProvList.list[i].id)
                  else
                    Cells[0,i+1] := '';
                  if provResult.badProvList.list[i].dt_prov = nil then
                    Cells[1,i+1] := ''
                  else
                    Cells[1,i+1] := XSDate2String(provResult.badProvList.list[i].dt_prov);
                  Cells[2,i+1] := provResult.badProvList.list[i].bal_ceh;
                  Cells[3,i+1] := provResult.badProvList.list[i].bal_sch;
                  Cells[4,i+1] := provResult.badProvList.list[i].bal_sub_sch;
                  Cells[5,i+1] := provResult.badProvList.list[i].bal_kau;
                  Cells[6,i+1] := provResult.badProvList.list[i].kor_ceh;
                  Cells[7,i+1] := provResult.badProvList.list[i].kor_sch;
                  Cells[8,i+1] := provResult.badProvList.list[i].kor_sub_sch;
                  Cells[9,i+1] := provResult.badProvList.list[i].kor_kau;
                  if provResult.badProvList.list[i].summa = nil then
                    Cells[10,i+1] := ''
                  else
                    Cells[10,i+1] := provResult.badProvList.list[i].summa.DecimalString;
                  Cells[11,i+1] := provResult.badProvList.list[i].primechan;

                end;

                sgProvsClick(Sender);
            end
            else begin

              changeGridDescription(false);
              getPostings4ENActIncome(ENActIncomeObj.code);
              Application.MessageBox(PChar('Акт проведен!'),PChar('Внимание!'),MB_ICONINFORMATION);


            end;

      end;
    end;

   if ENActIncomeObj.statusRef.code = ENACT_CLOSED then
   begin
      if Application.MessageBox(PChar('Вы действительно хотите удалить проведение акта?'),
                        PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENActIncome.unClose(ENActIncomeObj.code, 1);
          Application.MessageBox(PChar('Акт Отменен!'),PChar('Внимание!'),MB_ICONINFORMATION);
      end;
   end;

   if ENActIncomeObj.statusRef.code = ENACT_GOOD then
   begin
      if Application.MessageBox(PChar('Вы действительно хотите изменить статус у Акта "На подписании"?'),
                        PChar('Внимание!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENActIncome.signatured(ENActIncomeObj.code);
          Application.MessageBox(PChar('Статус изменен..!'),PChar('Внимание!'),MB_ICONINFORMATION);
      end;
   end;
 ModalResult := mrYes;
end;

procedure TfrmENActIncomeEdit.updateENAct(Sender : TObject; isSubContract : Boolean; grid : TAdvStringGrid; reset : Boolean = true);
var
  TempENAct: ENActControllerSoapPort;
  ENActList, ENActListManual : ENActShortList;
  filter : ENActFilter;
  i, pageNum, startPoint, LastRow : Integer;
  conditionSQL, primalCondition : String;
  LastCount : Integer;
  act : ENActShort;
begin
   SetGridHeaders(ENActHeaders, sgENAct.ColumnHeaders);
    TempENAct := HTTPRIOENAct as ENActControllerSoapPort;
   if filter = nil then
    begin
      filter := ENActFilter.Create;
      SetNullIntProps(filter);
      SetNullXSProps(filter);
    end;
    filter.orderBySQL := 'ENACT.DATEACT DESC';

    primalCondition := filter.conditionSQL;
    conditionSQL := primalCondition;

    AddCondition(conditionSQL, ' enact.code in (  select ee.actrefcode from enactincome2enact ee ' +
              ' where ee.actincomerefcode = '+ IntToStr( ENActIncomeObj.code ) + ')'  );

    filter.conditionSQL := conditionSQL;

    ENActList := TempENAct.getScrollableFilteredList(filter, 0, -1);

    grid.RowCount := grid.RowCount + ENActList.totalCount;
    if (reset) and (ENActList.totalCount > 0) then
      grid.RowCount := grid.RowCount - 1;

    LastCount := High(ENActList.list);


    if LastCount < 0 then Exit;

    with sgENAct do
    for act in ENActList.list
    do
    begin
        Application.ProcessMessages;
        if act.code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(act.code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := act.numberGen;
        if act.dateAct = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(act.dateAct);

        Cells[3,i+1] := act.finMolName;
        Cells[4,i+1] := act.actTypeRefName;
        Cells[5,i+1] := act.statusRefName;


        i := i + 1;
      end;
end;


end.

