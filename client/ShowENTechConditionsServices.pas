
unit ShowENTechConditionsServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTechConditionsServicesController  , ENTechConditionsObjectsController,
  AdvObj;


type
  TfrmENTechConditionsServicesShow = class(TChildForm)
    ImageList1: TImageList;
    sgENTechConditionsServices: TAdvStringGrid;
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
    actSigned: TAction;
    actUnSigned: TAction;
    miN5: TMenuItem;
    miSigned: TMenuItem;
    miUnSigned: TMenuItem;
    actCompleted: TAction;
    actUnCompleted: TAction;
    miCompleted: TMenuItem;
    miN6: TMenuItem;
    N5: TMenuItem;
    actBind2CNPack: TAction;
    EnergyWorkflow1: TMenuItem;
    HTTPRIOENTechConditionsServices: THTTPRIO;
    btnExportExcel: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENTechConditionsServicesTopLeftChanged(Sender: TObject);
procedure sgENTechConditionsServicesDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure actSignedExecute(Sender: TObject);
    procedure actUnSignedExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actCompletedExecute(Sender: TObject);
    procedure actUnCompletedExecute(Sender: TObject);
    procedure actBind2CNPackExecute(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);

  private
   { Private declarations }
   procedure ClearFilter;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENTechConditionsServicesObj: ENTechConditionsServices;
 // ENTechConditionsServicesFilterObj: ENTechConditionsServicesFilter;
  
  
implementation

uses Main, EditENTechConditionsServices, EditENTechConditionsServicesFilter,
  ENConsts, ENTechConditionsServicesTypeController,
  EditENTechConditionsServices2CNPack, ComObj, ENConnectionKindController;


{$R *.dfm}

var
  //frmENTechConditionsServicesShow : TfrmENTechConditionsServicesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTechConditionsServicesHeaders: array [1..16] of String =
       ( 'Код'
          ,'Порядковий № дог.'
          ,'Дата дог.(порядковий)'
          ,'№ дог. фін.кол.'
          ,'Дата дог. фін.кол.'
          ,'Замовник'
          ,'Код замовника'
          ,'Вид договора'                                                                                                                              
          ,'Підрозділ'
          ,'Тип договору'
          ,'Статус договору'
          ,'Примітка'
          ,'Відповідальна особа'
          ,'Код пакета з EnergyWorkflow'
          ,'Підсистема EnergyWorkflow'
          ,'Кінцева дата вик.робіт '

//          ,'Номер договору у фін.кол.'
//          ,'Дата договору у фін.кол.'
//          ,'Найменування організації'
//          ,'код організації'
//          ,'код договору у фін.кол.'
//          ,'PK договору у фін.кол.'
//          ,'Примітка'
//          ,'Адрес места проведения работ'
//          ,'Розрахунковий рахунок замовника'
//          ,'Найменування банку замовника'
//          ,'МФО банку замовника'
//          ,'Керівник'
//          ,'Паспортні дані замовника'
//          ,'Сумма передплати'
//          ,'Потужність за договором'
//          ,'Примітка до договору на ТУ'
//          ,'пользователь внесший изменение'
//          ,'дата последнего изменения'
//          ,'Дата довіреності замовника'
//          ,'№ довіреності замовника'
//          ,'П.І.Б довіреної особи замовника'
        );
   

procedure TfrmENTechConditionsServicesShow.FormClose(Sender: TObject; var Action: TCloseAction);
var
  typeCode, kindCode : Integer;
