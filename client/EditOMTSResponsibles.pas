
unit EditOMTSResponsibles;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENResponsibles2FINContractsController, FINContractsController,
  TB2Item, TB2Dock, TB2Toolbar, AdvObj ;

type
  TfrmOMTSResponsiblesEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;

  lblFINContractsFinContractsName : TLabel;
  edtFINContractsFinContractsName : TEdit;
  spbFINContractsFinContracts : TSpeedButton;
  

  HTTPRIOENResponsibles2FINContracts: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actViewResponsibles: TAction;
    actInsertResponsibles: TAction;
    actEditResponsibles: TAction;
    actDeleteResponsibles: TAction;
    actUpdateResponsibles: TAction;
    gbENResponsibles: TGroupBox;
    TBToolbar1: TTBToolbar;
    TBItem1: TTBItem;
    TBItem6: TTBItem;
    TBItem2: TTBItem;
    TBItem7: TTBItem;
    TBItem3: TTBItem;
    gbFINContracts: TGroupBox;
    TBToolbar2: TTBToolbar;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem9: TTBItem;
    TBItem10: TTBItem;
    actViewFINContracts: TAction;
    actInsertFINContracts: TAction;
    actEditFINContracts: TAction;
    actDeleteFINContracts: TAction;
    actUpdateFINContracts: TAction;
    actFilterFINContracts: TAction;
    actNoFilterFINContracts: TAction;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    sgENResponsibles: TAdvStringGrid;
    HTTPRIOENResponsibles: THTTPRIO;
    pmENResponsibles: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    pmFINContracts: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    sgFINContracts: TAdvStringGrid;
    HTTPRIOFINContracts: THTTPRIO;
    actViewResp2Contract: TAction;
    actInsertResp2Contract: TAction;
    actEditResp2Contract: TAction;
    actDeleteResp2Contract: TAction;
    actUpdateResp2Contract: TAction;
    gbENResponsibles2FINContracts: TGroupBox;
    TBToolbar3: TTBToolbar;
    TBItem8: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    sgENResponsibles2FINContracts: TAdvStringGrid;
    pmENResponsibles2FINContracts: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure spbFINContractsFinContractsClick(Sender : TObject);
    procedure actUpdateResponsiblesExecute(Sender: TObject);
    procedure actInsertResponsiblesExecute(Sender: TObject);
    procedure sgENResponsiblesTopLeftChanged(Sender: TObject);
    procedure actEditResponsiblesExecute(Sender: TObject);
    procedure actDeleteResponsiblesExecute(Sender: TObject);
    procedure actViewResponsiblesExecute(Sender: TObject);
    procedure actInsertFINContractsExecute(Sender: TObject);
    procedure actUpdateFINContractsExecute(Sender: TObject);
    procedure sgFINContractsTopLeftChanged(Sender: TObject);
    procedure actViewFINContractsExecute(Sender: TObject);
    procedure actDeleteFINContractsExecute(Sender: TObject);
    procedure sgENResponsiblesClick(Sender: TObject);
    procedure actInsertResp2ContractExecute(Sender: TObject);
    procedure actEditResp2ContractExecute(Sender: TObject);
    procedure actViewResp2ContractExecute(Sender: TObject);
    procedure actDeleteResp2ContractExecute(Sender: TObject);
    procedure actUpdateResp2ContractExecute(Sender: TObject);
    procedure actFilterFINContractsExecute(Sender: TObject);
    procedure actNoFilterFINContractsExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    // FINContractsFilterObj: FINContractsFilter; 
    FINContractsInnerFilterObj: FINContractsFilter;
  public
    { Public declarations }
    procedure UpdateResponsiblesList;
    procedure UpdateFINContractsList;
    procedure UpdateFINContractsListByResponsible(ResponsibleCode: Integer);
    procedure UpdateENResponsibles2FINContractsList;
  end;

var
  frmOMTSResponsiblesEdit: TfrmOMTSResponsiblesEdit;
  //ENResponsibles2FINContractsObj: ENResponsibles2FINContracts;

implementation

