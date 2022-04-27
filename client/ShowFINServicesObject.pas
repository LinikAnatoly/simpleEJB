
unit ShowFINServicesObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENServicesObjectController, AdvObj ;

 type
   {*
    * Тип отображения для формы TShowFINServicesObject:
    * OnlyBuy - только договора покупки
    * OnlySale - только договора продажи
    * All - все договора
    *}
   TShowFINServicesObjectViewType = (OnlyBuy, OnlySale, All);
 type
  TProcChooseENServicesObjectHandler = reference to procedure(selectedObj: ENServicesObjectShort);

type
  TfrmFINServicesObjectShow = class(TChildForm)
  HTTPRIOENServicesObject: THTTPRIO;
    ImageList1: TImageList;
    sgFINServicesObject: TAdvStringGrid;
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
    HTTPRIOFINContracts: THTTPRIO;
    actAdditionalAgreement: TAction;
    ToolButton4: TToolButton;
    N5: TMenuItem;
    N9: TMenuItem;
    actCopy: TAction;
    ToolButton5: TToolButton;
    N10: TMenuItem;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgFINServicesObjectDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure sgFINServicesObjectTopLeftChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actAdditionalAgreementExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);

    private
      { Private declarations }
      isFromMain: Boolean;
      {*
       * Статический метод для выборки договора из списка
       *
       * viewType - тип просмотра;
       * proc - процедура отрабатывающая при выборе объекта
       * filter - фильтр на записи
       *}
      class procedure chooseFromList(viewType : TShowFINServicesObjectViewType;
          proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter); overload; stdcall; static;
    public
      { Public declarations }
      contrAgentType : Integer;
      procedure UpdateGrid(Sender: TObject);
      {*
       * Статический метод для выборки договора из списка
       *
       * proc - процедура отрабатывающая при выборе объекта
       * filter - фильтр на записи
       *}
      class procedure chooseFromListAll(proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter = nil); overload; stdcall; static;
      {*
       * Статический метод для выборки договора из списка
       * договоров на покупку
       *
       * proc - процедура отрабатывающая при выборе объекта
       * filter - фильтр на записи
       *}
      class procedure chooseFromListBuying(proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter = nil); stdcall; static;
      {*
       * Статический метод для выборки договора из списка
       * договоров на продажу
       *
       * proc - процедура отрабатывающая при выборе объекта
       * filter - фильтр на записи
       *}
      class procedure chooseFromListSale(proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter = nil); stdcall; static;
    end;

var
 frmFINServicesObjectShow : TfrmFINServicesObjectShow;
 // ENServicesObjectObj: ENServicesObject;
 // ENServicesObjectFilterObj: ENServicesObjectFilter;
  
  
implementation

uses Main, {EditENServicesObject, EditENServicesObjectFilter} EditFINServicesObjectFilter,
  EditFINServicesObject, FINContractsController, ENConsts;


{$R *.dfm}

var
  //frmENServicesObjectShow : TfrmENServicesObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

  ENServicesObjectHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер договору'
          ,'Дата договору'
          ,'Найменування організації'
          ,'код організації'
          ,'код договору у фін.кол.'
          ,'PK договору у фін.кол.'
          ,'Примітка'
          ,'пользователь внесший изменение'
          ,'дата последнего изменения'
          ,'PK партнеру у фін.кол.'
        );

class procedure TfrmFINServicesObjectShow.chooseFromListBuying(proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter = nil);
begin
  TfrmFINServicesObjectShow.chooseFromList(OnlyBuy, proc, filter);
end;
class procedure TfrmFINServicesObjectShow.chooseFromListSale(proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter = nil);
begin
   TfrmFINServicesObjectShow.chooseFromList(OnlySale, proc, filter);
end;
class procedure TfrmFINServicesObjectShow.chooseFromListAll(proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter = nil);
begin
  TfrmFINServicesObjectShow.chooseFromList(All, proc, filter);
end;