begin
  if (FormMode = fmChild) and (FilterObject <> nil) then
  begin
    typeCode := ENTechConditionsServicesFilter(FilterObject).techCondServicesType.code;
    kindCode := ENTechConditionsServicesFilter(FilterObject).connectionKindRef.code;

    if typeCode = ENTECHCONDITIONSSERVICES_TYPE_PROJECT then
      frmENTechConditionsServicesProjectShow := nil;

    if (typeCode = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
         and (kindCode = ENCONNECTIONKIND_NO_STANDART) then
      frmENTechConditionsRealizationNoStandartShow := nil;

    if (typeCode = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION)
         and (kindCode = ENCONNECTIONKIND_STANDART) then
      frmENTechConditionsRealizationStandartShow := nil;

  end;
  
  inherited;
end;


procedure TfrmENTechConditionsServicesShow.FormShow(Sender: TObject);
var
  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  i: Integer;
  ENTechConditionsServicesList: ENTechConditionsServicesShortList;

  // TempENTechConditionsObject: ENTechConditionsObjectsControllerSoapPort;
  // ENTechConditionsList: ENTechConditionsObjectsShortList;
  // fTy : ENTechConditionsObjectsFilter;

  begin
  SetGridHeaders(ENTechConditionsServicesHeaders, sgENTechConditionsServices.ColumnHeaders);
  ColCount:=100;
  TempENTechConditionsServices :=  HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENTechConditionsServicesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     // 15.05.2013 +++ откинем новые договора на присоединение
     ENTechConditionsServicesFilter(FilterObject).conditionSQL := ' code not in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t)';
     ENTechConditionsServicesFilter(FilterObject).orderBySQL := 'cast(contractnumber as integer) desc';
  end;

  ENTechConditionsServicesList := TempENTechConditionsServices.getScrollableFilteredList(ENTechConditionsServicesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTechConditionsServicesList.list);

  if LastCount > -1 then
     sgENTechConditionsServices.RowCount:=LastCount+2
  else
     sgENTechConditionsServices.RowCount:=2;

   with sgENTechConditionsServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTechConditionsServicesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTechConditionsServicesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTechConditionsServicesList.list[i].contractNumber;
        if ENTechConditionsServicesList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENTechConditionsServicesList.list[i].contractDate);

        Cells[3,i+1] := ENTechConditionsServicesList.list[i].finContractNumber;
        if ENTechConditionsServicesList.list[i].finContractDate = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDate2String(ENTechConditionsServicesList.list[i].finContractDate);


        Cells[5,i+1] := ENTechConditionsServicesList.list[i].contragentName;
        Cells[6,i+1] := ENTechConditionsServicesList.list[i].contragentOkpo;

        Cells[7,i+1] := ENTechConditionsServicesList.list[i].contragentFormName;
        Cells[8,i+1] := ENTechConditionsServicesList.list[i].departmentShortName ;
        Cells[9,i+1] := ENTechConditionsServicesList.list[i].techCondServicesTypeName;
        Cells[10,i+1] := ENTechConditionsServicesList.list[i].techCondServicesStatusName;
        Cells[11,i+1] := ENTechConditionsServicesList.list[i].commentServicesGen;

        Cells[12,i+1] := ENTechConditionsServicesList.list[i].techCondResponsiblesRefResponsibleFIO;

        if ENTechConditionsServicesList.list[i].cnPackCode <> Low(Integer) then
          Cells[13,i+1] := IntToStr(ENTechConditionsServicesList.list[i].cnPackCode)
        else
          Cells[13,i+1] := '';

        Cells[14,i+1] := ENTechConditionsServicesList.list[i].cnSubsystemTypeRefName;

        if ENTechConditionsServicesList.list[i].dateEndPriconnection = nil then
          Cells[15,i+1] := ''
        else
          Cells[15,i+1] := XSDate2String(ENTechConditionsServicesList.list[i].dateEndPriconnection);

        LastRow:=i+1;
        sgENTechConditionsServices.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTechConditionsServices.Row:=1;
end;

