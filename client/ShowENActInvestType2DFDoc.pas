
unit ShowENActInvestType2DFDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENActInvestType2DFDocController, AdvObj ;


type
    TfrmENActInvestType2DFDocShow = class(TChildForm)  
    HTTPRIOENActInvestType2DFDoc: THTTPRIO;
    ImageList1: TImageList;
    sgENActInvestType2DFDoc: TAdvStringGrid;
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
    procedure sgENActInvestType2DFDocTopLeftChanged(Sender: TObject);
    procedure sgENActInvestType2DFDocDblClick(Sender: TObject);
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
   class function chooseFromList : ENActInvestType2DFDocShort; stdcall; static;
 end;


var
  frmENActInvestType2DFDocShow: TfrmENActInvestType2DFDocShow;
  
  
implementation

uses Main, EditENActInvestType2DFDoc, EditENActInvestType2DFDocFilter;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActInvestType2DFDocHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип звязка актів по ІП з документом DocFlow'
        );
   
class function TfrmENActInvestType2DFDocShow.chooseFromList : ENActInvestType2DFDocShort;
var
  f1 : ENActInvestType2DFDocFilter;
  frmENActInvestType2DFDocShow : TfrmENActInvestType2DFDocShow;
  selected : ENActInvestType2DFDocShort;