class procedure TfrmFINServicesObjectShow.chooseFromList(viewType : TShowFINServicesObjectViewType; proc: TProcChooseENServicesObjectHandler; filter : ENServicesObjectFilter);
var
  f1 : ENServicesObjectFilter;
  frmFINServicesObjectShow : TfrmFINServicesObjectShow;
  selected : ENServicesObjectShort;
begin
  inherited;
     if Assigned(filter) then begin
        f1 := filter;
     end else begin
        f1 := ENServicesObjectFilter.Create;
        SetNullXSProps(f1);
        SetNullIntProps(f1);
     end;


      case viewType of
        OnlyBuy:
          begin
            if Length(f1.conditionSQL) > 0  then begin
              f1.conditionSQL := f1.conditionSQL + ' and a.io_flag = ''B''';
            end else begin
              f1.conditionSQL := 'a.io_flag = ''B''';
            end;
          end;
        OnlySale:
          begin
            if Length(f1.conditionSQL) > 0  then begin
              f1.conditionSQL := f1.conditionSQL + ' and a.io_flag = ''S''';
            end else begin
              f1.conditionSQL := 'a.io_flag = ''S''';
            end;
          end;
        All:
          begin
          end;
        Else
          begin
            raise Exception.Create('Невідоме значення параметру TShowFINServicesObjectViewType');
          end;
     end;



     frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f1);
     case viewType of
        OnlyBuy:
          begin
            frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
          end;
        OnlySale:
          begin
            frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_CUSTOMER;
          end;
        All:
          begin
          end;
        Else
          begin
            raise Exception.Create('Невідоме значення параметру TShowFINServicesObjectViewType');
          end;
     end;
       try
          with frmFINServicesObjectShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENServicesObjectShort(sgFINServicesObject.Objects[0, sgFINServicesObject.Row]);
                  proc(selected);
                except
                   on EConvertError do Exit;
                end;
            end;
          end;
       finally
          frmFINServicesObjectShow.Free;
       end;

end;

procedure TfrmFINServicesObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmFINServicesObjectShow:=nil;
    inherited;
  end;


procedure TfrmFINServicesObjectShow.FormCreate(Sender: TObject);
begin
  inherited;
  contrAgentType := Low(Integer);
  isFromMain := false;
end;


