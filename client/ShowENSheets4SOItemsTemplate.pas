
unit ShowENSheets4SOItemsTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENSheets4SOItemsTemplateController, AdvObj ;


type
    TfrmENSheets4SOItemsTemplateShow = class(TChildForm)  
    HTTPRIOENSheets4SOItemsTemplate: THTTPRIO;
    ImageList1: TImageList;
    sgENSheets4SOItemsTemplate: TAdvStringGrid;
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
    procedure sgENSheets4SOItemsTemplateTopLeftChanged(Sender: TObject);
    procedure sgENSheets4SOItemsTemplateDblClick(Sender: TObject);
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
   class function chooseFromList : ENSheets4SOItemsTemplateShort; stdcall; static;
 end;


var
  frmENSheets4SOItemsTemplateShow: TfrmENSheets4SOItemsTemplateShow;
  
  
implementation

uses Main, EditENSheets4SOItemsTemplate, EditENSheets4SOItemsTemplateFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSheets4SOItemsTemplateHeaders: array [1..3] of String =
        ( 'Код'
          ,'Назва'
          ,'шаблонний зміст пункту'
        );
   
class function TfrmENSheets4SOItemsTemplateShow.chooseFromList : ENSheets4SOItemsTemplateShort;
var
  f1 : ENSheets4SOItemsTemplateFilter;
  frmENSheets4SOItemsTemplateShow : TfrmENSheets4SOItemsTemplateShow;
  selected : ENSheets4SOItemsTemplateShort;
