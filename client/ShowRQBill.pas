
unit ShowRQBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQBillController, AdvObj, tmsAdvGridExcel ;


type
  TfrmRQBillShow = class(TChildForm)               
  HTTPRIORQBill: THTTPRIO;
    ImageList1: TImageList;
    sgRQBill: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    N5: TMenuItem;
    N9: TMenuItem;
    actConfirm: TAction;
    N10: TMenuItem;
    actBillImport: TAction;
    N11: TMenuItem;
    actUnconfirm: TAction;
    N12: TMenuItem;
    HTTPRIORQPayDoc: THTTPRIO;
    N13: TMenuItem;
    addPrihod: TAction;
    HTTPRIORQFKOrder: THTTPRIO;
    N14: TMenuItem;
    HTTPRIORQOrg: THTTPRIO;
    addSpecification: TAction;
    actExcell: TAction;
    aeExcel: TAdvGridExcelIO;
    mniExcell: TMenuItem;
    actChangeBankDetails: TAction;
    N15: TMenuItem;
    N16: TMenuItem;
    HTTPRIORQOrgRschet: THTTPRIO;
    mniMakeBillPaidNoCash: TMenuItem;
    mniMakeBillPaidWithCash: TMenuItem;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgRQBillTopLeftChanged(Sender: TObject);
procedure sgRQBillDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actConfirmExecute(Sender: TObject);
    procedure actBillImportExecute(Sender: TObject);
    procedure actUnconfirmExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure addPrihodExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure addSpecificationExecute(Sender: TObject);
    procedure actExcellExecute(Sender: TObject);
    procedure actChangeBankDetailsExecute(Sender: TObject);
    {Оплатить текущий счет isCash - true - наличкой, false - безналичкой}
    procedure makeBillPaid(Sender: TObject; isCash : Boolean);
    procedure mniMakeBillPaidNoCashClick(Sender: TObject);
    procedure mniMakeBillPaidWithCashClick(Sender: TObject);

 private
   { Private declarations }
 public
   { Public declarations }
   //RQBillObj: RQBill;
   tmpFilter : RQBillFilter;
   orgId : Integer;
   billType : Integer;
   procedure UpdateGrid(Sender: TObject);
 end;

var
  frmRQBillShow : TfrmRQBillShow;
  frmRQBillTmcShow : TfrmRQBillShow;
  frmRQBillServicesShow : TfrmRQBillShow;
 // RQBillObj: RQBill;
 // RQBillFilterObj: RQBillFilter;
  
  
implementation

uses Main, EditRQBill, EditRQBillFilter, EditBillImport,
  RQPayDocController, ENConsts, DMReportsUnit,
  EditRQFKOrder, RQFKOrderController, ShowRQInvoice, RQInvoiceController,
  RQFKOrderKindController, ShowRQFKOrder, RQBillStatusController,
  RQOrgController, RQBillTypeController, Globals , ShellAPI, RQBudgetController,
  ShowRQBudget, ShowRQOrgRschet, RQOrgRschetController, RQOrgBankController
  , EditChooseFINWorker, User2StaffingController;

{$R *.dfm}

var
  //frmRQBillShow : TfrmRQBillShow;

 
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQBillHeaders: array [1..10] of String =
        ( 'Код'
          ,'Номер'
          ,'Номер проекта'
          ,'Дата рахунку'
          ,'Сума (з ПДВ)'
          ,'постачальник'
          ,'№ договору/дата'
          ,'статус рахунку'
          ,'стан рахунку'
          ,'користувач який вніс зміни'
        );
   

procedure TfrmRQBillShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if (FormMode = fmChild) and (FilterObject <> nil) then
    begin
      billType := RQBillFilter(FilterObject).billType.code;
      if billType = RQBILL_TYPE_TMC then
        frmRQBillTmcShow := nil
      else
      if billType = RQBILL_TYPE_SERVICES then
         frmRQBillServicesShow := nil;
    end;
    inherited;
