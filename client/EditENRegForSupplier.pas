
unit EditENRegForSupplier;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENRegForSupplierController, AdvObj,
  ExtCtrls ;

type
  TfrmENRegForSupplierEdit = class(TDialogForm)


  HTTPRIOENRegForSupplier: THTTPRIO;
    HTTPRIOSupplier: THTTPRIO;
    lblCode: TLabel;
    edtCode: TEdit;
    ImageList1: TImageList;
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
    btnOk: TButton;
    btnCancel: TButton;
    pcMain: TPageControl;
    tsMain: TTabSheet;
    lblNumberGen: TLabel;
    lblDateFrom: TLabel;
    lblDateTo: TLabel;
    lblStatus: TLabel;
    edtDateFrom: TDateTimePicker;
    edtDateTo: TDateTimePicker;
    edtNumberGen: TEdit;
    btnCreateItems: TButton;
    edtStatus: TEdit;
    btnPrintRegistry: TButton;
    tsItems: TTabSheet;
    sgENRegForSupplierItems: TAdvStringGrid;
    lblType: TLabel;
    edtType: TEdit;
    spbType: TSpeedButton;
    spbTypeClear: TSpeedButton;
    lblSupplier: TLabel;
    edtSupplier: TEdit;
    spbSupplier: TSpeedButton;
    lblCommentGen: TLabel;
    edtCommentGen: TMemo;
    HTTPRIOENRegForSupplierType: THTTPRIO;
    HTTPRIOENRegForSupplierStatus: THTTPRIO;
    HTTPRIOENRegForSupplierItem: THTTPRIO;
    Panel1: TPanel;
    lblTotalCount: TLabel;
    lblTotalSum: TLabel;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure spbTypeClick(Sender: TObject);
    procedure spbTypeClearClick(Sender: TObject);
    procedure spbSupplierClick(Sender: TObject);
    procedure btnCreateItemsClick(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
  
  
  private
    { Private declarations }
    procedure UpdateItemsList;
    procedure updateTotals(totalCount: Integer; totalSum: Double);
  public
    { Public declarations }

end;

var
  frmENRegForSupplierEdit: TfrmENRegForSupplierEdit;
  ENRegForSupplierObj: ENRegForSupplier;

implementation

uses SupplierController, ShowENRegForSupplierType,
  ENRegForSupplierTypeController, ENRegForSupplierStatusController,
  ShowSupplier, ENConsts, ENRegForSupplierItemController;


{uses  
    EnergyproController, EnergyproController2, ENRegForSupplierController  ;
}
{$R *.dfm}

var
  ENRegForSupplierItemHeaders: array [1..12] of String =
        ( 'Код'
          ,'EIC код'
          ,'Запланована дата'
          ,'Дата виконання'
          ,'№ калькуляції'
          ,'Назва калькуляції'
          //,'Вартість робіт без ПДВ, грн.'
          //,'ПДВ, грн.'
          ,'Вартість робіт з ПДВ, грн.'
          ,'Опис'
          ,'Код Завдання-Плану'
          ,'Код Завдання-Факту'
          ,'Код строки реєстру з DataHub'
          ,'Примітка'
        );

procedure TfrmENRegForSupplierEdit.FormShow(Sender: TObject);
var
  TempSupplier: SupplierControllerSoapPort;
  supplierObj: Supplier;
  TempENRegForSupplierType: ENRegForSupplierTypeControllerSoapPort;
  typeObj: ENRegForSupplierType;
  TempENRegForSupplierStatus: ENRegForSupplierStatusControllerSoapPort;
  statusObj: ENRegForSupplierStatus;
begin
  SetGridHeaders(ENRegForSupplierItemHeaders, sgENRegForSupplierItems.ColumnHeaders);
  DisableControls([edtCode, edtType, edtStatus, edtSupplier]);

  if (DialogState = dsInsert) then
  begin
    HideControls([lblStatus, edtStatus, btnCreateItems, btnPrintRegistry]);
    tsItems.TabVisible := false;
  end;

  pcMain.ActivePage := tsMain;

  if DialogState = dsView then
  begin
    btnCreateItems.Visible := false;
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNumberGen
      ,edtDateFrom
      ,edtDateTo
      ,edtSupplier
     ]);
   end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENRegForSupplierObj.code);
    edtNumberGen.Text := ENRegForSupplierObj.numberGen;
    SetDateFieldForDateTimePicker(edtDateFrom, ENRegForSupplierObj.dateFrom);
    SetDateFieldForDateTimePicker(edtDateTo, ENRegForSupplierObj.dateTo);

    MakeMultiline(edtCommentGen.Lines, ENRegForSupplierObj.commentGen);

    /////
    if ENRegForSupplierObj.suppliercode <> LOW_INT then
    begin
      TempSupplier := HTTPRIOSupplier as SupplierControllerSoapPort;
      supplierObj := TempSupplier.getObject(ENRegForSupplierObj.suppliercode);
      if supplierObj <> nil then
        edtSupplier.Text := supplierObj.name;
    end;

    if ENRegForSupplierObj.typeRef <> nil then
      if ENRegForSupplierObj.typeRef.code <> LOW_INT then
      begin
        TempENRegForSupplierType := HTTPRIOENRegForSupplierType as ENRegForSupplierTypeControllerSoapPort;
        typeObj := TempENRegForSupplierType.getObject(ENRegForSupplierObj.typeRef.code);
        if typeObj <> nil then
          edtType.Text := typeObj.name;
      end;

    if ENRegForSupplierObj.statusRef <> nil then
      if ENRegForSupplierObj.statusRef.code <> LOW_INT then
      begin
        TempENRegForSupplierStatus := HTTPRIOENRegForSupplierStatus as ENRegForSupplierStatusControllerSoapPort;
        statusObj := TempENRegForSupplierStatus.getObject(ENRegForSupplierObj.statusRef.code);
        if statusObj <> nil then
          edtStatus.Text := statusObj.name;
      end;
    /////

    /////
    if ENRegForSupplierObj.statusRef.code = ENREGFORSUPPLIERSTATUS_DRAFT then
    begin
      btnCreateItems.Caption := 'СФОРМУВАТИ строки';
      btnPrintRegistry.Visible := false;
      tsItems.TabVisible := false;
    end
    else if ENRegForSupplierObj.statusRef.code = ENREGFORSUPPLIERSTATUS_CREATED then
    begin
      btnCreateItems.Caption := 'ВИДАЛИТИ строки';
      DisableControls([edtNumberGen, edtDateFrom, edtDateTo,
                       spbType, spbTypeClear, spbSupplier]);
      //btnPrintRegistry.Visible := true;
      tsItems.TabVisible := true;
    end
    else begin
      HideControls([btnCreateItems]);
      DisableControls([edtNumberGen, edtDateFrom, edtDateTo,
                       spbType, spbTypeClear, spbSupplier]);
      //btnPrintRegistry.Visible := true;
      tsItems.TabVisible := true;
    end;
    /////
  end;