uses
//  ShowFINContracts
//  ,
//  FINContractsController
  ENResponsiblesController, EditENResponsibles,
  ENResponsiblesKindController, ENConsts, ShowFINServicesObject,
  ENServicesObjectController, EditFINContracts,
  EditENResponsibles2FINContracts, EditFINContractsFilter;

{uses
    EnergyproController, EnergyproController2, ENResponsibles2FINContractsController  ;
}
{$R *.dfm}

var
  RespColCount, RespLastCount: Integer;
  RespLastRow: Integer = 1;

  FINContractsColCount, FINContractsLastCount: Integer;
  FINContractsLastRow: Integer = 1;

  ENResponsiblesHeaders: array [1..4] of String =
        ( 'Код'
          ,'ПІБ'
          ,'Таб. №'
          ,'Посада'
        );

  FINContractsHeaders: array [1..6] of String =
        ( 'Код'
          ,'Постачальник'
          ,'Номер договору'
          ,'Дата договору'
          ,'Код договору у ФК'
          ,'ID договору у ФК'
        );

  ENResponsibles2FINContractsHeaders: array [1..6] of String =
        ( 'Код'
          ,'Постачальник'
          ,'Номер договору'
          ,'Дата договору'
          ,'Код договору у ФК'
          ,'ID договору у ФК'
        );

procedure TfrmOMTSResponsiblesEdit.FormShow(Sender: TObject);
begin
  SetGridHeaders(ENResponsiblesHeaders, sgENResponsibles.ColumnHeaders);
  SetGridHeaders(FINContractsHeaders, sgFINContracts.ColumnHeaders);
  SetGridHeaders(ENResponsibles2FINContractsHeaders, sgENResponsibles2FINContracts.ColumnHeaders);

  UpdateResponsiblesList;
  UpdateFINContractsList;
  UpdateENResponsibles2FINContractsList;