end;


procedure TfrmRQBillShow.FormShow(Sender: TObject);
var
  TempRQBill : RQBillControllerSoapPort;
  i : Integer;
  RQBillList : RQBillShortList;
begin
  SetGridHeaders(RQBillHeaders, sgRQBill.ColumnHeaders);

  if FilterObject <> nil then
   if RQBillFilter(FilterObject).billType <> nil then
    begin
      billType := RQBillFilter(FilterObject).billType.code;

      if billType = LOW_INT then
        RQBillFilter(FilterObject).conditionSQL := '';
    end;

  ColCount := 100;
  TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQBillFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if (tmpFilter <> nil) then
  begin
    tmpFilter.orderBySQL := 'dategen desc, RQBILL.code desc';
    RQBillList := TempRQBill.getScrollableFilteredList(tmpFilter, 0, ColCount);
  end
  else
  begin
    RQBillFilter(FilterObject).orderBySQL := 'dategen desc, RQBILL.code desc';
    RQBillList := TempRQBill.getScrollableFilteredList(RQBillFilter(FilterObject), 0, ColCount);
  end;

  LastCount:=High(RQBillList.list);

  if LastCount > -1 then
     sgRQBill.RowCount:=LastCount+2
  else
     sgRQBill.RowCount:=2;

   with sgRQBill do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBillList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQBillList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQBillList.list[i].numberDoc;
        Cells[2,i+1] := RQBillList.list[i].numberProject;
        if RQBillList.list[i].dateGen = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := XSDate2String(RQBillList.list[i].dateGen);

//       NET-4274 if RQBillList.list[i].sumGen = nil then
//          Cells[4,i+1] := ''
//        else
//          Cells[4,i+1] := SeparateThousands(RQBillList.list[i].sumGen.DecimalString);
          if RQBillList.list[i].sumWithNds = nil then
          Cells[4,i+1] := ''
          else
          Cells[4,i+1] := SeparateThousands(RQBillList.list[i].sumWithNds.DecimalString);

        Alignments[4,i + 1] := taRightJustify;
        Colors[4,i + 1] := $0080FF80;

        Cells[5,i+1] := RQBillList.list[i].orgName;

        if RQBillList.list[i].contractDate <> nil then
          Cells[6, i+1] := RQBillList.list[i].contractNumber + ' від ' + DateToStr(EncodeDate(RQBillList.list[i].contractDate.Year,RQBillList.list[i].contractDate.Month,RQBillList.list[i].contractDate.Day))
        else
          Cells[6, i+1] := '';

        Cells[7,i+1] := RQBillList.list[i].statusRefName;

        Cells[8,i+1] := RQBillList.list[i].state;

        Cells[9,i+1] := RQBillList.list[i].userGen;
        LastRow:=i+1;
        sgRQBill.RowCount:=LastRow+1;  
      end;
   ColCount:=ColCount+1;
   sgRQBill.Row:=1;
end;