procedure TfrmFINServicesObjectShow.FormShow(Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
begin

  DisableActions([{actInsert, actEdit,} actDelete, {actView, }actNoFilter]);

  SetGridHeaders(ENServicesObjectHeaders, sgFINServicesObject.ColumnHeaders);

  ColCount:=100;

  TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;

  if not isFromMain then
    if FilterObject = nil then
    begin
       // 20.01.11 Не ищем без фильтра!!!
       Application.MessageBox(PChar('Не задані критерії пошуку!'),
                              PChar('Увага!'), MB_ICONWARNING);
       Exit;

       FilterObject := ENServicesObjectFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end
    else begin
      if ENServicesObjectFilter(FilterObject).conditionSQL = '' then
      begin
        // 20.01.11 Не ищем без фильтра!!!
        Application.MessageBox(PChar('Не задані критерії пошуку!'),
                               PChar('Увага!'), MB_ICONWARNING);
        Exit;
      end;
    end;


  ENServicesObjectList := TempENServicesObject.getContractList(ENServicesObjectFilter(FilterObject),0,ColCount);

  LastCount:=High(ENServicesObjectList.list);

  if LastCount > -1 then
     sgFINServicesObject.RowCount:=LastCount+2
  else
     sgFINServicesObject.RowCount:=2;

   with sgFINServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENServicesObjectList.list[i].contractNumber;
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        Cells[3,i+1] := ENServicesObjectList.list[i].name;
        Cells[4,i+1] := ENServicesObjectList.list[i].partnerCode;
        Cells[5,i+1] := ENServicesObjectList.list[i].finDocCode;
        // НЕ МЕНЯТЬ порядок !!!!!!!!!!!!!!!!!
        if ENServicesObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := IntToStr(ENServicesObjectList.list[i].finDocID);
        Cells[7,i+1] := ENServicesObjectList.list[i].commentGen;

        if ENServicesObjectList.list[i].partnerId <> Low(Integer) then
          Cells[10,i+1] := IntToStr(ENServicesObjectList.list[i].partnerId)
        else
          Cells[10,i+1] := '';

        Objects[0,i+1] := ENServicesObjectList.list[i];
{
        Cells[8,i+1] := ENServicesObjectList.list[i].userGen;
        if ENServicesObjectList.list[i].dateEdit = nil then
          Cells[9,i+1] := ''
        else
          Cells[9,i+1] := XSDate2String(ENServicesObjectList.list[i].dateEdit);
}
        LastRow:=i+1;
        sgFINServicesObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgFINServicesObject.Row:=1;
end;

procedure TfrmFINServicesObjectShow.sgFINServicesObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin

    try
      temp:=StrToInt(GetReturnValue(sgFINServicesObject,6)); // типа ПК из фин коллекции
    except
      on EConvertError do Exit;
    end;

    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmFINServicesObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgFINServicesObject.RowCount-1 do
   for j:=0 to sgFINServicesObject.ColCount-1 do
     sgFINServicesObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmFINServicesObjectShow.actViewExecute(Sender: TObject);
Var TempFINContracts: FINContractsControllerSoapPort;
begin
  frmFINServicesObjectEdit := TfrmFINServicesObjectEdit.Create(Application, dsView);
  try
    TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
    try
      frmFINServicesObjectEdit.FINContractsObj := TempFINContracts.getObjectFromFK(StrToInt(sgFINServicesObject.Cells[6, sgFINServicesObject.Row]));
    except
      on EConvertError do Exit;
    end;

    frmFINServicesObjectEdit.ShowModal;
  finally
    frmFINServicesObjectEdit.Free;
    frmFINServicesObjectEdit := nil;
  end;
end;

procedure TfrmFINServicesObjectShow.actEditExecute(Sender: TObject);
Var TempFINContracts: FINContractsControllerSoapPort;
begin
  frmFINServicesObjectEdit := TfrmFINServicesObjectEdit.Create(Application, dsEdit);
  try
    TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
    try
      frmFINServicesObjectEdit.FINContractsObj := TempFINContracts.getObjectFromFK(StrToInt(sgFINServicesObject.Cells[6, sgFINServicesObject.Row]));
    except
      on EConvertError do Exit;
    end;

    if frmFINServicesObjectEdit.ShowModal = mrOk then
    begin
      //TempRQOrg.save(RQOrgObj);
      UpdateGrid(Sender);
    end;
  finally
    frmFINServicesObjectEdit.Free;
    frmFINServicesObjectEdit := nil;
  end;
end;

procedure TfrmFINServicesObjectShow.actAdditionalAgreementExecute(
  Sender: TObject);
Var
  TempFINContracts: FINContractsControllerSoapPort;
  finDocId, orgId: Integer;
  FINContractsObj: FINContracts;
  codeOrg, strAddMessage: String;
  mainContractNumber, mainContractDate: String;
begin
  try
    finDocId := StrToInt(sgFINServicesObject.Cells[6, sgFINServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  try
    orgId := StrToInt(sgFINServicesObject.Cells[10, sgFINServicesObject.Row]);
  except
    on EConvertError do raise Exception.Create('Ошибка при определении кода партнера из ФК!'); //Exit;
  end;

  if orgId = LOW_INT then
    raise Exception.Create('Ошибка при определении кода партнера из ФК!');

  codeOrg := sgFINServicesObject.Cells[4, sgFINServicesObject.Row];

  if codeOrg = '' then
    raise Exception.Create('Ошибка при определении кода партнера из ФК!');

  mainContractNumber := sgFINServicesObject.Cells[1, sgFINServicesObject.Row];
  mainContractDate := sgFINServicesObject.Cells[2, sgFINServicesObject.Row];

  TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
  FINContractsObj := TempFINContracts.getObjectFromFK(finDocId);

  if FINContractsObj.parent_id <> LOW_INT then
  begin
    Application.MessageBox(PChar('Выбранный договор уже является доп. соглашением!'), PChar('Внимание!'), MB_ICONWARNING);
    Exit;
  end;

  frmFINServicesObjectEdit := TfrmFINServicesObjectEdit.Create(Application, dsInsert);
  try
    frmFINServicesObjectEdit.Caption := 'Доп. договор (основной: №' + mainContractNumber + ' от ' + mainContractDate + ')';

    frmFINServicesObjectEdit.isAdditionalAgreement := true;
    frmFINServicesObjectEdit.parent_id := finDocId;

    frmFINServicesObjectEdit.orgId := orgId;
    frmFINServicesObjectEdit.codeOrg := codeOrg;

    frmFINServicesObjectEdit.edtPartnerCode.Text := sgFINServicesObject.Cells[10, sgFINServicesObject.Row];
    frmFINServicesObjectEdit.edtPartnerName.Text := sgFINServicesObject.Cells[3, sgFINServicesObject.Row];

    if frmFINServicesObjectEdit.ShowModal = mrOk then
    begin
      //UpdateGrid(Sender);

      {
      /////
      // После добавления фильтранем лист по коду добавленного договора
      // и откроем его на редактирование (чтобы сразу занести партнеров)
      if frmFINServicesObjectEdit.new_agree_id <> LOW_INT then
      begin
        ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
        SetNullIntProps(ENServicesObjectFilterObj);
        SetNullXSProps(ENServicesObjectFilterObj);

        ENServicesObjectFilterObj.conditionSQL := 'a.id = ' + IntToStr(frmFINServicesObjectEdit.new_agree_id);
        FilterObject := ENServicesObjectFilterObj;

        actUpdateExecute(Sender);
        actEditExecute(Sender);
      end
      else
        UpdateGrid(Sender);
      /////
      }

      strAddMessage := '';

      if frmFINServicesObjectEdit.new_agree_id <> LOW_INT then
        strAddMessage := #13#10 + 'Код (id): ' + IntToStr(frmFINServicesObjectEdit.new_agree_id);

      Application.MessageBox(PChar('Доп. соглашение успешно создано!' + strAddMessage),
                             PChar('Информация'), MB_ICONINFORMATION);


    end;
  finally
    frmFINServicesObjectEdit.Free;
    frmFINServicesObjectEdit := nil;
  end;
end;

procedure TfrmFINServicesObjectShow.actCopyExecute(Sender: TObject);
Var
  TempFINContracts: FINContractsControllerSoapPort;
  finDocId, orgId: Integer;
  FINContractsObj: FINContracts;
  codeOrg: String;
begin
  try
    finDocId := StrToInt(sgFINServicesObject.Cells[6, sgFINServicesObject.Row]);
  except
    on EConvertError do Exit;
  end;

  try
    orgId := StrToInt(sgFINServicesObject.Cells[10, sgFINServicesObject.Row]);
  except
    on EConvertError do raise Exception.Create('Ошибка при определении кода партнера из ФК!'); //Exit;
  end;

  if orgId = LOW_INT then
    raise Exception.Create('Ошибка при определении кода партнера из ФК!');

  codeOrg := sgFINServicesObject.Cells[4, sgFINServicesObject.Row];

  if codeOrg = '' then
    raise Exception.Create('Ошибка при определении кода партнера из ФК!');

  TempFINContracts := HTTPRIOFINContracts as FINContractsControllerSoapPort;
  FINContractsObj := TempFINContracts.getObjectFromFK(finDocId);

  frmFINServicesObjectEdit := TfrmFINServicesObjectEdit.Create(Application, dsInsert);
  try
    frmFINServicesObjectEdit.source_id := finDocId;

    frmFINServicesObjectEdit.orgId := orgId;
    frmFINServicesObjectEdit.codeOrg := codeOrg;

    frmFINServicesObjectEdit.edtPartnerCode.Text := sgFINServicesObject.Cells[10, sgFINServicesObject.Row];
    frmFINServicesObjectEdit.edtPartnerName.Text := sgFINServicesObject.Cells[3, sgFINServicesObject.Row];

    if frmFINServicesObjectEdit.ShowModal = mrOk then
    begin
      /////
      // После добавления фильтранем лист по коду добавленного договора
      // и откроем его на редактирование (чтобы сразу занести партнеров)
      if frmFINServicesObjectEdit.new_agree_id <> LOW_INT then
      begin
        ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
        SetNullIntProps(ENServicesObjectFilterObj);
        SetNullXSProps(ENServicesObjectFilterObj);

        ENServicesObjectFilterObj.conditionSQL := 'a.id = ' + IntToStr(frmFINServicesObjectEdit.new_agree_id);
        FilterObject := ENServicesObjectFilterObj;

        actUpdateExecute(Sender);
        actEditExecute(Sender);
      end
      else
        UpdateGrid(Sender);
      /////
    end;
  finally
    frmFINServicesObjectEdit.Free;
    frmFINServicesObjectEdit := nil;
  end;
end;

procedure TfrmFINServicesObjectShow.actDeleteExecute(Sender: TObject);
Var TempENServicesObject: ENServicesObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgFINServicesObject.Cells[0,sgFINServicesObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьєкти - послуги на сторону) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENServicesObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmFINServicesObjectShow.actInsertExecute(Sender: TObject);
//Var TempENServicesObject: ENServicesObjectControllerSoapPort;
var
  frmFINServicesObjectEdit: TfrmFINServicesObjectEdit;
begin
{
  TempENServicesObject := HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
  ENServicesObjectObj:=ENServicesObject.Create;

   ENServicesObjectObj.contractDate:= TXSDate.Create;
   ENServicesObjectObj.dateEdit:= TXSDate.Create;


  try
    frmENServicesObjectEdit:=TfrmENServicesObjectEdit.Create(Application, dsInsert);
    try
      if frmENServicesObjectEdit.ShowModal = mrOk then
      begin
        if ENServicesObjectObj<>nil then
            //TempENServicesObject.add(ENServicesObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENServicesObjectEdit.Free;
      frmENServicesObjectEdit:=nil;
    end;
  finally
    ENServicesObjectObj.Free;
  end;
}
    frmFINServicesObjectEdit := TfrmFINServicesObjectEdit.Create(Application, dsInsert);
    try
      if frmFINServicesObjectEdit.ShowModal = mrOk then
      begin
        //UpdateGrid(Sender);

        /////
        // После добавления фильтранем лист по коду добавленного договора
        // и откроем его на редактирование (чтобы сразу занести партнеров)
        if frmFINServicesObjectEdit.new_agree_id <> LOW_INT then
        begin
          ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
          SetNullIntProps(ENServicesObjectFilterObj);
          SetNullXSProps(ENServicesObjectFilterObj);

          ENServicesObjectFilterObj.conditionSQL := 'a.id = ' + IntToStr(frmFINServicesObjectEdit.new_agree_id);
          FilterObject := ENServicesObjectFilterObj;

          actUpdateExecute(Sender);
          actEditExecute(Sender);
        end
        else
          UpdateGrid(Sender);
        /////


      end;
    finally
      frmFINServicesObjectEdit.Free;
      frmFINServicesObjectEdit := nil;
    end;

end;

procedure TfrmFINServicesObjectShow.actUpdateExecute(Sender: TObject);
begin
  UpdateGrid(Sender);
end;


procedure TfrmFINServicesObjectShow.actFilterExecute(Sender: TObject);
var oldCondition, condition: String;
begin
  if not isFromMain then
  begin
    if FilterObject = nil then
    begin
      // 20.01.11 Не ищем без фильтра!!!
      Application.MessageBox(PChar('Не задані критерії пошуку!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;

    if ENServicesObjectFilter(FilterObject).conditionSQL = '' then
    begin
      // 20.01.11 Не ищем без фильтра!!!
      Application.MessageBox(PChar('Не задані критерії пошуку!'),
                             PChar('Увага!'), MB_ICONWARNING);
      Exit;
    end;
  end;

  oldCondition := ENServicesObjectFilter(FilterObject).conditionSQL;

  // Если вызвали с Main'а, убираем ненужный condition
  if oldCondition = 'a.id = -1' then
  begin
    oldCondition := '';
    isFromMain := true;
  end;

  frmFINServicesObjectFilterEdit := TfrmFINServicesObjectFilterEdit.Create(Application, dsInsert);
  frmFINServicesObjectFilterEdit.contrAgentType := contrAgentType;
  try
    ENServicesObjectFilterObj := ENServicesObjectFilter.Create;
    SetNullIntProps(ENServicesObjectFilterObj);
    SetNullXSProps(ENServicesObjectFilterObj);

    if frmFINServicesObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENServicesObjectFilter.Create;
      FilterObject := ENServicesObjectFilterObj;
      
      // 20.01.11 Не ищем без фильтра!!!
      condition := ENServicesObjectFilter(FilterObject).conditionSQL;
      if oldCondition <> '' then
        AddCondition(condition, oldCondition);
      ENServicesObjectFilter(FilterObject).conditionSQL := condition;

      actUpdateExecute(Sender);
    end;
  finally
    frmFINServicesObjectFilterEdit.Free;
    frmFINServicesObjectFilterEdit := nil;
  end;
end;

procedure TfrmFINServicesObjectShow.actNoFilterExecute(Sender: TObject);
var oldCondition: String;
begin
  if FilterObject = nil then
  begin
    // 20.01.11 Не ищем без фильтра!!!
    Application.MessageBox(PChar('Не задані критерії пошуку!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  if ENServicesObjectFilter(FilterObject).conditionSQL = '' then
  begin
    // 20.01.11 Не ищем без фильтра!!!
    Application.MessageBox(PChar('Не задані критерії пошуку!'),
                           PChar('Увага!'), MB_ICONWARNING);
    Exit;
  end;

  oldCondition := ENServicesObjectFilter(FilterObject).conditionSQL;

  FilterObject.Free;
  FilterObject := nil;

  FilterObject := ENServicesObjectFilter.Create;
  SetNullIntProps(FilterObject);
  SetNullXSProps(FilterObject);
  // 20.01.11 Не ищем без фильтра!!!
  ENServicesObjectFilter(FilterObject).conditionSQL := oldCondition;

  UpdateGrid(Sender);
end;

procedure TfrmFINServicesObjectShow.sgFINServicesObjectTopLeftChanged(
  Sender: TObject);
var
  TempENServicesObject: ENServicesObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENServicesObjectList: ENServicesObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgFINServicesObject.TopRow + sgFINServicesObject.VisibleRowCount) = ColCount
  then
    begin
      TempENServicesObject :=  HTTPRIOENServicesObject as ENServicesObjectControllerSoapPort;
      CurrentRow:=sgFINServicesObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENServicesObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENServicesObjectList := TempENServicesObject.getContractList(ENServicesObjectFilter(FilterObject),ColCount-1, 100);



  sgFINServicesObject.RowCount:=sgFINServicesObject.RowCount+100;
  LastCount:=High(ENServicesObjectList.list);
  with sgFINServicesObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENServicesObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENServicesObjectList.list[i].contractNumber;
        if ENServicesObjectList.list[i].contractDate = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].contractDate);
        Cells[3,i+CurrentRow] := ENServicesObjectList.list[i].name;
        Cells[4,i+CurrentRow] := ENServicesObjectList.list[i].partnerCode;
        Cells[5,i+CurrentRow] := ENServicesObjectList.list[i].finDocCode;
        if ENServicesObjectList.list[i].finDocID = Low(Integer) then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].finDocID);
        Cells[7,i+CurrentRow] := ENServicesObjectList.list[i].commentGen;
        Cells[8,i+CurrentRow] := ENServicesObjectList.list[i].userGen;
        if ENServicesObjectList.list[i].dateEdit = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(ENServicesObjectList.list[i].dateEdit);

        if ENServicesObjectList.list[i].partnerId <> Low(Integer) then
          Cells[10,i+CurrentRow] := IntToStr(ENServicesObjectList.list[i].partnerId)
        else
          Cells[10,i+CurrentRow] := '';

        Objects[0,i+CurrentRow] := ENServicesObjectList.list[i];

          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgFINServicesObject.Row:=CurrentRow-5;
   sgFINServicesObject.RowCount:=LastRow+1;
  end;
end;

end.