procedure TfrmENTechConditionsServicesShow.sgENTechConditionsServicesTopLeftChanged(Sender: TObject);
var
  TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  i,CurrentRow: Integer;
  ENTechConditionsServicesList: ENTechConditionsServicesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTechConditionsServices.TopRow + sgENTechConditionsServices.VisibleRowCount) = ColCount
  then
    begin
      TempENTechConditionsServices :=  HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
      CurrentRow:=sgENTechConditionsServices.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENTechConditionsServicesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
     // 15.05.2013 +++ откинем новые договора на присоединение
     ENTechConditionsServicesFilter(FilterObject).conditionSQL := ' code not in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t)';
     ENTechConditionsServicesFilter(FilterObject).orderBySQL := 'cast(contractnumber as integer) desc';
  end;

  ENTechConditionsServicesList := TempENTechConditionsServices.getScrollableFilteredList(ENTechConditionsServicesFilter(FilterObject),ColCount-1, 100);



  sgENTechConditionsServices.RowCount:=sgENTechConditionsServices.RowCount+100;
  LastCount:=High(ENTechConditionsServicesList.list);
  with sgENTechConditionsServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTechConditionsServicesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTechConditionsServicesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTechConditionsServicesList.list[i].contractNumber;
        if ENTechConditionsServicesList.list[i].contractDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENTechConditionsServicesList.list[i].contractDate);

        Cells[3,i+CurrentRow] := ENTechConditionsServicesList.list[i].finContractNumber;
        if ENTechConditionsServicesList.list[i].finContractDate = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDate2String(ENTechConditionsServicesList.list[i].finContractDate);

        Cells[5,i+CurrentRow] := ENTechConditionsServicesList.list[i].contragentName;
        Cells[6,i+CurrentRow] := ENTechConditionsServicesList.list[i].contragentOkpo;

        Cells[7,i+CurrentRow] := ENTechConditionsServicesList.list[i].contragentFormName;
        Cells[8,i+CurrentRow] := ENTechConditionsServicesList.list[i].departmentShortName ;
        Cells[9,i+CurrentRow] := ENTechConditionsServicesList.list[i].techCondServicesTypeName;
        Cells[10,i+CurrentRow] := ENTechConditionsServicesList.list[i].techCondServicesStatusName;
        Cells[11,i+CurrentRow] := ENTechConditionsServicesList.list[i].commentServicesGen;

        Cells[12,i+CurrentRow] := ENTechConditionsServicesList.list[i].techCondResponsiblesRefResponsibleFIO;

        if ENTechConditionsServicesList.list[i].cnPackCode <> Low(Integer) then
          Cells[13,i+CurrentRow] := IntToStr(ENTechConditionsServicesList.list[i].cnPackCode)
        else
          Cells[13,i+CurrentRow] := '';

        Cells[14,i+CurrentRow] := ENTechConditionsServicesList.list[i].cnSubsystemTypeRefName;

         if ENTechConditionsServicesList.list[i].dateEndPriconnection = nil then
          Cells[15,i+CurrentRow] := ''
        else
          Cells[15,i+CurrentRow] := XSDate2String(ENTechConditionsServicesList.list[i].dateEndPriconnection);

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTechConditionsServices.Row:=CurrentRow-5;
   sgENTechConditionsServices.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTechConditionsServicesShow.sgENTechConditionsServicesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTechConditionsServices,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTechConditionsServices.RowCount-1 do
   for j:=0 to sgENTechConditionsServices.ColCount-1 do
     sgENTechConditionsServices.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTechConditionsServicesShow.actViewExecute(Sender: TObject);