begin
  inherited;
     selected := nil;
     f1 := ENActInvestType2DFDocFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENActInvestType2DFDocShow := TfrmENActInvestType2DFDocShow.Create(Application, fmNormal, f1);
       try
          with frmENActInvestType2DFDocShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENActInvestType2DFDocShort(sgENActInvestType2DFDoc.Objects[0, sgENActInvestType2DFDoc.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENActInvestType2DFDocShow.Free;
       end;
end;

procedure TfrmENActInvestType2DFDocShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENActInvestType2DFDocShow:=nil;
  inherited;
end;


procedure TfrmENActInvestType2DFDocShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
end;


procedure TfrmENActInvestType2DFDocShow.FormShow(Sender: TObject);
var
  TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
  i: Integer;
  ENActInvestType2DFDocList: ENActInvestType2DFDocShortList;
begin
  SetGridHeaders(ENActInvestType2DFDocHeaders, sgENActInvestType2DFDoc.ColumnHeaders);
  ColCount:=100;
  TempENActInvestType2DFDoc :=  HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActInvestType2DFDocFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActInvestType2DFDocList := TempENActInvestType2DFDoc.getScrollableFilteredList(ENActInvestType2DFDocFilter(FilterObject),0,ColCount);
  LastCount:=High(ENActInvestType2DFDocList.list);

  if LastCount > -1 then
     sgENActInvestType2DFDoc.RowCount:=LastCount+2
  else
     sgENActInvestType2DFDoc.RowCount:=2;

   with sgENActInvestType2DFDoc do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActInvestType2DFDocList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActInvestType2DFDocList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActInvestType2DFDocList.list[i].name;
		Objects[0, i+1] := ENActInvestType2DFDocList.list[i];
        LastRow:=i+1;
        sgENActInvestType2DFDoc.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENActInvestType2DFDoc.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENActInvestType2DFDoc.RowCount > selectedRow then
      sgENActInvestType2DFDoc.Row := selectedRow
    else
      sgENActInvestType2DFDoc.Row := sgENActInvestType2DFDoc.RowCount - 1;
    end
    else
      sgENActInvestType2DFDoc.Row:=1;   
end;


procedure TfrmENActInvestType2DFDocShow.sgENActInvestType2DFDocTopLeftChanged(Sender: TObject);
var
  TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
  i,CurrentRow: Integer;
  ENActInvestType2DFDocList: ENActInvestType2DFDocShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActInvestType2DFDoc.TopRow + sgENActInvestType2DFDoc.VisibleRowCount) = ColCount
  then
    begin
      TempENActInvestType2DFDoc :=  HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;
      CurrentRow:=sgENActInvestType2DFDoc.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActInvestType2DFDocFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActInvestType2DFDocList := TempENActInvestType2DFDoc.getScrollableFilteredList(ENActInvestType2DFDocFilter(FilterObject),ColCount-1, 100);


  sgENActInvestType2DFDoc.RowCount:=sgENActInvestType2DFDoc.RowCount+100;
  LastCount:=High(ENActInvestType2DFDocList.list);
  with sgENActInvestType2DFDoc do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActInvestType2DFDocList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActInvestType2DFDocList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActInvestType2DFDocList.list[i].name;
		  Objects[0, i+CurrentRow] := ENActInvestType2DFDocList.list[i];
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActInvestType2DFDoc.Row:=CurrentRow-5;
   sgENActInvestType2DFDoc.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActInvestType2DFDocShow.sgENActInvestType2DFDocDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActInvestType2DFDoc,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENActInvestType2DFDocShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENActInvestType2DFDoc.RowCount-1 do
   for j:=0 to sgENActInvestType2DFDoc.ColCount-1 do
     sgENActInvestType2DFDoc.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENActInvestType2DFDocShow.actViewExecute(Sender: TObject);
var 
  TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
begin
  TempENActInvestType2DFDoc := HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;
  try
    ENActInvestType2DFDocObj := TempENActInvestType2DFDoc.getObject(StrToInt(sgENActInvestType2DFDoc.Cells[0, sgENActInvestType2DFDoc.Row]));
  except
    on EConvertError do Exit;
  end;

  frmENActInvestType2DFDocEdit := TfrmENActInvestType2DFDocEdit.Create(Application, dsView);
  try
    frmENActInvestType2DFDocEdit.ShowModal;
  finally
    frmENActInvestType2DFDocEdit.Free;
    frmENActInvestType2DFDocEdit := nil;
  end;
end;


procedure TfrmENActInvestType2DFDocShow.actEditExecute(Sender: TObject);
var 
  TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
begin
  TempENActInvestType2DFDoc := HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;
  try
    ENActInvestType2DFDocObj := TempENActInvestType2DFDoc.getObject(StrToInt(sgENActInvestType2DFDoc.Cells[0,sgENActInvestType2DFDoc.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENActInvestType2DFDoc.Row;
  frmENActInvestType2DFDocEdit:=TfrmENActInvestType2DFDocEdit.Create(Application, dsEdit);
  
  try
    if frmENActInvestType2DFDocEdit.ShowModal= mrOk then
      begin
        //TempENActInvestType2DFDoc.save(ENActInvestType2DFDocObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActInvestType2DFDocEdit.Free;
    frmENActInvestType2DFDocEdit:=nil;
  end;

  if sgENActInvestType2DFDoc.RowCount > selectedRow then
    sgENActInvestType2DFDoc.Row := selectedRow
  else
    sgENActInvestType2DFDoc.Row := sgENActInvestType2DFDoc.RowCount - 1;
  
end;


procedure TfrmENActInvestType2DFDocShow.actDeleteExecute(Sender: TObject);
Var TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActInvestType2DFDoc := HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActInvestType2DFDoc.Cells[0,sgENActInvestType2DFDoc.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Тип звязка актів по ІП з документом DocFlow)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActInvestType2DFDoc.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActInvestType2DFDocShow.actInsertExecute(Sender: TObject);
// Var TempENActInvestType2DFDoc: ENActInvestType2DFDocControllerSoapPort; 
begin
  // TempENActInvestType2DFDoc := HTTPRIOENActInvestType2DFDoc as ENActInvestType2DFDocControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActInvestType2DFDocObj:=ENActInvestType2DFDoc.Create;
  SetNullIntProps(ENActInvestType2DFDocObj);
  SetNullXSProps(ENActInvestType2DFDocObj);



  try
    frmENActInvestType2DFDocEdit:=TfrmENActInvestType2DFDocEdit.Create(Application, dsInsert);
    try
      if frmENActInvestType2DFDocEdit.ShowModal = mrOk then
      begin
        if ENActInvestType2DFDocObj<>nil then
            //TempENActInvestType2DFDoc.add(ENActInvestType2DFDocObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActInvestType2DFDocEdit.Free;
      frmENActInvestType2DFDocEdit:=nil;
    end;
  finally
    ENActInvestType2DFDocObj.Free;
  end;
end;


procedure TfrmENActInvestType2DFDocShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


procedure TfrmENActInvestType2DFDocShow.actFilterExecute(Sender: TObject);
begin
{frmENActInvestType2DFDocFilterEdit:=TfrmENActInvestType2DFDocFilterEdit.Create(Application, dsInsert);
  try
    ENActInvestType2DFDocFilterObj := ENActInvestType2DFDocFilter.Create;
    SetNullIntProps(ENActInvestType2DFDocFilterObj);
    SetNullXSProps(ENActInvestType2DFDocFilterObj);

    if frmENActInvestType2DFDocFilterEdit.ShowModal = mrOk then
    begin
      selectedRow := 1;
      //FilterObject := ENActInvestType2DFDocFilter.Create;
      FilterObject := ENActInvestType2DFDocFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActInvestType2DFDocFilterEdit.Free;
    frmENActInvestType2DFDocFilterEdit:=nil;
  end;}
end;


procedure TfrmENActInvestType2DFDocShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  selectedRow := 1;
  UpdateGrid(Sender);
end;

end.