{
  if DialogState = dsView then
  begin
//     DisableControls([
    DisableControls([
      edtFINContractsFinContractsName
      ,spbFINContractsFinContracts
       ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENResponsibles2FINContractsObj.code);

    edtFINContractsFinContractsName.Text := ENResponsibles2FINContractsObj.finContracts.name;

  end;
}  
end;



procedure TfrmOMTSResponsiblesEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempENResponsibles2FINContracts: ENResponsibles2FINContractsControllerSoapPort;
begin
{
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENResponsibles2FINContracts := HTTPRIOENResponsibles2FINContracts as ENResponsibles2FINContractsControllerSoapPort;


    if DialogState = dsInsert then
    begin
      ENResponsibles2FINContractsObj.code:=low(Integer);
      TempENResponsibles2FINContracts.add(ENResponsibles2FINContractsObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENResponsibles2FINContracts.save(ENResponsibles2FINContractsObj);
    end;
  end;
}  
end;


procedure TfrmOMTSResponsiblesEdit.spbFINContractsFinContractsClick(Sender : TObject);
//var
//   frmFINContractsShow: TfrmFINContractsShow;
begin
{
   frmFINContractsShow:=TfrmFINContractsShow.Create(Application,fmNormal);
   try
      with frmFINContractsShow do
        if ShowModal = mrOk then
        begin
            try
               if ENResponsibles2FINContractsObj.finContracts = nil then ENResponsibles2FINContractsObj.finContracts := FINContracts.Create();
               ENResponsibles2FINContractsObj.finContracts.code := StrToInt(GetReturnValue(sgFINContracts,0));
               edtFINContractsFinContractsName.Text:=GetReturnValue(sgFINContracts,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINContractsShow.Free;
   end;
}
end;

procedure TfrmOMTSResponsiblesEdit.actUpdateResponsiblesExecute(
  Sender: TObject);
begin
  UpdateResponsiblesList;
end;

procedure TfrmOMTSResponsiblesEdit.actInsertResponsiblesExecute(
  Sender: TObject);
begin
  ENResponsiblesObj := ENResponsibles.Create;
  try
    SetNullIntProps(ENResponsiblesObj);
    SetNullXSProps(ENResponsiblesObj);

    ENResponsiblesObj.kindRef := ENResponsiblesKindRef.Create;
    ENResponsiblesObj.kindRef.code := ENRESPONSIBLESKIND_OMTS;

    frmENResponsiblesEdit := TfrmENResponsiblesEdit.Create(Application, dsInsert);
    try
      if frmENResponsiblesEdit.ShowModal = mrOk then
      begin
        if ENResponsiblesObj <> nil then
          actUpdateResponsiblesExecute(Sender);
      end;
    finally
      frmENResponsiblesEdit.Free;
      frmENResponsiblesEdit:=nil;
    end;
  finally
    ENResponsiblesObj.Free;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.sgENResponsiblesTopLeftChanged(
  Sender: TObject);
var
  TempENResponsibles: ENResponsiblesControllerSoapPort;
  i, CurrentRow: Integer;
  ENResponsiblesList: ENResponsiblesShortList;
  ENResponsiblesFilterObj: ENResponsiblesFilter;
begin
  if RespLastCount < 99 then Exit;

  if (sgENResponsibles.TopRow + sgENResponsibles.VisibleRowCount) = RespColCount then
  begin
    TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
    CurrentRow := sgENResponsibles.RowCount;

    {
    if FilterObject = nil then
    begin
       FilterObject := ENResponsiblesFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;
    }

    ENResponsiblesFilterObj := ENResponsiblesFilter.Create;
    SetNullIntProps(ENResponsiblesFilterObj);
    SetNullXSProps(ENResponsiblesFilterObj);

    ENResponsiblesFilterObj.orderBySQL := 'FIO';

    ENResponsiblesList := TempENResponsibles.getScrollableFilteredList(ENResponsiblesFilterObj, RespColCount - 1, 100);

    sgENResponsibles.RowCount := sgENResponsibles.RowCount + 100;

    RespLastCount := High(ENResponsiblesList.list);
    with sgENResponsibles do
      for i := 0 to RespLastCount do
      begin
        Application.ProcessMessages;
        if ENResponsiblesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENResponsiblesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENResponsiblesList.list[i].FIO;
        if ENResponsiblesList.list[i].tabNumber = '' then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENResponsiblesList.list[i].tabNumber;
        Cells[3,i+CurrentRow] := ENResponsiblesList.list[i].position;
        {
        Cells[4,i+CurrentRow] := ENResponsiblesList.list[i].depName;
        Cells[5,i+CurrentRow] := ENResponsiblesList.list[i].depCode;
        Cells[6,i+CurrentRow] := ENResponsiblesList.list[i].phone;
        }
        RespLastRow := i + CurrentRow;
      end;

    RespColCount := RespColCount + 100;
    sgENResponsibles.Row := CurrentRow - 5;
    sgENResponsibles.RowCount := RespLastRow + 1;
  end;

end;


procedure TfrmOMTSResponsiblesEdit.UpdateResponsiblesList;
var
  TempENResponsibles: ENResponsiblesControllerSoapPort;
  i: Integer;
  ENResponsiblesList: ENResponsiblesShortList;
  ENResponsiblesFilterObj: ENResponsiblesFilter;
begin
  ClearGrid(sgENResponsibles);

  gbENResponsibles2FINContracts.Caption := 'Зв''язані договори';

  RespColCount := 100;

  TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;

  {
  if FilterObject = nil then
  begin
     FilterObject := ENResponsiblesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  }

  ENResponsiblesFilterObj := ENResponsiblesFilter.Create;
  SetNullIntProps(ENResponsiblesFilterObj);
  SetNullXSProps(ENResponsiblesFilterObj);

  ENResponsiblesFilterObj.orderBySQL := 'FIO';

  ENResponsiblesList := TempENResponsibles.getScrollableFilteredList(ENResponsiblesFilterObj, 0, RespColCount);

  RespLastCount := High(ENResponsiblesList.list);

  if RespLastCount > -1 then
     sgENResponsibles.RowCount := RespLastCount + 2
  else
     sgENResponsibles.RowCount := 2;

  with sgENResponsibles do
    for i := 0 to RespLastCount do
    begin
      Application.ProcessMessages;
      if ENResponsiblesList.list[i].code <> Low(Integer) then
      Cells[0,i+1] := IntToStr(ENResponsiblesList.list[i].code)
      else
      Cells[0,i+1] := '';
      Cells[1,i+1] := ENResponsiblesList.list[i].FIO;
      if ENResponsiblesList.list[i].tabNumber = '' then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := ENResponsiblesList.list[i].tabNumber;
      Cells[3,i+1] := ENResponsiblesList.list[i].position;
      {
      Cells[4,i+1] := ENResponsiblesList.list[i].depName;
      Cells[5,i+1] := ENResponsiblesList.list[i].depCode;
      Cells[6,i+1] := ENResponsiblesList.list[i].phone;
      }
      RespLastRow := i + 1;
      sgENResponsibles.RowCount := RespLastRow + 1;
    end;
    
  RespColCount := RespColCount + 1;
  sgENResponsibles.Row := 1;
  sgENResponsiblesClick(nil);
end;

procedure TfrmOMTSResponsiblesEdit.UpdateFINContractsList;
var
  TempFINContracts: FINContractsControllerSoapPort;
  i: Integer;
  FINContractsList: FINContractsShortList;
  //FINContractsFilterObj: FINContractsFilter;
begin
  ClearGrid(sgFINContracts);

  FINContractsColCount := 100;

  TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;

  {
  if FilterObject = nil then
  begin
     FilterObject := FINContractsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  }

  if FINContractsInnerFilterObj = nil then
  begin
    FINContractsInnerFilterObj := FINContractsFilter.Create;
    SetNullIntProps(FINContractsInnerFilterObj);
    SetNullXSProps(FINContractsInnerFilterObj);

    FINContractsInnerFilterObj.orderBySQL := 'ORGNAME, CONTRACTNUMBER';
  end;

  FINContractsList := TempFINContracts.getScrollableFilteredList(FINContractsInnerFilterObj, 0, FINContractsColCount);

  FINContractsLastCount := High(FINContractsList.list);

  if FINContractsLastCount > -1 then
    sgFINContracts.RowCount := FINContractsLastCount + 2
  else
    sgFINContracts.RowCount := 2;

  with sgFINContracts do
    for i := 0 to FINContractsLastCount do
    begin
      Application.ProcessMessages;
      if FINContractsList.list[i].code <> Low(Integer) then
      Cells[0,i+1] := IntToStr(FINContractsList.list[i].code)
      else
      Cells[0,i+1] := '';

      Cells[1,i+1] := FINContractsList.list[i].orgName;

      Cells[2,i+1] := FINContractsList.list[i].contractNumber;
      if FINContractsList.list[i].contractDate = nil then
        Cells[3,i+1] := ''
      else
        Cells[3,i+1] := XSDate2String(FINContractsList.list[i].contractDate);

      Cells[4,i+1] := FINContractsList.list[i].finDocCode;
      if FINContractsList.list[i].finDocID = Low(Integer) then
        Cells[5,i+1] := ''
      else
        Cells[5,i+1] := IntToStr(FINContractsList.list[i].finDocID);
      FINContractsLastRow := i + 1;
      sgFINContracts.RowCount := FINContractsLastRow + 1;
    end;

  FINContractsColCount := FINContractsColCount + 1;
  sgFINContracts.Row := 1;
end;

procedure TfrmOMTSResponsiblesEdit.actEditResponsiblesExecute(
  Sender: TObject);
var TempENResponsibles: ENResponsiblesControllerSoapPort;
begin
  TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
  try
    ENResponsiblesObj := TempENResponsibles.getObject(StrToInt(sgENResponsibles.Cells[0, sgENResponsibles.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENResponsiblesEdit := TfrmENResponsiblesEdit.Create(Application, dsEdit);
  try
    if frmENResponsiblesEdit.ShowModal = mrOk then
    begin
      //TempENResponsibles.save(ENResponsiblesObj);
      //UpdateGrid(Sender);
      actUpdateResponsiblesExecute(Sender);
    end;
  finally
    frmENResponsiblesEdit.Free;
    frmENResponsiblesEdit:=nil;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actDeleteResponsiblesExecute(
  Sender: TObject);
Var TempENResponsibles: ENResponsiblesControllerSoapPort;
    ObjCode: Integer;
begin
  TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
  try
    ObjCode := StrToInt(sgENResponsibles.Cells[0,sgENResponsibles.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENResponsibles.remove(ObjCode);
    actUpdateResponsiblesExecute(Sender);
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actViewResponsiblesExecute(
  Sender: TObject);
var TempENResponsibles: ENResponsiblesControllerSoapPort;
begin
  TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
  try
    ENResponsiblesObj := TempENResponsibles.getObject(StrToInt(sgENResponsibles.Cells[0, sgENResponsibles.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENResponsiblesEdit := TfrmENResponsiblesEdit.Create(Application, dsView);
  try
    frmENResponsiblesEdit.ShowModal;
  finally
    frmENResponsiblesEdit.Free;
    frmENResponsiblesEdit := nil;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actInsertFINContractsExecute(
  Sender: TObject);
//var
   //frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   //f : ENServicesObjectFilter;
begin
  FINContractsObj := FINContracts.Create;
  try
    SetNullIntProps(FINContractsObj);
    SetNullXSProps(FINContractsObj);

    frmFINContractsEdit := TfrmFINContractsEdit.Create(Application, dsInsert);
    try
      if frmFINContractsEdit.ShowModal = mrOk then
      begin
        if FINContractsObj <> nil then
          actUpdateFINContractsExecute(Sender);
      end;
    finally
      frmFINContractsEdit.Free;
      frmFINContractsEdit:=nil;
    end;
  finally
    //frmFINContractsEdit.Free;
    FINContractsObj.Free;
  end;

(*
// чуть шо добавть группы если не будут нужных договоров
// в ДАО метод getContractList ... сейчас 205 - лабораторные работы
// !!!!
// уже перехало ... юзаеться в клиенте !!! + в Строках Заявки ...

   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);
   f.contractNumber := edtContractNumber.Text;
   //f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (205, 342, 319, 88, 201, 218, 303, 198, 50, 206, 338, 44)';
   f.conditionSQL := 'a.io_flag = ''S'' and a.agree_group_id in (' + AGREES_GROUPS_IDS + ')';

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                edtContractDateFin.DateTime := StrToDate(GetReturnValue(sgFINServicesObject, 2));
                edtContractDateFin.Checked := true;
                edtName.Text := GetReturnValue(sgFINServicesObject, 3);
                edtPartnerCode.Text := GetReturnValue(sgFINServicesObject, 4);
                edtFinDocCode.Text :=  GetReturnValue(sgFINServicesObject, 5);
                edtFinDocID.Text :=  GetReturnValue(sgFINServicesObject, 6);
                edtCommentGen.Text :=  GetReturnValue(sgFINServicesObject, 7);

                if (edtContragentName.Text = '') then
                   edtContragentName.Text := GetReturnValue(sgFINServicesObject, 3);

                ///// 28.07.10
                DisableControls([edtCode
                                 ,edtContractDateFin
                                 ,edtName
                                 ,edtPartnerCode
                                 ,edtFinDocCode
                                 ,edtFinDocID
                                 ,edtCommentGen
                                 ,edtContractDateFin //??? че его не было??
                                ]);
                /////
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
*)
end;

procedure TfrmOMTSResponsiblesEdit.actUpdateFINContractsExecute(
  Sender: TObject);
begin
  UpdateFINContractsList;
end;

procedure TfrmOMTSResponsiblesEdit.sgFINContractsTopLeftChanged(
  Sender: TObject);
var
  TempFINContracts: FINContractsControllerSoapPort;
  i, CurrentRow: Integer;
  FINContractsList: FINContractsShortList;
  //FINContractsFilterObj: FINContractsFilter;
begin
  if FINContractsLastCount < 99 then Exit;

  if (sgFINContracts.TopRow + sgFINContracts.VisibleRowCount) = FINContractsColCount then
  begin
    TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
    CurrentRow := sgFINContracts.RowCount;

    {
    if FilterObject = nil then
    begin
       FilterObject := FINContractsFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;
    }
    
    if FINContractsInnerFilterObj = nil then
    begin
      FINContractsInnerFilterObj := FINContractsFilter.Create;
      SetNullIntProps(FINContractsInnerFilterObj);
      SetNullXSProps(FINContractsInnerFilterObj);

      FINContractsInnerFilterObj.orderBySQL := 'ORGNAME, CONTRACTNUMBER';
    end;

    FINContractsList := TempFINContracts.getScrollableFilteredList(FINContractsInnerFilterObj, FINContractsColCount - 1, 100);

    sgFINContracts.RowCount := sgFINContracts.RowCount + 100;

    FINContractsLastCount := High(FINContractsList.list);
    with sgFINContracts do
      for i := 0 to FINContractsLastCount do
      begin
        Application.ProcessMessages;
        if FINContractsList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(FINContractsList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := FINContractsList.list[i].orgName;

        Cells[2,i+CurrentRow] := FINContractsList.list[i].contractNumber;
        if FINContractsList.list[i].contractDate = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := XSDate2String(FINContractsList.list[i].contractDate);

        Cells[4,i+CurrentRow] := FINContractsList.list[i].finDocCode;
        if FINContractsList.list[i].finDocID = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(FINContractsList.list[i].finDocID);
        FINContractsLastRow := i + CurrentRow;
      end;

    FINContractsColCount := FINContractsColCount + 100;
    sgFINContracts.Row := CurrentRow - 5;
    sgFINContracts.RowCount := FINContractsLastRow + 1;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actViewFINContractsExecute(
  Sender: TObject);
var TempFINContracts: FINContractsControllerSoapPort;
begin
  TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
  try
    FINContractsObj := TempFINContracts.getObject(StrToInt(sgFINContracts.Cells[0, sgFINContracts.Row]));
  except
    on EConvertError do Exit;
  end;

  frmFINContractsEdit := TfrmFINContractsEdit.Create(Application, dsView);
  try
    frmFINContractsEdit.ShowModal;
  finally
    frmFINContractsEdit.Free;
    frmFINContractsEdit := nil;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actDeleteFINContractsExecute(
  Sender: TObject);
var TempFINContracts: FINContractsControllerSoapPort;
    ObjCode: Integer;
begin
  TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
  try
    ObjCode := StrToInt(sgFINContracts.Cells[0,sgFINContracts.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempFINContracts.remove(ObjCode);
    actUpdateFINContractsExecute(Sender);
  end;
end;

procedure TfrmOMTSResponsiblesEdit.UpdateFINContractsListByResponsible(
  ResponsibleCode: Integer);
var
  TempENResponsibles2FINContracts: ENResponsibles2FINContractsControllerSoapPort;
  i, LastCount: Integer;
  ENResponsibles2FINContractsList: ENResponsibles2FINContractsShortList;
  Resp2ContractsFilter: ENResponsibles2FINContractsFilter;
begin
  ClearGrid(sgENResponsibles2FINContracts);

  if ResponsibleCode = LOW_INT then Exit;

  TempENResponsibles2FINContracts := HTTPRIOENResponsibles2FINContracts as ENResponsibles2FINContractsControllerSoapPort;

  {
  if FilterObject = nil then
  begin
     FilterObject := ENResponsibles2FINContractsFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;
  }
  Resp2ContractsFilter := ENResponsibles2FINContractsFilter.Create;
  SetNullIntProps(Resp2ContractsFilter);
  SetNullXSProps(Resp2ContractsFilter);

  Resp2ContractsFilter.responsiblesRef := ENResponsiblesRef.Create;
  Resp2ContractsFilter.responsiblesRef.code := ResponsibleCode;

  ENResponsibles2FINContractsList := TempENResponsibles2FINContracts.getScrollableFilteredList(Resp2ContractsFilter, 0, -1);

  LastCount := High(ENResponsibles2FINContractsList.list);

  if LastCount > -1 then
    sgENResponsibles2FINContracts.RowCount := LastCount + 2
  else
    sgENResponsibles2FINContracts.RowCount := 2;

  with sgENResponsibles2FINContracts do
  for i:=0 to LastCount do
  begin
    //Application.ProcessMessages;
    if ENResponsibles2FINContractsList.list[i].code <> Low(Integer) then
      Cells[0,i+1] := IntToStr(ENResponsibles2FINContractsList.list[i].code)
    else
      Cells[0,i+1] := '';

    Cells[1,i+1] := ENResponsibles2FINContractsList.list[i].finContractsOrgName;

    Cells[2,i+1] := ENResponsibles2FINContractsList.list[i].finContractsContractNumber;
    if ENResponsibles2FINContractsList.list[i].finContractsContractDate = nil then
      Cells[3,i+1] := ''
    else
      Cells[3,i+1] := XSDate2String(ENResponsibles2FINContractsList.list[i].finContractsContractDate);
    Cells[4,i+1] := ENResponsibles2FINContractsList.list[i].finContractsFinDocCode;
    if ENResponsibles2FINContractsList.list[i].finContractsFinDocID = Low(Integer) then
      Cells[5,i+1] := ''
    else
      Cells[5,i+1] := IntToStr(ENResponsibles2FINContractsList.list[i].finContractsFinDocID);

    sgENResponsibles2FINContracts.RowCount := i + 2;
  end;

  sgENResponsibles2FINContracts.Row := 1;
end;

procedure TfrmOMTSResponsiblesEdit.sgENResponsiblesClick(
  Sender: TObject);
begin
  UpdateENResponsibles2FINContractsList;
end;

procedure TfrmOMTSResponsiblesEdit.actInsertResp2ContractExecute(
  Sender: TObject);
var respCode, finContractCode: Integer;
begin
  ENResponsibles2FINContractsObj := ENResponsibles2FINContracts.Create;
  try
    SetNullIntProps(ENResponsibles2FINContractsObj);
    SetNullXSProps(ENResponsibles2FINContractsObj);

    frmENResponsibles2FINContractsEdit := TfrmENResponsibles2FINContractsEdit.Create(Application, dsInsert);
    try
      try
        respCode := StrToInt(sgENResponsibles.Cells[0, sgENResponsibles.Row]);

        ENResponsibles2FINContractsObj.responsiblesRef := ENResponsiblesRef.Create;
        ENResponsibles2FINContractsObj.responsiblesRef.code := respCode;

        frmENResponsibles2FINContractsEdit.edtENResponsibles.Text := sgENResponsibles.Cells[1, sgENResponsibles.Row];
      except
        on EConvertError do ; //Exit;
      end;

      try
        finContractCode := StrToInt(sgFINContracts.Cells[0, sgFINContracts.Row]);

        ENResponsibles2FINContractsObj.finContracts := FINContracts.Create;
        ENResponsibles2FINContractsObj.finContracts.code := finContractCode;

        //frmENResponsibles2FINContractsEdit.edtFINContracts.Text := sgFINContracts.Cells[1, sgFINContracts.Row];
        frmENResponsibles2FINContractsEdit.edtFINContracts.Text := sgFINContracts.Cells[2, sgFINContracts.Row] +
                                                                   ' (' + sgFINContracts.Cells[1, sgFINContracts.Row] + ')';
      except
        on EConvertError do ; //Exit;
      end;


      if frmENResponsibles2FINContractsEdit.ShowModal = mrOk then
      begin
        actUpdateResp2ContractExecute(Sender);
      end;
    finally
      frmENResponsibles2FINContractsEdit.Free;
    end;
  finally
    ENResponsibles2FINContractsObj.Free;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.UpdateENResponsibles2FINContractsList;
var respCode: Integer;
    respFIO: String;
begin
  gbENResponsibles2FINContracts.Caption := 'Зв''язані договори';
  
  try
    respCode := StrToInt(sgENResponsibles.Cells[0, sgENResponsibles.Row]);
  except
    on EConvertError do Exit;
  end;

  respFIO := sgENResponsibles.Cells[1, sgENResponsibles.Row];

  if respFIO <> '' then
    gbENResponsibles2FINContracts.Caption := 'Зв''язані договори (відп. особа: ' + respFIO + ')'
  else
    gbENResponsibles2FINContracts.Caption := 'Зв''язані договори';
    
  UpdateFINContractsListByResponsible(respCode);
end;

procedure TfrmOMTSResponsiblesEdit.actEditResp2ContractExecute(
  Sender: TObject);
var TempENResponsibles2FINContracts: ENResponsibles2FINContractsControllerSoapPort;
begin
  TempENResponsibles2FINContracts := HTTPRIOENResponsibles2FINContracts as ENResponsibles2FINContractsControllerSoapPort;
  try
    ENResponsibles2FINContractsObj := TempENResponsibles2FINContracts.getObject(StrToInt(sgENResponsibles2FINContracts.Cells[0, sgENResponsibles2FINContracts.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENResponsibles2FINContractsEdit := TfrmENResponsibles2FINContractsEdit.Create(Application, dsEdit);
  try
    if frmENResponsibles2FINContractsEdit.ShowModal= mrOk then
    begin
      actUpdateResp2ContractExecute(Sender);
    end;
  finally
    frmENResponsibles2FINContractsEdit.Free;
    frmENResponsibles2FINContractsEdit := nil;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actViewResp2ContractExecute(
  Sender: TObject);
var TempENResponsibles2FINContracts: ENResponsibles2FINContractsControllerSoapPort;
begin
  TempENResponsibles2FINContracts := HTTPRIOENResponsibles2FINContracts as ENResponsibles2FINContractsControllerSoapPort;
  try
    ENResponsibles2FINContractsObj := TempENResponsibles2FINContracts.getObject(StrToInt(sgENResponsibles2FINContracts.Cells[0, sgENResponsibles2FINContracts.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENResponsibles2FINContractsEdit := TfrmENResponsibles2FINContractsEdit.Create(Application, dsView);
  try
    frmENResponsibles2FINContractsEdit.ShowModal;
  finally
    frmENResponsibles2FINContractsEdit.Free;
    frmENResponsibles2FINContractsEdit := nil;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actDeleteResp2ContractExecute(
  Sender: TObject);
var TempENResponsibles2FINContracts: ENResponsibles2FINContractsControllerSoapPort;
    ObjCode: Integer;
begin
  TempENResponsibles2FINContracts := HTTPRIOENResponsibles2FINContracts as ENResponsibles2FINContractsControllerSoapPort;
  try
    ObjCode := StrToInt(sgENResponsibles2FINContracts.Cells[0,sgENResponsibles2FINContracts.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити запис?'),
                            PChar('Увага!'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
  begin
    TempENResponsibles2FINContracts.remove(ObjCode);
    actUpdateResp2ContractExecute(Sender);
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actUpdateResp2ContractExecute(
  Sender: TObject);
begin
  UpdateENResponsibles2FINContractsList;
end;

procedure TfrmOMTSResponsiblesEdit.actFilterFINContractsExecute(
  Sender: TObject);
begin
  frmFINContractsFilterEdit := TfrmFINContractsFilterEdit.Create(Application, dsInsert);
  try
    FINContractsFilterObj := FINContractsFilter.Create;
    SetNullIntProps(FINContractsFilterObj);
    SetNullXSProps(FINContractsFilterObj);

    FINContractsFilterObj.orderBySQL := 'ORGNAME, CONTRACTNUMBER';

    if frmFINContractsFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := FINContractsFilter.Create;
      //FilterObject := FINContractsFilterObj;
      FINContractsInnerFilterObj := FINContractsFilterObj;
      actUpdateFINContractsExecute(Sender);
    end;
  finally
    frmFINContractsFilterEdit.Free;
    frmFINContractsFilterEdit := nil;
  end;
end;

procedure TfrmOMTSResponsiblesEdit.actNoFilterFINContractsExecute(
  Sender: TObject);
begin
  FINContractsInnerFilterObj.Free;
  FINContractsInnerFilterObj := nil;
  actUpdateFINContractsExecute(Sender);
end;

procedure TfrmOMTSResponsiblesEdit.FormDestroy(Sender: TObject);
begin
  if Assigned(FINContractsInnerFilterObj) then
  begin
    FINContractsInnerFilterObj.Free;
    FINContractsInnerFilterObj := nil;
  end;
end;

end.
