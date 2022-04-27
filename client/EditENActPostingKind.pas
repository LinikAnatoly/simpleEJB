unit EditENActPostingKind;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENActPostingKindController, ExtCtrls,
  AdvObj ;

type
  TfrmENActPostingKindEdit = class(TDialogForm)
    lblCode : TLabel;
    edtCode : TEdit;


    HTTPRIOENActPostingKind: THTTPRIO;

    btnOk: TButton;
    btnCancel: TButton;
    PageControl1: TPageControl;
    tsMain: TTabSheet;
    tsProvData: TTabSheet;
    lblNumberGen: TLabel;
    edtNumberGen: TEdit;
    lblName: TLabel;
    edtName: TEdit;
    lblDateTemplate: TLabel;
    edtDateTemplate: TDateTimePicker;
    lblAccount_expense: TLabel;
    edtAccount_expense: TEdit;
    lblKau_expense: TLabel;
    edtKau_expense: TEdit;
    lblAccount_closing: TLabel;
    edtAccount_closing: TEdit;
    lblKau_closing: TLabel;
    edtKau_closing: TEdit;
    lblTypeOperMatetialsAct: TLabel;
    edtTypeOperMatetialsAct: TEdit;
    edtTypeOperMatetialsOrder: TEdit;
    lblTypeOperMatetialsOrder: TLabel;
    lblTypeOperCountersAct: TLabel;
    edtTypeOperCountersAct: TEdit;
    Panel1: TPanel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ImageList1: TImageList;
    HTTPRIOENActPostingKindItem: THTTPRIO;
    ActionExpense: TActionList;
    actExpenseView: TAction;
    actExpenseInsert: TAction;
    actExpenseDelete: TAction;
    actExpenseEdit: TAction;
    actExpenseUpdate: TAction;
    actExpenseFilter: TAction;
    actExpenseNoFilter: TAction;
    PopupExpense: TPopupMenu;
    pmExpenseView: TMenuItem;
    pmExpenseInsert: TMenuItem;
    pmExpenseDelete: TMenuItem;
    pmExpenseEdit: TMenuItem;
    pmExpenseUpdate: TMenuItem;
    pmExpenseFilter: TMenuItem;
    pmExpenseNoFilter: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    sgENActPostingKindItem: TAdvStringGrid;
    ActionIncome: TActionList;
    actIncomeView: TAction;
    actIncomeInsert: TAction;
    actIncomeDelete: TAction;
    actIncomeEdit: TAction;
    actIncomeUpdate: TAction;
    actIncomeFilter: TAction;
    actIncomeNoFilter: TAction;
    PopupIncome: TPopupMenu;
    pmIncomeView: TMenuItem;
    pmIncomeInsert: TMenuItem;
    pmIncomeDelete: TMenuItem;
    pmIncomeEdit: TMenuItem;
    pmIncomeUpdate: TMenuItem;
    pmIncomeFilter: TMenuItem;
    pmIncomeNoFilter: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    AdvStringGrid1: TAdvStringGrid;
    HTTPRIOENActPostingForm: THTTPRIO;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actExpenseInsertExecute(Sender: TObject);
    procedure actExpenseUpdateExecute(Sender: TObject);
    procedure actExpenseDeleteExecute(Sender: TObject);
    procedure actExpenseEditExecute(Sender: TObject);
  
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmENActPostingKindEdit: TfrmENActPostingKindEdit;
  ENActPostingKindObj: ENActPostingKind;

implementation

uses ENActPostingKindItemController, EditENActPostingKindItem,
  ENActPostingFormController, ENConsts;



{$R *.dfm}
var
ENActPostingKindItemHeadersExpense: array [1..10] of String =
        ( 'Код'
          ,'Цех кредит '
          ,'Рахунок кредит '
          ,'кау кредит '
          ,'Цех дебет '
          ,'Рахунок дебет '
          ,'кау дебет '
          ,'Сумма (для шорт листа (просмотр сформ проводок))'
          ,'Знак для типа суммы(+/-)'
          ,'Призначення проводки'
        );