procedure TfrmRQBillShow.sgRQBillTopLeftChanged(Sender: TObject);
var
  TempRQBill: RQBillControllerSoapPort;
  i,CurrentRow: Integer;
  RQBillList: RQBillShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQBill.TopRow + sgRQBill.VisibleRowCount) = ColCount
  then
    begin
      TempRQBill :=  HTTPRIORQBill as RQBillControllerSoapPort;
      CurrentRow:=sgRQBill.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQBillFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if (tmpFilter <> nil) then
  begin
    tmpFilter.orderBySQL := 'dategen desc, RQBILL.code desc';
    RQBillList := TempRQBill.getScrollableFilteredList(tmpFilter, ColCount-1, 100);
  end
  else
  begin
    RQBillFilter(FilterObject).orderBySQL := 'dategen desc, RQBILL.code desc';
    RQBillList := TempRQBill.getScrollableFilteredList(RQBillFilter(FilterObject), ColCount-1, 100);
  end;

  sgRQBill.RowCount:=sgRQBill.RowCount+100;
  LastCount:=High(RQBillList.list);
  with sgRQBill do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQBillList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQBillList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQBillList.list[i].numberDoc;
        Cells[2,i+CurrentRow] := RQBillList.list[i].numberProject;
        if RQBillList.list[i].dateGen = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(RQBillList.list[i].dateGen);

        if RQBillList.list[i].sumGen = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := RQBillList.list[i].sumGen.DecimalString;

        Alignments[4,i + CurrentRow] := taRightJustify;
        Colors[4,i + CurrentRow] := $0080FF80;

        Cells[5,i+CurrentRow] := RQBillList.list[i].orgName;

        if RQBillList.list[i].contractDate <> nil then
          Cells[6, i+CurrentRow] := RQBillList.list[i].contractNumber + ' від ' + DateToStr(EncodeDate(RQBillList.list[i].contractDate.Year,RQBillList.list[i].contractDate.Month,RQBillList.list[i].contractDate.Day))
        else
          Cells[6, i+CurrentRow] := '';

        Cells[7,i+CurrentRow] := RQBillList.list[i].statusRefName;

        Cells[8,i+CurrentRow] := RQBillList.list[i].state;

        Cells[9,i+CurrentRow] := RQBillList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQBill.Row:=CurrentRow-5;
   sgRQBill.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQBillShow.sgRQBillDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQBill,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQBillShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQBill.RowCount-1 do
   for j:=0 to sgRQBill.ColCount-1 do
     sgRQBill.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQBillShow.actViewExecute(Sender: TObject);
Var TempRQBill: RQBillControllerSoapPort;
    ObjCode : Integer;
begin
 TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
   except
   on EConvertError do Exit;
  end;
  frmRQBillEdit:=TfrmRQBillEdit.Create(Application, dsView);
  try
    frmRQBillEdit.RQBillObj := TempRQBill.getObject(ObjCode);
    frmRQBillEdit.ShowModal;
  finally
    frmRQBillEdit.Free;
    frmRQBillEdit:=nil;
  end;
end;



procedure TfrmRQBillShow.actEditExecute(Sender: TObject);
Var TempRQBill: RQBillControllerSoapPort;
    ObjCode : Integer;