end;



procedure TfrmENRegForSupplierEdit.pcMainChange(Sender: TObject);
begin
  if pcMain.ActivePage = tsItems then
    UpdateItemsList;
end;

procedure TfrmENRegForSupplierEdit.spbSupplierClick(Sender: TObject);
var frmSupplierShow: TfrmSupplierShow;
begin
  if DialogState = dsView then Exit;

  frmSupplierShow := TfrmSupplierShow.Create(Application, fmNormal);
  try
    with frmSupplierShow do
      if ShowModal = mrOk then
      begin
        ENRegForSupplierObj.suppliercode := StrToInt(GetReturnValue(sgSupplier, 0));
        edtSupplier.Text := GetReturnValue(sgSupplier, 1);
      end;
  finally
    frmSupplierShow.Free;
  end;
end;

procedure TfrmENRegForSupplierEdit.spbTypeClearClick(Sender: TObject);
begin
  if DialogState = dsView then Exit;

  ENRegForSupplierObj.typeRef := nil;
  ClearControls([edtType]);
end;

procedure TfrmENRegForSupplierEdit.spbTypeClick(Sender: TObject);
var
  frmENRegForSupplierTypeShow: TfrmENRegForSupplierTypeShow;
begin
  if DialogState = dsView then Exit;

  frmENRegForSupplierTypeShow := TfrmENRegForSupplierTypeShow.Create(Application, fmNormal);
  try
    frmENRegForSupplierTypeShow.DisableActions([frmENRegForSupplierTypeShow.actInsert,
                                                frmENRegForSupplierTypeShow.actDelete,
                                                frmENRegForSupplierTypeShow.actEdit]);

    with frmENRegForSupplierTypeShow do
      if ShowModal = mrOk then
      begin
        try
			    if ENRegForSupplierObj.typeRef = nil then ENRegForSupplierObj.typeRef := ENRegForSupplierTypeRef.Create;
			    ENRegForSupplierObj.typeRef.code := StrToInt(GetReturnValue(sgENRegForSupplierType, 0));
			    edtType.Text := GetReturnValue(sgENRegForSupplierType, 1);
        except
          on EConvertError do Exit;
        end;
      end;
  finally
    frmENRegForSupplierTypeShow.Free;
  end;