begin
  inherited;
     selected := nil;
     f1 := ENSheets4SOItemsTemplateFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENSheets4SOItemsTemplateShow := TfrmENSheets4SOItemsTemplateShow.Create(Application, fmNormal, f1);
       try
          with frmENSheets4SOItemsTemplateShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENSheets4SOItemsTemplateShort(sgENSheets4SOItemsTemplate.Objects[0, sgENSheets4SOItemsTemplate.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENSheets4SOItemsTemplateShow.Free;
       end;
end;

procedure TfrmENSheets4SOItemsTemplateShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSheets4SOItemsTemplateShow:=nil;
  inherited;
end;


procedure TfrmENSheets4SOItemsTemplateShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENSheets4SOItemsTemplateShow.FormShow(Sender: TObject);
var
  TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort;
  i: Integer;
  ENSheets4SOItemsTemplateList: ENSheets4SOItemsTemplateShortList;
begin
  SetGridHeaders(ENSheets4SOItemsTemplateHeaders, sgENSheets4SOItemsTemplate.ColumnHeaders);
  ColCount:=100;
  TempENSheets4SOItemsTemplate :=  HTTPRIOENSheets4SOItemsTemplate as ENSheets4SOItemsTemplateControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOItemsTemplateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOItemsTemplateList := TempENSheets4SOItemsTemplate.getScrollableFilteredList(ENSheets4SOItemsTemplateFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSheets4SOItemsTemplateList.list);

  if LastCount > -1 then
     sgENSheets4SOItemsTemplate.RowCount:=LastCount+2
  else
     sgENSheets4SOItemsTemplate.RowCount:=2;

   with sgENSheets4SOItemsTemplate do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSheets4SOItemsTemplateList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSheets4SOItemsTemplateList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSheets4SOItemsTemplateList.list[i].name;
        Objects[0, i+1] := ENSheets4SOItemsTemplateList.list[i];
        Cells[2,i+1] := ENSheets4SOItemsTemplateList.list[i].templateValue;
        Objects[0, i+1] := ENSheets4SOItemsTemplateList.list[i];
        LastRow:=i+1;
        sgENSheets4SOItemsTemplate.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENSheets4SOItemsTemplate.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENSheets4SOItemsTemplate.RowCount > selectedRow then
      sgENSheets4SOItemsTemplate.Row := selectedRow
    else
      sgENSheets4SOItemsTemplate.Row := sgENSheets4SOItemsTemplate.RowCount - 1;
    end
    else
      sgENSheets4SOItemsTemplate.Row:=1;   
end;


procedure TfrmENSheets4SOItemsTemplateShow.sgENSheets4SOItemsTemplateTopLeftChanged(Sender: TObject);
var
  TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort;
  i,CurrentRow: Integer;
  ENSheets4SOItemsTemplateList: ENSheets4SOItemsTemplateShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSheets4SOItemsTemplate.TopRow + sgENSheets4SOItemsTemplate.VisibleRowCount) = ColCount
  then
    begin
      TempENSheets4SOItemsTemplate :=  HTTPRIOENSheets4SOItemsTemplate as ENSheets4SOItemsTemplateControllerSoapPort;
      CurrentRow:=sgENSheets4SOItemsTemplate.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSheets4SOItemsTemplateFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSheets4SOItemsTemplateList := TempENSheets4SOItemsTemplate.getScrollableFilteredList(ENSheets4SOItemsTemplateFilter(FilterObject),ColCount-1, 100);


  sgENSheets4SOItemsTemplate.RowCount:=sgENSheets4SOItemsTemplate.RowCount+100;
  LastCount:=High(ENSheets4SOItemsTemplateList.list);
  with sgENSheets4SOItemsTemplate do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSheets4SOItemsTemplateList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSheets4SOItemsTemplateList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSheets4SOItemsTemplateList.list[i].name;
        Objects[0, i+CurrentRow] := ENSheets4SOItemsTemplateList.list[i];
        Cells[2,i+CurrentRow] := ENSheets4SOItemsTemplateList.list[i].templateValue;
        Objects[0, i+CurrentRow] := ENSheets4SOItemsTemplateList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSheets4SOItemsTemplate.Row:=CurrentRow-5;
   sgENSheets4SOItemsTemplate.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSheets4SOItemsTemplateShow.sgENSheets4SOItemsTemplateDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSheets4SOItemsTemplate,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENSheets4SOItemsTemplateShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENSheets4SOItemsTemplate.RowCount-1 do
   for j:=0 to sgENSheets4SOItemsTemplate.ColCount-1 do
     sgENSheets4SOItemsTemplate.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENSheets4SOItemsTemplateShow.actViewExecute(Sender: TObject);
var 
  TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort;
begin
  TempENSheets4SOItemsTemplate := HTTPRIOENSheets4SOItemsTemplate as ENSheets4SOItemsTemplateControllerSoapPort;
  try
    ENSheets4SOItemsTemplateObj := TempENSheets4SOItemsTemplate.getObject(StrToInt(sgENSheets4SOItemsTemplate.Cells[0, sgENSheets4SOItemsTemplate.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENSheets4SOItemsTemplateEdit := TfrmENSheets4SOItemsTemplateEdit.Create(Application, dsView);
  try
    frmENSheets4SOItemsTemplateEdit.ShowModal;
  finally
    frmENSheets4SOItemsTemplateEdit.Free;
    frmENSheets4SOItemsTemplateEdit := nil;
  end;
end;


procedure TfrmENSheets4SOItemsTemplateShow.actEditExecute(Sender: TObject);
var 
  TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort;
begin
  TempENSheets4SOItemsTemplate := HTTPRIOENSheets4SOItemsTemplate as ENSheets4SOItemsTemplateControllerSoapPort;
  try
    ENSheets4SOItemsTemplateObj := TempENSheets4SOItemsTemplate.getObject(StrToInt(sgENSheets4SOItemsTemplate.Cells[0,sgENSheets4SOItemsTemplate.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENSheets4SOItemsTemplate.Row;
  frmENSheets4SOItemsTemplateEdit:=TfrmENSheets4SOItemsTemplateEdit.Create(Application, dsEdit);
  
  try
    if frmENSheets4SOItemsTemplateEdit.ShowModal= mrOk then
      begin
        //TempENSheets4SOItemsTemplate.save(ENSheets4SOItemsTemplateObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSheets4SOItemsTemplateEdit.Free;
    frmENSheets4SOItemsTemplateEdit:=nil;
  end;

  if sgENSheets4SOItemsTemplate.RowCount > selectedRow then
    sgENSheets4SOItemsTemplate.Row := selectedRow
  else
    sgENSheets4SOItemsTemplate.Row := sgENSheets4SOItemsTemplate.RowCount - 1;
  
end;


procedure TfrmENSheets4SOItemsTemplateShow.actDeleteExecute(Sender: TObject);
Var TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSheets4SOItemsTemplate := HTTPRIOENSheets4SOItemsTemplate as ENSheets4SOItemsTemplateControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSheets4SOItemsTemplate.Cells[0,sgENSheets4SOItemsTemplate.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Шаблон для пунктів листів для ServicesObject)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSheets4SOItemsTemplate.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSheets4SOItemsTemplateShow.actInsertExecute(Sender: TObject);
// Var TempENSheets4SOItemsTemplate: ENSheets4SOItemsTemplateControllerSoapPort; 
begin
  // TempENSheets4SOItemsTemplate := HTTPRIOENSheets4SOItemsTemplate as ENSheets4SOItemsTemplateControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENSheets4SOItemsTemplateObj:=ENSheets4SOItemsTemplate.Create;
  SetNullIntProps(ENSheets4SOItemsTemplateObj);
  SetNullXSProps(ENSheets4SOItemsTemplateObj);



  try
    frmENSheets4SOItemsTemplateEdit:=TfrmENSheets4SOItemsTemplateEdit.Create(Application, dsInsert);
    try
      if frmENSheets4SOItemsTemplateEdit.ShowModal = mrOk then
      begin
        if ENSheets4SOItemsTemplateObj<>nil then
            //TempENSheets4SOItemsTemplate.add(ENSheets4SOItemsTemplateObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSheets4SOItemsTemplateEdit.Free;
      frmENSheets4SOItemsTemplateEdit:=nil;
    end;
  finally
    ENSheets4SOItemsTemplateObj.Free;
  end;
end;


procedure TfrmENSheets4SOItemsTemplateShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENSheets4SOItemsTemplateShow.actFilterExecute(Sender: TObject);
begin
{frmENSheets4SOItemsTemplateFilterEdit:=TfrmENSheets4SOItemsTemplateFilterEdit.Create(Application, dsInsert);
  try
    ENSheets4SOItemsTemplateFilterObj := ENSheets4SOItemsTemplateFilter.Create;
    SetNullIntProps(ENSheets4SOItemsTemplateFilterObj);
    SetNullXSProps(ENSheets4SOItemsTemplateFilterObj);

    if frmENSheets4SOItemsTemplateFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENSheets4SOItemsTemplateFilter.Create;
      FilterObject := ENSheets4SOItemsTemplateFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSheets4SOItemsTemplateFilterEdit.Free;
    frmENSheets4SOItemsTemplateFilterEdit:=nil;
  end;}
end;


procedure TfrmENSheets4SOItemsTemplateShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.