begin
 TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
   except
   on EConvertError do Exit;
  end;
  frmRQBillEdit:=TfrmRQBillEdit.Create(Application, dsEdit);

  try
    frmRQBillEdit.RQBillObj := TempRQBill.getObject(ObjCode);

  if (frmRQBillEdit.RQBillObj.statusRef.code <> RQBILL_STATUS_NEW) then
  begin
      Application.MessageBox(PChar('Рахунок вже відпрацьовано ...'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

    if frmRQBillEdit.ShowModal= mrOk then
      begin
        //TempRQBill.save(RQBillObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQBillEdit.Free;
    frmRQBillEdit:=nil;
  end;
end;




procedure TfrmRQBillShow.actExcellExecute(Sender: TObject);
var AppPath, FileName: String;
    OldCursor: TCursor;
begin
  OldCursor := Screen.Cursor;
  try
    Screen.Cursor := crHourGlass;

    AppPath := ExtractFilePath(Application.ExeName);
    if not DirectoryExists(AppPath + TempReportsPath) then
      CreateDir(AppPath + TempReportsPath);
    FileName := AppPath + TempReportsPath + GetFileName(Self.Caption + ' (фільтр) ') + '.xls';

    aeExcel.XLSExport(FileName);
    ShellExecute(0,
                 PChar('open'),
                 PChar('"' + FileName + '"'),
                 nil,
                 nil,
                 SW_SHOWMAXIMIZED);
  finally
    Screen.Cursor := OldCursor;
  end;
end;

procedure TfrmRQBillShow.actDeleteExecute(Sender: TObject);
Var TempRQBill: RQBillControllerSoapPort;
  ObjCode : Integer;
  RQBillObj : RQBill;
begin
 TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
   except
   on EConvertError do Exit;
  end;

  RQBillObj := TempRQBill.getObject(ObjCode);
  if (RQBillObj.statusRef.code <> RQBILL_STATUS_NEW) then
  begin
      Application.MessageBox(PChar('Рахунок вже відпрацьовано ...'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити рахунок?'),
                    PChar('Увага!!!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      if RQBillObj.billType.code = RQBILL_TYPE_TMC then
         TempRQBill.removeBillByTmc(ObjCode)
      else
      if RQBillObj.billType.code = RQBILL_TYPE_SERVICES then
         TempRQBill.removeBillByServices(ObjCode)
      else
        showMessage('error on billType');
      UpdateGrid(Sender);
  end;

end;


procedure TfrmRQBillShow.actInsertExecute(Sender: TObject);
Var TempRQBill: RQBillControllerSoapPort;
begin
  TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;

  if FilterObject = nil then Exit;

  try
   frmRQBillEdit:=TfrmRQBillEdit.Create(Application, dsInsert);

   frmRQBillEdit.RQBillObj:=RQBill.Create;
   frmRQBillEdit.RQBillObj.dateGen:= TXSDate.Create;
   frmRQBillEdit.RQBillObj.dateEdit:= TXSDate.Create;

   frmRQBillEdit.RQBillObj.billType := RQBillType.Create;
   frmRQBillEdit.RQBillObj.billType.code := RQBillFilter(FilterObject).billType.code;

    try
      if frmRQBillEdit.ShowModal = mrOk then
      begin
        if frmRQBillEdit.RQBillObj <> nil then
            //TempRQBill.add(RQBillObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQBillEdit.Free;
      frmRQBillEdit:=nil;
    end;
  finally
    //RQBillObj.Free;
  end;
end;




procedure TfrmRQBillShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQBillShow.actFilterExecute(Sender: TObject);
begin
 billType := -1;
 frmRQBillFilterEdit:=TfrmRQBillFilterEdit.Create(Application, dsEdit);
  try
    RQBillFilterObj := RQBillFilter.Create;
    SetNullIntProps(RQBillFilterObj);
    SetNullXSProps(RQBillFilterObj);

    if FilterObject <> nil then
      if RQBillFilter(FilterObject).billType <> nil then
         billType := RQBillFilter(FilterObject).billType.code;

    if billType <> -1 then
    begin
      RQBillFilterObj.billType := RQBillType.Create;
      RQBillFilterObj.billType.code := billType;
    end;

    if frmRQBillFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQBillFilter.Create;

        if orgId > 0 then
        begin
          RQBillFilterObj.statusRef := RQBillStatusRef.Create;
          RQBillFilterObj.statusRef.code := RQBILL_STATUS_CONFIRMED;
          RQBillFilterObj.conditionSQL := ' orgcode in (select og.code from rqorg og where og.id = '+ IntToStr(orgId) +')';
        end;

      FilterObject := RQBillFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQBillFilterEdit.Free;
    frmRQBillFilterEdit:=nil;
  end;
end;

procedure TfrmRQBillShow.actNoFilterExecute(Sender: TObject);
begin
  billType := LOW_INT;

  if FilterObject <> nil then
    if RQBillFilter(FilterObject).billType <> nil then
      billType := RQBillFilter(FilterObject).billType.code;

  FilterObject.Free;
  FilterObject := nil;

  ///// Пересоздаем фильтр и возвращаем обратно код 
  FilterObject := RQBillFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  RQBillFilter(FilterObject).billType := RQBillType.Create();
  RQBillFilter(FilterObject).billType.code := billType;

  if billType = LOW_INT then
     RQBillFilter(FilterObject).conditionSQL := '';
  /////

  UpdateGrid(Sender);
end;



procedure TfrmRQBillShow.actChangeBankDetailsExecute(Sender: TObject);
Var TempRQBill: RQBillControllerSoapPort;
  ObjCode : Integer;
  RQBillObj : RQBill;
  frmRQOrgRschetShow : TfrmRQOrgRschetShow;
  TempRQOrgRschet : RQOrgRschetControllerSoapPort;
begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
   except
   on EConvertError do Exit;
  end;

  RQBillObj := TempRQBill.getObject(ObjCode);
    if ((RQBillObj.org <> nil) and (RQBillObj.org.id <> Low_Int)) then
        begin
          frmRQOrgRschetShow := TfrmRQOrgRschetShow.Create(Application,fmNormal);
          try
             frmRQOrgRschetShow.FilterObject := RQOrgRschetFilter.Create;
             SetNullIntProps(frmRQOrgRschetShow.FilterObject);
             SetNullXSProps(frmRQOrgRschetShow.FilterObject);
             RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).orgId := RQBillObj.org.id;
             //RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := RQBillObj.org.codeorg;
             RQOrgRschetFilter(frmRQOrgRschetShow.FilterObject).axOrgAccount := RQBillObj.org.axOrgCode;
             frmRQOrgRschetShow.Caption := 'Розрахункові рахунки';
             DisableActions([frmRQOrgRschetShow.actNoFilter], true);

             with frmRQOrgRschetShow do
                if ShowModal = mrOk then
                begin
                    try
                       if RQBillObj.orgRschet = nil then RQBillObj.orgRschet := RQOrgRschet.Create();
                       RQBillObj.orgRschet.bank := RQOrgBank.Create();

                       RQBillObj.orgRschet.id := StrToInt(GetReturnValue(sgRQOrgRschet,0));
                       RQBillObj.orgRschet.mfo := GetReturnValue(sgRQOrgRschet,3);
                       RQBillObj.orgRschet.rschet := GetReturnValue(sgRQOrgRschet,1);

                       RQBillObj.orgRschet.bank.id := StrToInt(GetReturnValue(sgRQOrgRschet,4));
                       RQBillObj.orgRschet.bank.mfo := GetReturnValue(sgRQOrgRschet,3);
                       RQBillObj.orgRschet.bank.name := GetReturnValue(sgRQOrgRschet,2);

                       //////////////////
                       // edtRschet.Text := GetReturnValue(sgRQOrgRschet,1);
                       // edtMfo.Text := GetReturnValue(sgRQOrgRschet,3);
                       // edtBank.Text := GetReturnValue(sgRQOrgRschet,2);
                       //////////////////

                    except
                       on EConvertError do Exit;
                    end;

                    TempRQBill.save(RQBillObj);
                end;
          finally
             frmRQOrgRschetShow.Free;
          end;

          //TempRQBill.save(RQBillObj);
        end;

end;

procedure TfrmRQBillShow.actConfirmExecute(Sender: TObject);
var
  TempRQBill: RQBillControllerSoapPort;
  ObjCode : Integer;
begin
  try
    ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Затвердити рахунок?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;

    if (billType = RQBILL_TYPE_SERVICES) then
      TempRQBill.confirmBillServices(ObjCode)
    else TempRQBill.confirmBill(ObjCode);

    UpdateGrid(Sender);
  end;
end;


procedure TfrmRQBillShow.actBillImportExecute(Sender: TObject);
begin
  frmBillImportEdit := TfrmBillImportEdit.Create(Application, dsInsert);
  try
    frmBillImportEdit.ShowModal;
  finally
    frmBillImportEdit.Free;
  end;
  UpdateGrid(Sender);
end;

procedure TfrmRQBillShow.actUnconfirmExecute(Sender: TObject);
var
  TempRQBill: RQBillControllerSoapPort;
  ObjCode : Integer;
begin
  try
    ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Відмінити затвердження рахунку?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;

    if (billType = RQBILL_TYPE_SERVICES) then
      TempRQBill.unConfirmBillServices(ObjCode)
    else TempRQBill.unConfirmBill(ObjCode);

    UpdateGrid(Sender);
  end;
end;

procedure TfrmRQBillShow.makeBillPaid(Sender: TObject; isCash : Boolean);
var
  TempRQPayDoc: RQPayDocControllerSoapPort;
  TempRQBill: RQBillControllerSoapPort;
  RQBillObj: RQBill;

  //
  budgcode : integer;
  f : rqbudgetFilter;
  frmRQBudgetShow : TfrmRQBudgetShow;
  accountablePersonTabNumber : WideString;
  frmChooseFINWorker : TfrmChoooseFINWorkerEdit;
  user2StaffingObj : User2Staffing;
begin
  TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
  RQBillObj:= TempRQBill.getObject(StrToInt(sgRQBill.Cells[0,sgRQBill.Row]));

  if (RQBillObj.statusRef.code <> RQBILL_STATUS_CONFIRMED) then
  begin
    Application.MessageBox(PChar('Треба затвердити рахунок  ...'), PChar('Увага'), MB_ICONWARNING);
    exit;
  end;

  budgcode := LOW_INT;

  //  SUPP-8816  Превышение лимита по кодам ДДС
     if DMReports.chkPaymentByBudget then
     begin
          f := rqbudgetFilter.Create;
          SetNullIntProps(f);
          SetNullXSProps(f);
          f.orderBySQL := '  dategen desc  ' ;

          frmRQBudgetShow:=TfrmRQBudgetShow.Create(Application,fmNormal, f);
          DisableActions([frmRQBudgetShow.actView ,   frmRQBudgetShow.actInsert ,   frmRQBudgetShow.actDelete ,   frmRQBudgetShow.actEdit ,   frmRQBudgetShow.actUpdate ,   frmRQBudgetShow.actApprove ,   frmRQBudgetShow.actUnApprove]   );

          try

              with frmRQBudgetShow do begin

                if ShowModal = mrOk then
                begin
                    try

                         budgcode :=  StrToInt ( frmRQBudgetShow.sgRQBudget.Cells[0,frmRQBudgetShow.sgRQBudget.Row] ) ;
                         // edtBudget.Text :=  frmRQBudgetShow.sgRQBudget.Cells[2,sgRQBudget.Row];

                    except
                       on EConvertError do Exit;
                    end;
                end;
              end;
           finally
              frmRQBudgetShow.Free;
           end;

          if budgcode = LOW_INT then
          begin
           Application.MessageBox(PChar('Рахунок не сплачено... Треба обрати бюджет!'), PChar('Увага'), MB_ICONWARNING);
           exit;
          end;

     end;

  TempRQPayDoc:= HTTPRIORQPayDoc as RQPayDocControllerSoapPort;

  if isCash then begin
    user2StaffingObj := DMReports.getUser2StaffingOfCurrentUser;
	if (Assigned(user2StaffingObj)) and (Length(Trim(user2StaffingObj.podrCod)) > 0) then begin
	  frmChooseFINWorker := TfrmChoooseFINWorkerEdit.Create(Application, dsInsert, RQBillObj.dateGen, user2StaffingObj.podrCod);
	end else begin
      frmChooseFINWorker := TfrmChoooseFINWorkerEdit.Create(Application, dsInsert, RQBillObj.dateGen);	
	end;

	frmChooseFINWorker.Caption := 'Оберіть підзвітну особу для сплати готівкою';
	frmChooseFINWorker.lblFINWorker.Caption := 'Підзвітна особа';
	if frmChooseFINWorker.ShowModal = mrOk then begin
	  accountablePersonTabNumber := frmChooseFINWorker.FINWorkerObj.tabNumber;
	end else begin
	  Exit;
	end;
  end;

  if (billType = RQBILL_TYPE_SERVICES) then begin
    if not isCash then begin
      TempRQPayDoc.addPayDocByBillServices(RQBillObj.code , budgcode );  // SUPP-8816 02062014
	end else begin
	  TempRQPayDoc.addPayDocByBillServices(RQBillObj.code , budgcode, true, accountablePersonTabNumber);
	end;
  end else begin
      if not isCash then begin
        TempRQPayDoc.addPayDocByBill(RQBillObj.code , budgcode);       // SUPP-8816 02062014
  	  end else begin
	    TempRQPayDoc.addPayDocByBill(RQBillObj.code , budgcode, true, accountablePersonTabNumber);
	  end;
  end;

  UpdateGrid(Sender);
end;


procedure TfrmRQBillShow.mniMakeBillPaidNoCashClick(Sender: TObject);
begin
  inherited;
  Self.makeBillPaid(Sender, false);
end;

procedure TfrmRQBillShow.mniMakeBillPaidWithCashClick(Sender: TObject);
begin
  inherited;
  Self.makeBillPaid(Sender, true);
end;

procedure TfrmRQBillShow.PopupMenu1Popup(Sender: TObject);
var bill : RQBill;
    ObjCode : Integer;
begin

   try
     ObjCode := StrToInt(sgRQBill.Cells[0,sgRQBill.Row]);
   except
     on EConvertError do Exit;
   end;

   bill := DMReports.getBillByCode(ObjCode);
   if bill = nil then
   begin
     Exit;
   end;

   actUnconfirm.Enabled := bill.statusRef.code = RQBILL_STATUS_CONFIRMED;
   actConfirm.Enabled := bill.statusRef.code = RQBILL_STATUS_NEW;
   addPrihod.Enabled := bill.statusRef.code = RQBILL_STATUS_CONFIRMED;
   actChangeBankDetails.Visible := bill.billType.code = RQBILL_TYPE_TMC;

   if (bill.billType.code = RQBILL_TYPE_SERVICES) then
   begin
     actBillImport.Enabled := False;
     actBillImport.Visible := actBillImport.Enabled;
     addPrihod.Enabled := False;
     addPrihod.Visible := addPrihod.Enabled;
     addSpecification.Enabled := False;
     addSpecification.Visible := addSpecification.Enabled;
   end;

end;

procedure TfrmRQBillShow.addPrihodExecute(Sender: TObject);
var TempRQFKOrder : RQFKOrderControllerSoapPort;
    frmRQInvoiceShow : TfrmRQInvoiceShow;
    invoiceFilter : RQInvoiceFilter;
    objCode : Integer;
    f : RQFKOrderFilter;
    TempRQBill : RQBillControllerSoapPort;
    RQBillObj : RQBill;
    RQOrgObj : RQOrg;
    TempRQOrg : RQOrgControllerSoapPort;
begin

  TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
  RQBillObj := TempRQBill.getObject(StrToInt(sgRQBill.Cells[0,sgRQBill.Row]));

  if FilterObject = nil then exit;

  TempRQFKOrder := HTTPRIORQFKOrder as RQFKOrderControllerSoapPort;
  frmRQFKOrderEdit := TfrmRQFKOrderEdit.Create(Application, dsInsert);

  try
    frmRQFKOrderEdit.RQFKOrderObj := RQFKOrder.Create;

    if (RQBillObj.org.code <> Low(Integer)) then
    begin
      TempRQOrg := HTTPRIORQOrg as RQOrgControllerSoapPort;
      RQOrgObj := TempRQOrg.getObject(RQBillObj.org.code);

      {
      frmRQFKOrderEdit.RQFKOrderObj.org := RQOrg.Create();
      frmRQFKOrderEdit.RQFKOrderObj.org.id := RQOrgObj.id;
      frmRQFKOrderEdit.RQFKOrderObj.org.codeorg := RQOrgObj.codeorg;
      frmRQFKOrderEdit.RQFKOrderObj.org.name := RQOrgObj.name;
      frmRQFKOrderEdit.RQFKOrderObj.org.ukr_name := RQOrgObj.ukr_name;
      frmRQFKOrderEdit.RQFKOrderObj.org.okpo := RQOrgObj.okpo;
      frmRQFKOrderEdit.RQFKOrderObj.org.nalog_num := RQOrgObj.nalog_num;
      frmRQFKOrderEdit.RQFKOrderObj.org.svidet_num := RQOrgObj.svidet_num;
      frmRQFKOrderEdit.RQFKOrderObj.org.adr := RQOrgObj.adr;
      frmRQFKOrderEdit.RQFKOrderObj.org.tel := RQOrgObj.tel;
      frmRQFKOrderEdit.RQFKOrderObj.org.country := RQOrgObj.country;
      frmRQFKOrderEdit.RQFKOrderObj.org.region := RQOrgObj.region;
      frmRQFKOrderEdit.RQFKOrderObj.org.ministry := RQOrgObj.ministry;
      frmRQFKOrderEdit.RQFKOrderObj.org.ownership := RQOrgObj.ownership;
      frmRQFKOrderEdit.RQFKOrderObj.org.type_ := RQOrgObj.type_;
      frmRQFKOrderEdit.RQFKOrderObj.org.master_code := RQOrgObj.master_code;
      }
      frmRQFKOrderEdit.RQFKOrderObj.org := DMReports.copyOrg(RQOrgObj, frmRQFKOrderEdit.RQFKOrderObj.org);
    end;

    frmRQFKOrderEdit.RQFKOrderObj.warrantDate := TXSDate.Create;
    frmRQFKOrderEdit.RQFKOrderObj.kind := RQFKOrderKind.Create;

    f := RQFKOrderFilter.Create;
    SetNullIntProps(f);
    SetNullXSProps(f);

    f.kind := RQFKOrderKind.Create;
    f.kind.code := RQFKORDER_KIND_PRIHOD_POSTAVKA;

    frmRQFKOrderEdit.RQFKOrderObj.kind.code := RQFKORDER_KIND_PRIHOD_POSTAVKA;

    if (RQBillObj.org.code <> Low(Integer)) then
    begin
      frmRQFKOrderEdit.DisableControls([frmRQFKOrderEdit.edtRQOrgOrgName, frmRQFKOrderEdit.spbRQOrgOrg]);
      frmRQFKOrderEdit.edtRQOrgOrgName.Text := RQOrgObj.name;
    end;

    if frmRQFKOrderEdit.ShowModal = mrOk then
    begin
      //if RQFKOrderObj<>nil then
       //f.code := frmRQFKOrderEdit.fCode;
    end;

  finally
    frmRQFKOrderEdit.Free;
    frmRQFKOrderEdit:=nil;
  end;


  if not Assigned(frmRQFKOrderInShow) then
      frmRQFKOrderInShow := TfrmRQFKOrderShow.Create(Application,fmChild, f);
    frmRQFKOrderInShow.Caption := 'Прибуткові ордера';
    frmRQFKOrderInShow.UpdateCaption;
    frmRQFKOrderInShow.Show;
    frmRQFKOrderInShow.UpdateGrid(Sender);

end;

procedure TfrmRQBillShow.FormCreate(Sender: TObject);
begin
  inherited;
  tmpFilter := nil;
  billType := LOW_INT;
end;

procedure TfrmRQBillShow.addSpecificationExecute(Sender: TObject);
var
  TempRQPayDoc: RQPayDocControllerSoapPort;
  TempRQBill: RQBillControllerSoapPort;
  RQBillObj: RQBill;
begin
  TempRQBill := HTTPRIORQBill as RQBillControllerSoapPort;
  RQBillObj:= TempRQBill.getObject(StrToInt(sgRQBill.Cells[0,sgRQBill.Row]));

  if (RQBillObj.statusRef.code <> RQBILL_STATUS_CONFIRMED) then
  begin
      Application.MessageBox(PChar('Треба затвердити рахунок  ...'), PChar('Увага'), MB_ICONWARNING);
      exit;
  end;

  TempRQBill:= HTTPRIORQBill as RQBillControllerSoapPort;
  TempRQBill.addAGSpecification(RQBillObj);
  UpdateGrid(Sender);
end;

end.