end;

procedure TfrmENRegForSupplierEdit.UpdateItemsList;
var
  TempENRegForSupplierItem: ENRegForSupplierItemControllerSoapPort;
  i: Integer;
  totalSum, itemSum: Double;
  ENRegForSupplierItemList: ENRegForSupplierItemShortList;
  itemsFilter: ENRegForSupplierItemFilter;
begin
  ClearGrid(sgENRegForSupplierItems);

  if ENRegForSupplierObj = nil then Exit;
  if ENRegForSupplierObj.code = LOW_INT then Exit;
  if DialogState = dsInsert then Exit;

  itemsFilter := ENRegForSupplierItemFilter.Create;
  SetNullIntProps(itemsFilter);
  SetNullXSProps(itemsFilter);

  itemsFilter.registryRef := ENRegForSupplierRef.Create;
  itemsFilter.registryRef.code := ENRegForSupplierObj.code;

  TempENRegForSupplierItem := HTTPRIOENRegForSupplierItem as ENRegForSupplierItemControllerSoapPort;
  ENRegForSupplierItemList := TempENRegForSupplierItem.getScrollableFilteredList(itemsFilter, 0, -1);

  totalSum := 0;
  FormatSettings.DecimalSeparator := '.';

  with sgENRegForSupplierItems do
    for i := 0 to High(ENRegForSupplierItemList.list) do
    begin
      Application.ProcessMessages;

      if ENRegForSupplierItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRegForSupplierItemList.list[i].code)
      else
        Cells[0,i+1] := '';

      Cells[1,i+1] := ENRegForSupplierItemList.list[i].recordpointEic;

      if ENRegForSupplierItemList.list[i].datePlanned = nil then
        Cells[2,i+1] := ''
      else
        Cells[2,i+1] := XSDate2String(ENRegForSupplierItemList.list[i].datePlanned);

      if ENRegForSupplierItemList.list[i].dateComplete = nil then
        Cells[3,i+1] := ''
      else
        Cells[3,i+1] := XSDate2String(ENRegForSupplierItemList.list[i].dateComplete);

      Cells[4,i+1] := ENRegForSupplierItemList.list[i].calcNumber;
      Cells[5,i+1] := ENRegForSupplierItemList.list[i].calcName;

      if ENRegForSupplierItemList.list[i].costWithVAT = nil then
        Cells[6,i+1] := ''
      else begin
        Cells[6,i+1] := ENRegForSupplierItemList.list[i].costWithVAT.DecimalString;
        try
          itemSum := StrToFloat(ENRegForSupplierItemList.list[i].costWithVAT.DecimalString);
        except
          itemSum := 0;
        end;
      end;

      totalSum := totalSum + itemSum;

      Cells[7,i+1] := ENRegForSupplierItemList.list[i].description;

      if ENRegForSupplierItemList.list[i].planRefCode = Low(Integer) then
        Cells[8,i+1] := ''
      else
        Cells[8,i+1] := IntToStr(ENRegForSupplierItemList.list[i].planRefCode);

      if ENRegForSupplierItemList.list[i].factRefCode = Low(Integer) then
        Cells[9,i+1] := ''
      else
        Cells[9,i+1] := IntToStr(ENRegForSupplierItemList.list[i].factRefCode);

      if ENRegForSupplierItemList.list[i].dhDisconnectionCode = Low(Integer) then
        Cells[10,i+1] := ''
      else
        Cells[10,i+1] := IntToStr(ENRegForSupplierItemList.list[i].dhDisconnectionCode);

      Cells[11,i+1] := ENRegForSupplierItemList.list[i].commentGen;

      sgENRegForSupplierItems.RowCount := i + 2;
    end;

  updateTotals(High(ENRegForSupplierItemList.list) + 1, totalSum);

  sgENRegForSupplierItems.Row:=1;