Var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
begin
 TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
   try
     ENTechConditionsServicesObj := TempENTechConditionsServices.getObject(StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTechConditionsServicesEdit:=TfrmENTechConditionsServicesEdit.Create(Application, dsView);
  frmENTechConditionsServicesEdit.Caption := Self.Caption;
  try
    frmENTechConditionsServicesEdit.ShowModal;
  finally
    frmENTechConditionsServicesEdit.Free;
    frmENTechConditionsServicesEdit:=nil;
  end;
end;

procedure TfrmENTechConditionsServicesShow.actEditExecute(Sender: TObject);
Var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
begin
 TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
   try
     ENTechConditionsServicesObj := TempENTechConditionsServices.getObject(StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]));
   except
   on EConvertError do Exit;
  end;

  if (ENTechConditionsServicesObj.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_COMPLETED) then
  begin
    Application.MessageBox(PChar('Договір, в статусі "Завершений", редагувати не можна!'), PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if  ENTechConditionsServicesObj.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_SIGNED then
  frmENTechConditionsServicesEdit:=TfrmENTechConditionsServicesEdit.Create(Application, dsView)
  else
  frmENTechConditionsServicesEdit:=TfrmENTechConditionsServicesEdit.Create(Application, dsEdit);
  frmENTechConditionsServicesEdit.Caption := Self.Caption;
  try
    if frmENTechConditionsServicesEdit.ShowModal= mrOk then
      begin
        //TempENTechConditionsServices.save(ENTechConditionsServicesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTechConditionsServicesEdit.Free;
    frmENTechConditionsServicesEdit:=nil;
  end;
end;

procedure TfrmENTechConditionsServicesShow.actDeleteExecute(Sender: TObject);
Var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Договір про виконання технічних умов) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTechConditionsServices.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesShow.actInsertExecute(Sender: TObject);
Var TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
testCaption : string;
begin

  if FilterObject = nil then Exit;

 // TempENTechConditionsServices := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  ENTechConditionsServicesObj:=ENTechConditionsServices.Create;
  SetNullIntProps(ENTechConditionsServicesObj);
  SetNullXSProps(ENTechConditionsServicesObj);

   //ENTechConditionsServicesObj.contractDate:= TXSDate.Create;
   //ENTechConditionsServicesObj.finContractDate:= TXSDate.Create;
   //ENTechConditionsServicesObj.tyServicesSumma:= TXSDecimal.Create;
   //ENTechConditionsServicesObj.tyServicesPower:= TXSDecimal.Create;
   //ENTechConditionsServicesObj.dateEdit:= TXSDate.Create;
   //ENTechConditionsServicesObj.warrantDate:= TXSDate.Create;    
   //  testCaption := 
  try
    frmENTechConditionsServicesEdit:=TfrmENTechConditionsServicesEdit.Create(Application, dsInsert);

    try
      frmENTechConditionsServicesEdit.Caption := Self.Caption;

      ENTechConditionsServicesObj.techCondServicesType := ENTechConditionsServicesType.Create;
      ENTechConditionsServicesObj.techCondServicesType.code := ENTechConditionsServicesFilter(FilterObject).techCondServicesType.code;

      ENTechConditionsServicesObj.connectionKindRef := ENConnectionKindRef.Create;
      ENTechConditionsServicesObj.connectionKindRef.code := ENTechConditionsServicesFilter(FilterObject).connectionKindRef.code;

      if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_PROJECT then
         frmENTechConditionsServicesEdit.edtENTechConditionsServicesTypeTechCondServicesTypeName.Text := 'Проектування';
      if ENTechConditionsServicesObj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION then
         frmENTechConditionsServicesEdit.edtENTechConditionsServicesTypeTechCondServicesTypeName.Text := 'Реалізація';


      if frmENTechConditionsServicesEdit.ShowModal = mrOk then
      begin
        if ENTechConditionsServicesObj<>nil then
        begin
          //TempENTechConditionsServices.add(ENTechConditionsServicesObj);

          // Откроем только что добавленный договор сразу на редактирование
          if frmENTechConditionsServicesEdit.techConditionsServicesCode <> LOW_INT then
          begin
            {
            FilterObject := ENTechConditionsServicesFilter.Create;
            SetNullIntProps(FilterObject);
            SetNullXSProps(FilterObject);
            }
            ClearFilter;
            ENTechConditionsServicesFilter(FilterObject).code := frmENTechConditionsServicesEdit.techConditionsServicesCode;
            //ENTechConditionsServicesFilter(FilterObject).orderBySQL := 'cast(contractnumber as integer) desc';
            actUpdateExecute(Sender);
            sgENTechConditionsServices.Row := 1;

            actEditExecute(Sender);

            Exit;
          end;

          UpdateGrid(Sender);
        end;
      end;
    finally
      frmENTechConditionsServicesEdit.Free;
      frmENTechConditionsServicesEdit:=nil;
    end;
  finally
    ENTechConditionsServicesObj.Free;
  end;
end;

procedure TfrmENTechConditionsServicesShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmENTechConditionsServicesShow.actFilterExecute(Sender: TObject);
var typeCode, connectionKindCode : Integer;
begin
  typeCode := -1;
  connectionKindCode := -1;

  frmENTechConditionsServicesFilterEdit:=TfrmENTechConditionsServicesFilterEdit.Create(Application, dsInsert);
  try
    frmENTechConditionsServicesFilterEdit.Caption := Self.Caption;

    ENTechConditionsServicesFilterObj := ENTechConditionsServicesFilter.Create;
    SetNullIntProps(ENTechConditionsServicesFilterObj);
    SetNullXSProps(ENTechConditionsServicesFilterObj);

    if FilterObject <> nil then
     if ENTechConditionsServicesFilter(FilterObject).techCondServicesType <> nil then
        typeCode := ENTechConditionsServicesFilter(FilterObject).techCondServicesType.code;

    if FilterObject <> nil then
     if ENTechConditionsServicesFilter(FilterObject).connectionKindRef <> nil then
        connectionKindCode := ENTechConditionsServicesFilter(FilterObject).connectionKindRef.code;

    ENTechConditionsServicesFilterObj.techCondServicesType := ENTechConditionsServicesType.Create;
    ENTechConditionsServicesFilterObj.techCondServicesType.code := typeCode;

    ENTechConditionsServicesFilterObj.connectionKindRef := ENConnectionKindRef.Create;
    ENTechConditionsServicesFilterObj.connectionKindRef.code := connectionKindCode;

    if frmENTechConditionsServicesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTechConditionsServicesFilter.Create;
      FilterObject := ENTechConditionsServicesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTechConditionsServicesFilterEdit.Free;
    frmENTechConditionsServicesFilterEdit:=nil;
  end;
end;

