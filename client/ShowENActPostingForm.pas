
unit ShowENActPostingForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENActPostingFormController, AdvObj ;


type
    TfrmENActPostingFormShow = class(TChildForm)  
    HTTPRIOENActPostingForm: THTTPRIO;
    ImageList1: TImageList;
    sgENActPostingForm: TAdvStringGrid;
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

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENActPostingFormTopLeftChanged(Sender: TObject);
    procedure sgENActPostingFormDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
    procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENActPostingFormShort; stdcall; static;
 end;


var
  frmENActPostingFormShow: TfrmENActPostingFormShow;
  
  
implementation

uses Main, EditENActPostingForm, EditENActPostingFormFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActPostingFormHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування '
        );
   
class function TfrmENActPostingFormShow.chooseFromList : ENActPostingFormShort;
var
  f1 : ENActPostingFormFilter;
  frmENActPostingFormShow : TfrmENActPostingFormShow;
  selected : ENActPostingFormShort;
begin
  inherited;
     selected := nil;
     f1 := ENActPostingFormFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENActPostingFormShow := TfrmENActPostingFormShow.Create(Application, fmNormal, f1);
       try
          with frmENActPostingFormShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENActPostingFormShort(sgENActPostingForm.Objects[0, sgENActPostingForm.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENActPostingFormShow.Free;
       end;
end;

procedure TfrmENActPostingFormShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENActPostingFormShow:=nil;
  inherited;
end;


procedure TfrmENActPostingFormShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENActPostingFormShow.FormShow(Sender: TObject);
var
  TempENActPostingForm: ENActPostingFormControllerSoapPort;
  i: Integer;
  ENActPostingFormList: ENActPostingFormShortList;
begin
  SetGridHeaders(ENActPostingFormHeaders, sgENActPostingForm.ColumnHeaders);
  ColCount:=100;
  TempENActPostingForm :=  HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingFormList := TempENActPostingForm.getScrollableFilteredList(ENActPostingFormFilter(FilterObject),0,ColCount);
  LastCount:=High(ENActPostingFormList.list);

  if LastCount > -1 then
     sgENActPostingForm.RowCount:=LastCount+2
  else
     sgENActPostingForm.RowCount:=2;

   with sgENActPostingForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingFormList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActPostingFormList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActPostingFormList.list[i].name;
        Objects[0, i+1] := ENActPostingFormList.list[i];
        LastRow:=i+1;
        sgENActPostingForm.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENActPostingForm.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENActPostingForm.RowCount > selectedRow then
      sgENActPostingForm.Row := selectedRow
    else
      sgENActPostingForm.Row := sgENActPostingForm.RowCount - 1;
    end
    else
      sgENActPostingForm.Row:=1;   
end;


procedure TfrmENActPostingFormShow.sgENActPostingFormTopLeftChanged(Sender: TObject);
var
  TempENActPostingForm: ENActPostingFormControllerSoapPort;
  i,CurrentRow: Integer;
  ENActPostingFormList: ENActPostingFormShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActPostingForm.TopRow + sgENActPostingForm.VisibleRowCount) = ColCount
  then
    begin
      TempENActPostingForm :=  HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;
      CurrentRow:=sgENActPostingForm.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActPostingFormFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActPostingFormList := TempENActPostingForm.getScrollableFilteredList(ENActPostingFormFilter(FilterObject),ColCount-1, 100);


  sgENActPostingForm.RowCount:=sgENActPostingForm.RowCount+100;
  LastCount:=High(ENActPostingFormList.list);
  with sgENActPostingForm do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActPostingFormList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActPostingFormList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActPostingFormList.list[i].name;
        Objects[0, i+CurrentRow] := ENActPostingFormList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActPostingForm.Row:=CurrentRow-5;
   sgENActPostingForm.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActPostingFormShow.sgENActPostingFormDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActPostingForm,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENActPostingFormShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENActPostingForm.RowCount-1 do
   for j:=0 to sgENActPostingForm.ColCount-1 do
     sgENActPostingForm.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENActPostingFormShow.actViewExecute(Sender: TObject);
var 
  TempENActPostingForm: ENActPostingFormControllerSoapPort;
begin
  TempENActPostingForm := HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;
  try
    ENActPostingFormObj := TempENActPostingForm.getObject(StrToInt(sgENActPostingForm.Cells[0, sgENActPostingForm.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActPostingFormEdit := TfrmENActPostingFormEdit.Create(Application, dsView);
  try
    frmENActPostingFormEdit.ShowModal;
  finally
    frmENActPostingFormEdit.Free;
    frmENActPostingFormEdit := nil;
  end;
end;


procedure TfrmENActPostingFormShow.actEditExecute(Sender: TObject);
var 
  TempENActPostingForm: ENActPostingFormControllerSoapPort;
begin
  TempENActPostingForm := HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;
  try
    ENActPostingFormObj := TempENActPostingForm.getObject(StrToInt(sgENActPostingForm.Cells[0,sgENActPostingForm.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENActPostingForm.Row;
  frmENActPostingFormEdit:=TfrmENActPostingFormEdit.Create(Application, dsEdit);
  
  try
    if frmENActPostingFormEdit.ShowModal= mrOk then
      begin
        //TempENActPostingForm.save(ENActPostingFormObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActPostingFormEdit.Free;
    frmENActPostingFormEdit:=nil;
  end;

  if sgENActPostingForm.RowCount > selectedRow then
    sgENActPostingForm.Row := selectedRow
  else
    sgENActPostingForm.Row := sgENActPostingForm.RowCount - 1;
  
end;


procedure TfrmENActPostingFormShow.actDeleteExecute(Sender: TObject);
Var TempENActPostingForm: ENActPostingFormControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActPostingForm := HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActPostingForm.Cells[0,sgENActPostingForm.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Форма проводок - Видатковий або Прибутковий акт)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActPostingForm.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActPostingFormShow.actInsertExecute(Sender: TObject);
// Var TempENActPostingForm: ENActPostingFormControllerSoapPort; 
begin
  // TempENActPostingForm := HTTPRIOENActPostingForm as ENActPostingFormControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActPostingFormObj:=ENActPostingForm.Create;
  SetNullIntProps(ENActPostingFormObj);
  SetNullXSProps(ENActPostingFormObj);



  try
    frmENActPostingFormEdit:=TfrmENActPostingFormEdit.Create(Application, dsInsert);
    try
      if frmENActPostingFormEdit.ShowModal = mrOk then
      begin
        if ENActPostingFormObj<>nil then
            //TempENActPostingForm.add(ENActPostingFormObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActPostingFormEdit.Free;
      frmENActPostingFormEdit:=nil;
    end;
  finally
    ENActPostingFormObj.Free;
  end;
end;


procedure TfrmENActPostingFormShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENActPostingFormShow.actFilterExecute(Sender: TObject);
begin
{frmENActPostingFormFilterEdit:=TfrmENActPostingFormFilterEdit.Create(Application, dsInsert);
  try
    ENActPostingFormFilterObj := ENActPostingFormFilter.Create;
    SetNullIntProps(ENActPostingFormFilterObj);
    SetNullXSProps(ENActPostingFormFilterObj);

    if frmENActPostingFormFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENActPostingFormFilter.Create;
      FilterObject := ENActPostingFormFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActPostingFormFilterEdit.Free;
    frmENActPostingFormFilterEdit:=nil;
  end;}
end;


procedure TfrmENActPostingFormShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.