end;

procedure TfrmENRegForSupplierEdit.updateTotals(totalCount: Integer;
  totalSum: Double);
begin
  lblTotalCount.Caption := 'Кількість строк: ' + IntToStr(totalCount);
  lblTotalSum.Caption   := 'Загальна сума з ПДВ, грн.: ' + SeparateThousands(FloatToStr(Conv(totalSum, 2)));
end;

procedure TfrmENRegForSupplierEdit.btnCreateItemsClick(Sender: TObject);
var TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
begin
  if (DialogState = dsInsert) or (DialogState = dsView) then Exit;

  TempENRegForSupplier := HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;

  if ENRegForSupplierObj.statusRef.code = ENREGFORSUPPLIERSTATUS_DRAFT then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте СФОРМУВАТИ строки реєстру?'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENRegForSupplier.generateRegItems(ENRegForSupplierObj.code);

      Application.MessageBox(PChar('Строки сформовані!'), PChar('Повідомлення'), MB_ICONINFORMATION);
      ENRegForSupplierObj := TempENRegForSupplier.getObject(ENRegForSupplierObj.code);
      Self.FormShow(Sender);
      Exit;
    end;
  end;

  if ENRegForSupplierObj.statusRef.code = ENREGFORSUPPLIERSTATUS_CREATED then
  begin
    if Application.MessageBox(PChar('Ви дійсно бажаєте ВИДАЛИТИ строки реєстру?'),
                              PChar('Увага !'), MB_ICONQUESTION + MB_OKCANCEL + MB_DEFBUTTON2) = IDOK then
    begin
      TempENRegForSupplier.removeRegItems(ENRegForSupplierObj.code);

      Application.MessageBox(PChar('Строки видалені!'), PChar('Повідомлення'), MB_ICONINFORMATION);
      ENRegForSupplierObj := TempENRegForSupplier.getObject(ENRegForSupplierObj.code);
      Self.FormShow(Sender);
      Exit;
    end;
  end;
end;

procedure TfrmENRegForSupplierEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENRegForSupplier: ENRegForSupplierControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
   if not NoBlankValues([
     edtNumberGen
     ,edtDateFrom
     ,edtDateTo
     ,edtSupplier
    ]) then
  begin
    Application.MessageBox(PChar('Пустые поля недопустимы !'), PChar('Внимание !'), MB_ICONWARNING + MB_OK);
    Action := caNone;
    Exit;
  end
  else begin
    TempENRegForSupplier := HTTPRIOENRegForSupplier as ENRegForSupplierControllerSoapPort;

    ENRegForSupplierObj.numberGen := edtNumberGen.Text;

    ENRegForSupplierObj.dateFrom := GetTXSDateFromTDateTimePicker(edtdateFrom);
    ENRegForSupplierObj.dateTo := GetTXSDateFromTDateTimePicker(edtdateTo);

    ENRegForSupplierObj.commentGen := edtCommentGen.Text;

    if DialogState = dsInsert then
    begin
      ENRegForSupplierObj.code := Low(Integer);
      TempENRegForSupplier.add(ENRegForSupplierObj);
    end
    else if DialogState = dsEdit then
    begin
      TempENRegForSupplier.save(ENRegForSupplierObj);
    end;
  end;
end;


end.