procedure TfrmENTechConditionsServicesShow.actNoFilterExecute(Sender: TObject);
//var typeCode: Integer;
begin
{
  typeCode := LOW_INT;

  if FilterObject <> nil then
    if ENTechConditionsServicesFilter(FilterObject).techCondServicesType <> nil then
      typeCode := ENTechConditionsServicesFilter(FilterObject).techCondServicesType.code;

  FilterObject.Free;
  FilterObject := nil;

  FilterObject := ENTechConditionsServicesFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  ENTechConditionsServicesFilter(FilterObject).techCondServicesType := ENTechConditionsServicesType.Create();
  ENTechConditionsServicesFilter(FilterObject).techCondServicesType.code := typeCode;
}

  ClearFilter;
  UpdateGrid(Sender);
  
{
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
}
end;

procedure TfrmENTechConditionsServicesShow.actSignedExecute(
  Sender: TObject);
var TempENTechConditionsServicesObject : ENTechConditionsServicesControllerSoapPort;
    objCode : Integer;
    TechConditionsServicesObject : ENTechConditionsServices;

begin

  try
    objCode := StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENTechConditionsServicesObject := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  TechConditionsServicesObject := TempENTechConditionsServicesObject.getObject(objCode);

//  if (TechConditionsServicesObject.contragentName = '') then
//  begin
//    Application.MessageBox(PChar('Не вибрано замовника у договорі!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
//    actEditExecute(Sender);
//    Exit;
//  end;

  // 15.04.13 Эта проверка для нестандартных не нужна - сумма в договоре все равно не печатается
  if TechConditionsServicesObject.connectionKindRef.code = ENCONNECTIONKIND_STANDART then
    if (TechConditionsServicesObject.tySummaGen = nil ) then
    begin
      Application.MessageBox(PChar('Не вказана сума у договорі!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
      actEditExecute(Sender);
      Exit;
    end;

  
  if (TechConditionsServicesObject.finDocID = LOW_INT) then
  begin
    Application.MessageBox(PChar('Не вибрано договір з Фін. Колекції!!!'),PChar('Увага !'),MB_ICONWARNING+MB_OK);
    actEditExecute(Sender);
    Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте підписати договір?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENTechConditionsServicesObject.signed(objCode);

    Application.MessageBox(PChar('Договір підписано...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesShow.actUnSignedExecute(
  Sender: TObject);
var TempENTechConditionsServicesObject : ENTechConditionsServicesControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити підписання договору?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENTechConditionsServicesObject := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

    TempENTechConditionsServicesObject.unSigned(objCode);

    Application.MessageBox(PChar('Підписання відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesShow.PopupMenu1Popup(
  Sender: TObject);
var TechCondServices : ENTechConditionsServices;
    ObjCode : Integer;
    TempENTechConditionsServicesObject : ENTechConditionsServicesControllerSoapPort;
begin

   try
     ObjCode := StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]);
   except
     on EConvertError do Exit;
   end;

   TempENTechConditionsServicesObject := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
   TechCondServices := TempENTechConditionsServicesObject.getObject(objCode);

   if TechCondServices = nil then
   begin
     Exit;
   end;

   actSigned.Enabled := TechCondServices.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_DRAFT;
   actUnSigned.Enabled := TechCondServices.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_SIGNED;
   actCompleted.Enabled := TechCondServices.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_SIGNED;
   actUnCompleted.Enabled := TechCondServices.techCondServicesStatus.code = ENTECHCONDITIONSSERVICES_STATUS_COMPLETED;

end;

procedure TfrmENTechConditionsServicesShow.actCompletedExecute(
  Sender: TObject);
var TempENTechConditionsServicesObject : ENTechConditionsServicesControllerSoapPort;
    objCode : Integer;
    TechConditionsServicesObject : ENTechConditionsServices;

begin

  try
    objCode := StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENTechConditionsServicesObject := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  TechConditionsServicesObject := TempENTechConditionsServicesObject.getObject(objCode);


  if Application.MessageBox(PChar('Ви дійсно бажаєте перевести договір в статус "Завершений"?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin

    TempENTechConditionsServicesObject.completed(objCode);

    Application.MessageBox(PChar('Договір переведено в статус "Завершено"...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesShow.actUnCompletedExecute(
  Sender: TObject);
var TempENTechConditionsServicesObject : ENTechConditionsServicesControllerSoapPort;
    objCode : Integer;
begin

  try
    objCode := StrToInt(sgENTechConditionsServices.Cells[0,sgENTechConditionsServices.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте відмінити переведення договору в статус "Завершений"?'),
                    PChar('Увага !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
    TempENTechConditionsServicesObject := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;

    TempENTechConditionsServicesObject.unCompleted(objCode);

    Application.MessageBox(PChar('Перевод договору в статус "Завершений" відмінено...'), PChar('Повідомлення'), MB_ICONINFORMATION);
    UpdateGrid(Sender);
  end;
end;

procedure TfrmENTechConditionsServicesShow.actBind2CNPackExecute(
  Sender: TObject);
var TempENTechConditionsServicesObject: ENTechConditionsServicesControllerSoapPort;
    objCode, cnPackCode: Integer;
    obj: ENTechConditionsServices;
begin
  try
    objCode := StrToInt(sgENTechConditionsServices.Cells[0, sgENTechConditionsServices.Row]);
  except
    on EConvertError do Exit;
  end;

  TempENTechConditionsServicesObject := HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  obj := TempENTechConditionsServicesObject.getObject(objCode);

  frmENTechConditionsServices2CNPackEdit := TfrmENTechConditionsServices2CNPackEdit.Create(Application, dsEdit);
  try
    frmENTechConditionsServices2CNPackEdit.cnPackCode := obj.cnPackCode;
    if obj.cnSubsystemTypeRef <> nil then
      frmENTechConditionsServices2CNPackEdit.cnSubsystemCode := obj.cnSubsystemTypeRef.code;

    // Для договоров на реализацию фильтранем пакет по № договора
    if obj.techCondServicesType.code = ENTECHCONDITIONSSERVICES_TYPE_REALIZATION then
      frmENTechConditionsServices2CNPackEdit.contractnumber := obj.contractNumber;

    if frmENTechConditionsServices2CNPackEdit.ShowModal = mrOk then
    begin
      TempENTechConditionsServicesObject.bind2CNPack(objCode,
                                                     frmENTechConditionsServices2CNPackEdit.cnPackCode,
                                                     frmENTechConditionsServices2CNPackEdit.cnSubsystemCode);
      actUpdateExecute(Sender);
    end;
  finally
    frmENTechConditionsServices2CNPackEdit.Free;
  end;
end;

procedure TfrmENTechConditionsServicesShow.ClearFilter;
var typeCode, connectionKindCode : Integer;
begin
  typeCode := LOW_INT;
  connectionKindCode := LOW_INT;

  if FilterObject <> nil then
    if ENTechConditionsServicesFilter(FilterObject).techCondServicesType <> nil then
      typeCode := ENTechConditionsServicesFilter(FilterObject).techCondServicesType.code;

  if FilterObject <> nil then
    if ENTechConditionsServicesFilter(FilterObject).connectionKindRef <> nil then
      connectionKindCode := ENTechConditionsServicesFilter(FilterObject).connectionKindRef.code;

  FilterObject.Free;
  FilterObject := nil;

  FilterObject := ENTechConditionsServicesFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);

  ENTechConditionsServicesFilter(FilterObject).techCondServicesType := ENTechConditionsServicesType.Create();
  ENTechConditionsServicesFilter(FilterObject).techCondServicesType.code := typeCode;

  ENTechConditionsServicesFilter(FilterObject).connectionKindRef := ENConnectionKindRef.Create;
  ENTechConditionsServicesFilter(FilterObject).connectionKindRef.code := connectionKindCode;

  // 15.05.2013 +++ откинем новые договора на присоединение
  ENTechConditionsServicesFilter(FilterObject).conditionSQL := ' code not in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t)';
  ENTechConditionsServicesFilter(FilterObject).orderBySQL := 'cast(contractnumber as integer) desc';
end;

procedure TfrmENTechConditionsServicesShow.btnExportExcelClick(
  Sender: TObject);
var
        ExcelApp : OleVariant;
        i, j, lastCount : Integer;
        TempENTechConditionsServices: ENTechConditionsServicesControllerSoapPort;
        ENTechConditionsServicesList: ENTechConditionsServicesShortList;
        filterObj : ENTechConditionsServicesFilter;
begin
  inherited;
try
    filterObj := nil;

  if ENTechConditionsServicesFilter(FilterObject) <> nil then
    filterObj := ENTechConditionsServicesFilter(FilterObject);

    if filterObj = nil then
    begin
       filterObj := ENTechConditionsServicesFilter.Create;
       SetNullIntProps(filterObj);
       SetNullXSProps(filterObj);
       // 15.05.2013 +++ откинем новые договора на присоединение
       ENTechConditionsServicesFilter(filterObj).conditionSQL := ' code not in (select s2t.techcondservrefcode from enservicesobject2techcondtnsservices s2t)';
       ENTechConditionsServicesFilter(filterObj).orderBySQL := 'cast(contractnumber as integer) desc';
    end;

  ExcelApp := CreateOleObject('Excel.Application');

  TempENTechConditionsServices :=  HTTPRIOENTechConditionsServices as ENTechConditionsServicesControllerSoapPort;
  ENTechConditionsServicesList := TempENTechConditionsServices.getScrollableFilteredList(filterObj,0,-1);


  ExcelApp.Workbooks.Add();

        ExcelApp.Cells[1,1].Value := 'Код';
        ExcelApp.Cells[1,2].Value := 'Порядковий № дог.';
        ExcelApp.Cells[1,3].Value := 'Дата дог.(порядковий)';
        ExcelApp.Cells[1,4].Value := '№ дог. фін. кол.';
        ExcelApp.Cells[1,5].Value := 'Дата дог. фін. кол.';
        ExcelApp.Cells[1,6].Value := 'Замовник';
        ExcelApp.Cells[1,7].Value := 'Код замовника';
        ExcelApp.Cells[1,8].Value := 'Вид договора';
        ExcelApp.Cells[1,9].Value := 'Підрозділ';
        ExcelApp.Cells[1,10].Value := 'Тип договору';
        ExcelApp.Cells[1,11].Value := 'Статус договору';
        ExcelApp.Cells[1,12].Value := 'Примітка';
        ExcelApp.Cells[1,13].Value := 'Відповідальна особа';
        ExcelApp.Cells[1,14].Value := 'Код пакета EnergyWorkFlow';
        ExcelApp.Cells[1,15].Value := 'Підсистема EnergyWorkFlow';
        ExcelApp.Cells[1,16].Value := 'Кінцева дата вик. робіт';

        ExcelApp.Cells[1,1].ColumnWidth := 1;  {Ширина колонок}
        ExcelApp.Cells[1,2].ColumnWidth := 15;
        ExcelApp.Cells[1,3].ColumnWidth := 15;
        ExcelApp.Cells[1,4].ColumnWidth := 15;
        ExcelApp.Cells[1,5].ColumnWidth := 15;
        ExcelApp.Cells[1,6].ColumnWidth := 50;
        ExcelApp.Cells[1,7].ColumnWidth := 15;
        ExcelApp.Cells[1,8].ColumnWidth := 15;
        ExcelApp.Cells[1,9].ColumnWidth := 15;
        ExcelApp.Cells[1,10].ColumnWidth := 15;
        ExcelApp.Cells[1,11].ColumnWidth := 15;
        ExcelApp.Cells[1,12].ColumnWidth := 15;
        ExcelApp.Cells[1,13].ColumnWidth := 15;
        ExcelApp.Cells[1,14].ColumnWidth := 15;
        ExcelApp.Cells[1,15].ColumnWidth := 15;
        ExcelApp.Cells[1,16].ColumnWidth := 15;

        ExcelApp.Cells[1,1].WrapText := True;
        ExcelApp.Cells[1,2].WrapText := True;
        ExcelApp.Cells[1,3].WrapText := True;
        ExcelApp.Cells[1,4].WrapText := True;
        ExcelApp.Cells[1,5].WrapText := True;
        ExcelApp.Cells[1,6].WrapText := True;
        ExcelApp.Cells[1,7].WrapText := True;
        ExcelApp.Cells[1,8].WrapText := True;
        ExcelApp.Cells[1,9].WrapText := True;
        ExcelApp.Cells[1,10].WrapText := True;
        ExcelApp.Cells[1,11].WrapText := True;
        ExcelApp.Cells[1,12].WrapText := True;
        ExcelApp.Cells[1,13].WrapText := True;
        ExcelApp.Cells[1,14].WrapText := True;
        ExcelApp.Cells[1,15].WrapText := True;
        ExcelApp.Cells[1,16].WrapText := True;

        lastCount := 16;

        For i := 1 to lastCount do
        begin
          ExcelApp.Cells[1,i].Borders.Item[1].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[1].Weight := 2;
            ExcelApp.Cells[1,i].Borders.Item[2].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[2].Weight := 2;
            ExcelApp.Cells[1,i].Borders.Item[3].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[3].Weight := 2;
            ExcelApp.Cells[1,i].Borders.Item[4].LineStyle := 1;
            ExcelApp.Cells[1,i].Borders.Item[4].Weight := 2;
            ExcelApp.Cells[1,i].Font.Bold := True;
        end;

        lastCount := ENTechConditionsServicesList.totalCount;

      for i:=0 to lastCount - 1 do
      begin
        if ENTechConditionsServicesList.list[i].code <> Low(Integer) then
        ExcelApp.Cells[i+2,1] := IntToStr(ENTechConditionsServicesList.list[i].code)
        else
        ExcelApp.Cells[i+2,1] := '';
        ExcelApp.Cells[i+2,2] := ENTechConditionsServicesList.list[i].contractNumber;
        if ENTechConditionsServicesList.list[i].contractDate = nil then
          ExcelApp.Cells[i+2,3] := ''
        else
          ExcelApp.Cells[i+2,3] := XSDate2String(ENTechConditionsServicesList.list[i].contractDate);

        ExcelApp.Cells[i+2,4] := ENTechConditionsServicesList.list[i].finContractNumber;
        if ENTechConditionsServicesList.list[i].finContractDate = nil then
          ExcelApp.Cells[i+2,5] := ''
        else
          ExcelApp.Cells[i+2,5] := XSDate2String(ENTechConditionsServicesList.list[i].finContractDate);


        ExcelApp.Cells[i+2,6] := ENTechConditionsServicesList.list[i].contragentName;
        ExcelApp.Cells[i+2,7] := ENTechConditionsServicesList.list[i].contragentOkpo;

        ExcelApp.Cells[i+2,8] := ENTechConditionsServicesList.list[i].contragentFormName;
        ExcelApp.Cells[i+2,9] := ENTechConditionsServicesList.list[i].departmentShortName ;
        ExcelApp.Cells[i+2,10] := ENTechConditionsServicesList.list[i].techCondServicesTypeName;
        ExcelApp.Cells[i+2,11] := ENTechConditionsServicesList.list[i].techCondServicesStatusName;
        ExcelApp.Cells[i+2,12] := ENTechConditionsServicesList.list[i].commentServicesGen;

        ExcelApp.Cells[i+2,13] := ENTechConditionsServicesList.list[i].techCondResponsiblesRefResponsibleFIO;

        if ENTechConditionsServicesList.list[i].cnPackCode <> Low(Integer) then
          ExcelApp.Cells[i+2,14] := IntToStr(ENTechConditionsServicesList.list[i].cnPackCode)
        else
          ExcelApp.Cells[i+2,14] := '';

        ExcelApp.Cells[i+2,15] := ENTechConditionsServicesList.list[i].cnSubsystemTypeRefName;

        if ENTechConditionsServicesList.list[i].dateEndPriconnection = nil then
          ExcelApp.Cells[i+2,16] := ''
        else
          ExcelApp.Cells[i+2,16] := XSDate2String(ENTechConditionsServicesList.list[i].dateEndPriconnection);

        ExcelApp.Cells[i+2,1].WrapText := True;
        ExcelApp.Cells[i+2,2].WrapText := True;
        ExcelApp.Cells[i+2,3].WrapText := True;
        ExcelApp.Cells[i+2,4].WrapText := True;
        ExcelApp.Cells[i+2,5].WrapText := True;
        ExcelApp.Cells[i+2,6].WrapText := True;
        ExcelApp.Cells[i+2,7].WrapText := True;
        ExcelApp.Cells[i+2,8].WrapText := True;
        ExcelApp.Cells[i+2,9].WrapText := True;
        ExcelApp.Cells[i+2,10].WrapText := True;
        ExcelApp.Cells[i+2,11].WrapText := True;
        ExcelApp.Cells[i+2,12].WrapText := True;
        ExcelApp.Cells[i+2,13].WrapText := True;
        ExcelApp.Cells[i+2,14].WrapText := True;
        ExcelApp.Cells[i+2,15].WrapText := True;
        ExcelApp.Cells[i+2,16].WrapText := True;

        for j := 1 to 4 do
        begin
              ExcelApp.Cells[i+2,1].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,2].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,3].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,4].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,5].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,6].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,7].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,8].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,9].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,10].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,11].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,12].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,13].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,14].Borders.Item[j].Weight := 2;
              ExcelApp.Cells[i+2,15].Borders.Item[j].LineStyle := 1;
              ExcelApp.Cells[i+2,16].Borders.Item[j].Weight := 2;
        end;

        ExcelApp.Cells[i+2,4].NumberFormat := '@'; {Формат ячейки - текст}
        ExcelApp.Cells[i+2,4].HorizontalAlignment := 4; {Выравнивание текста}
      end;

        ExcelApp.Visible := True;
finally
if ExcelApp.Visible <> True then ExcelApp.Quit;
end;

end;

end.