procedure TfrmENActPostingKindEdit.FormShow(Sender: TObject);
begin
  DisableControls([edtCode]);
  PageControl1.ActivePageIndex:= 0;
  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) then
  begin
    HideControls([lblCode, edtCode]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin    
    DenyBlankValues([
      edtNumberGen
      ,edtDateTemplate
      ,edtAccount_expense
      ,edtKau_expense
      ,edtAccount_closing
      ,edtKau_closing
      ,edtName
    ]);
  end;

  if (DialogState = dsEdit) or (DialogState = dsView) then
  begin
    edtCode.Text := IntToStr(ENActPostingKindObj.code);
    edtNumberGen.Text := ENActPostingKindObj.numberGen; 
    edtName.Text := ENActPostingKindObj.name; 
    SetDateFieldForDateTimePicker(edtDateTemplate, ENActPostingKindObj.dateTemplate);
    edtAccount_expense.Text := ENActPostingKindObj.account_expense; 
    edtKau_expense.Text := ENActPostingKindObj.kau_expense; 
    edtAccount_closing.Text := ENActPostingKindObj.account_closing; 
    edtKau_closing.Text := ENActPostingKindObj.kau_closing; 
    edtTypeOperMatetialsAct.Text := ENActPostingKindObj.typeOperMatetialsAct; 
    edtTypeOperMatetialsOrder.Text := ENActPostingKindObj.typeOperMatetialsOrder; 
    edtTypeOperCountersAct.Text := ENActPostingKindObj.typeOperCountersAct; 

  end;
end;



procedure TfrmENActPostingKindEdit.actExpenseDeleteExecute(Sender: TObject);
Var TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActPostingKindItem.Cells[0,sgENActPostingKindItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Строки шаблона проводок )?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActPostingKindItem.remove(ObjCode);
      actExpenseUpdateExecute(Sender);
  end;
end;

procedure TfrmENActPostingKindEdit.actExpenseEditExecute(Sender: TObject);
var
  TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
begin
  TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;
  try
    ENActPostingKindItemObj := TempENActPostingKindItem.getObject(StrToInt(sgENActPostingKindItem.Cells[0,sgENActPostingKindItem.Row]));
  except
    on EConvertError do Exit;
  end;


  frmENActPostingKindItemEdit:=TfrmENActPostingKindItemEdit.Create(Application, dsEdit);

  try
    if frmENActPostingKindItemEdit.ShowModal= mrOk then
      begin
        //TempENActPostingKindItem.save(ENActPostingKindItemObj);
        actExpenseUpdateExecute(Sender);
      end;
  finally
    frmENActPostingKindItemEdit.Free;
    frmENActPostingKindItemEdit:=nil;
  end;

   sgENActPostingKindItem.Row := sgENActPostingKindItem.RowCount - 1;

end;

procedure TfrmENActPostingKindEdit.actExpenseInsertExecute(Sender: TObject);

 var formFil:ENActPostingFormFilter;
 ENActPostingFormList: ENActPostingFormShortList;
 TempENActPostingForm: ENActPostingFormControllerSoapPort;
begin
  // TempENActPostingKindItem := HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActPostingKindItemObj:=ENActPostingKindItem.Create;
  SetNullIntProps(ENActPostingKindItemObj);
  SetNullXSProps(ENActPostingKindItemObj);

   //ENActPostingKindItemObj.summaGen:= TXSDecimal.Create;


  try
    frmENActPostingKindItemEdit:=TfrmENActPostingKindItemEdit.Create(Application, dsInsert);

    ENActPostingKindItemObj.ENActPostingKind:= ENActPostingKind.Create;
    ENActPostingKindItemObj.ENActPostingKind.code := ENActPostingKindObj.code;
    frmENActPostingKindItemEdit.edtENActPostingKindENActPostingKindName.Text:= ENActPostingKindObj.name;

    ENActPostingKindItemObj.ENActPostingForm:= ENActPostingForm.Create;
    ENActPostingKindItemObj.ENActPostingForm.code := ENACTPOSTINGFORM_EXPENDITURE_ACT;

    formFil := ENActPostingFormFilter.Create;
    SetNullIntProps(formFil);
    SetNullXSProps(formFil);
    formFil.code :=  ENACTPOSTINGFORM_EXPENDITURE_ACT;

    TempENActPostingForm :=  HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;

    ENActPostingFormList := TempENActPostingForm.getScrollableFilteredList(formFil,0,-1);

    frmENActPostingKindItemEdit.edtENActPostingFormENActPostingFormName.Text := ENActPostingFormList.list[0].name;


    HideControls([frmENActPostingKindItemEdit.lblSummaGen ,
                  frmENActPostingKindItemEdit.edtSummaGen]);

    DisableControls([frmENActPostingKindItemEdit.edtENActPostingKindENActPostingKindName ,
                     frmENActPostingKindItemEdit.spbENActPostingKindENActPostingKind ,
                     frmENActPostingKindItemEdit.edtENActPostingFormENActPostingFormName,
                     frmENActPostingKindItemEdit.spbENActPostingFormENActPostingForm]);
    try
      if frmENActPostingKindItemEdit.ShowModal = mrOk then
      begin
        if ENActPostingKindItemObj<>nil then

            actExpenseUpdateExecute(Sender);
      end;
    finally
      frmENActPostingKindItemEdit.Free;
      frmENActPostingKindItemEdit:=nil;
    end;
  finally
    ENActPostingKindItemObj.Free;
  end;
end;

procedure TfrmENActPostingKindEdit.actExpenseUpdateExecute(Sender: TObject);
var
  TempENActPostingKindItem: ENActPostingKindItemControllerSoapPort;
  i,j,LastCount,LastRow,ColCount: Integer;
  ENActPostingKindItemList: ENActPostingKindItemShortList;
  PostingItemFilter : ENActPostingKindItemfilter;
begin
	for i:=1 to sgENActPostingKindItem.RowCount-1 do
   for j:=0 to sgENActPostingKindItem.ColCount-1 do
     sgENActPostingKindItem.Cells[j,i]:='';

  SetGridHeaders(ENActPostingKindItemHeadersExpense, sgENActPostingKindItem.ColumnHeaders);
  TempENActPostingKindItem :=  HTTPRIOENActPostingKindItem as ENActPostingKindItemControllerSoapPort;


     PostingItemFilter := ENActPostingKindItemfilter.Create;
     SetNullIntProps(PostingItemFilter);
     SetNullXSProps(PostingItemFilter);

     PostingItemFilter.ENActPostingKind := ENActPostingKind.Create;
     PostingItemFilter.ENActPostingKind.code:= ENActPostingKindObj.code;

  ENActPostingKindItemList := TempENActPostingKindItem.getScrollableFilteredList(PostingItemFilter,0,-1);
  LastCount:=High(ENActPostingKindItemList.list);

  if LastCount > -1 then
     sgENActPostingKindItem.RowCount:=LastCount+2
  else
     sgENActPostingKindItem.RowCount:=2;

   with sgENActPostingKindItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingKindItemList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActPostingKindItemList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActPostingKindItemList.list[i].cehKt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[2,i+1] := ENActPostingKindItemList.list[i].accountKt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[3,i+1] := ENActPostingKindItemList.list[i].kauKt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[4,i+1] := ENActPostingKindItemList.list[i].cehDt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[5,i+1] := ENActPostingKindItemList.list[i].accountDt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[6,i+1] := ENActPostingKindItemList.list[i].kauDt;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        if ENActPostingKindItemList.list[i].summaGen = nil then
          Cells[7,i+1] := ''
        else
          Cells[7,i+1] := ENActPostingKindItemList.list[i].summaGen.DecimalString;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[8,i+1] := ENActPostingKindItemList.list[i].plusMinus;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        Cells[9,i+1] := ENActPostingKindItemList.list[i].description;
        Objects[0, i+1] := ENActPostingKindItemList.list[i];
        LastRow:=i+1;
        sgENActPostingKindItem.RowCount:=LastRow+1;
      end;

    ColCount:=ColCount+1;
    sgENActPostingKindItem.Row:=1;

    
      sgENActPostingKindItem.Row:=1;
end;

procedure TfrmENActPostingKindEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingKind: ENActPostingKindControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNumberGen
      ,edtAccount_expense
      ,edtKau_expense
      ,edtAccount_closing
      ,edtKau_closing
      ,edtName
     ]) then
  begin
    Application.MessageBox(PChar('Порожні поля неприпустимі!'), PChar('Увага!'), MB_ICONWARNING + MB_OK);
    Action := caNone;
  end
  else
  begin
    TempENActPostingKind := HTTPRIOENActPostingKind as ENActPostingKindControllerSoapPort;

    ENActPostingKindObj.numberGen := edtNumberGen.Text; 
    ENActPostingKindObj.name := edtName.Text; 
    ENActPostingKindObj.dateTemplate := GetTXSDateTimeFromTDateTimePicker(edtDateTemplate);	   
    ENActPostingKindObj.account_expense := edtAccount_expense.Text; 
    ENActPostingKindObj.kau_expense := edtKau_expense.Text; 
    ENActPostingKindObj.account_closing := edtAccount_closing.Text; 
    ENActPostingKindObj.kau_closing := edtKau_closing.Text; 
    ENActPostingKindObj.typeOperMatetialsAct := edtTypeOperMatetialsAct.Text; 
    ENActPostingKindObj.typeOperMatetialsOrder := edtTypeOperMatetialsOrder.Text; 
    ENActPostingKindObj.typeOperCountersAct := edtTypeOperCountersAct.Text; 

    if DialogState = dsInsert then
    begin
      ENActPostingKindObj.code := Low(Integer);
      TempENActPostingKind.add(ENActPostingKindObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENActPostingKind.save(ENActPostingKindObj);
    end;
  end;
end;


end.