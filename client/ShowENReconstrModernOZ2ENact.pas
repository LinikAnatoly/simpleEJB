
unit ShowENReconstrModernOZ2ENact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENReconstrModernOZ2ENactController ;


type
  TfrmENReconstrModernOZ2ENactShow = class(TChildForm)  
  HTTPRIOENReconstrModernOZ2ENact: THTTPRIO;
    ImageList1: TImageList;
    sgENReconstrModernOZ2ENact: TAdvStringGrid;
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
procedure sgENReconstrModernOZ2ENactTopLeftChanged(Sender: TObject);
procedure sgENReconstrModernOZ2ENactDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENReconstrModernOZ2ENactObj: ENReconstrModernOZ2ENact;
 // ENReconstrModernOZ2ENactFilterObj: ENReconstrModernOZ2ENactFilter;
  
  
implementation

uses Main, EditENReconstrModernOZ2ENact, EditENReconstrModernOZ2ENactFilter;


{$R *.dfm}

var
  //frmENReconstrModernOZ2ENactShow : TfrmENReconstrModernOZ2ENactShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENReconstrModernOZ2ENactHeaders: array [1..1] of String =
        ( 'Код'
        );
   

procedure TfrmENReconstrModernOZ2ENactShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENReconstrModernOZ2ENactShow:=nil;
    inherited;
  end;


procedure TfrmENReconstrModernOZ2ENactShow.FormShow(Sender: TObject);
var
  TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort;
  i: Integer;
  ENReconstrModernOZ2ENactList: ENReconstrModernOZ2ENactShortList;
  begin
  SetGridHeaders(ENReconstrModernOZ2ENactHeaders, sgENReconstrModernOZ2ENact.ColumnHeaders);
  ColCount:=100;
  TempENReconstrModernOZ2ENact :=  HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModernOZ2ENactFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModernOZ2ENactList := TempENReconstrModernOZ2ENact.getScrollableFilteredList(ENReconstrModernOZ2ENactFilter(FilterObject),0,ColCount);


  LastCount:=High(ENReconstrModernOZ2ENactList.list);

  if LastCount > -1 then
     sgENReconstrModernOZ2ENact.RowCount:=LastCount+2
  else
     sgENReconstrModernOZ2ENact.RowCount:=2;

   with sgENReconstrModernOZ2ENact do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReconstrModernOZ2ENactList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENReconstrModernOZ2ENactList.list[i].code)
        else
        Cells[0,i+1] := '';
        LastRow:=i+1;
        sgENReconstrModernOZ2ENact.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENReconstrModernOZ2ENact.Row:=1;
end;

procedure TfrmENReconstrModernOZ2ENactShow.sgENReconstrModernOZ2ENactTopLeftChanged(Sender: TObject);
var
  TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort;
  i,CurrentRow: Integer;
  ENReconstrModernOZ2ENactList: ENReconstrModernOZ2ENactShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENReconstrModernOZ2ENact.TopRow + sgENReconstrModernOZ2ENact.VisibleRowCount) = ColCount
  then
    begin
      TempENReconstrModernOZ2ENact :=  HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
      CurrentRow:=sgENReconstrModernOZ2ENact.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENReconstrModernOZ2ENactFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENReconstrModernOZ2ENactList := TempENReconstrModernOZ2ENact.getScrollableFilteredList(ENReconstrModernOZ2ENactFilter(FilterObject),ColCount-1, 100);



  sgENReconstrModernOZ2ENact.RowCount:=sgENReconstrModernOZ2ENact.RowCount+100;
  LastCount:=High(ENReconstrModernOZ2ENactList.list);
  with sgENReconstrModernOZ2ENact do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENReconstrModernOZ2ENactList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENReconstrModernOZ2ENactList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENReconstrModernOZ2ENact.Row:=CurrentRow-5;
   sgENReconstrModernOZ2ENact.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENReconstrModernOZ2ENactShow.sgENReconstrModernOZ2ENactDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENReconstrModernOZ2ENact,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENReconstrModernOZ2ENactShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENReconstrModernOZ2ENact.RowCount-1 do
   for j:=0 to sgENReconstrModernOZ2ENact.ColCount-1 do
     sgENReconstrModernOZ2ENact.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENReconstrModernOZ2ENactShow.actViewExecute(Sender: TObject);
Var TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort;
begin
 TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
   try
     ENReconstrModernOZ2ENactObj := TempENReconstrModernOZ2ENact.getObject(StrToInt(sgENReconstrModernOZ2ENact.Cells[0,sgENReconstrModernOZ2ENact.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENReconstrModernOZ2ENactEdit:=TfrmENReconstrModernOZ2ENactEdit.Create(Application, dsView);
  try
    frmENReconstrModernOZ2ENactEdit.ShowModal;
  finally
    frmENReconstrModernOZ2ENactEdit.Free;
    frmENReconstrModernOZ2ENactEdit:=nil;
  end;
end;

procedure TfrmENReconstrModernOZ2ENactShow.actEditExecute(Sender: TObject);
Var TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort;
begin
 TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
   try
     ENReconstrModernOZ2ENactObj := TempENReconstrModernOZ2ENact.getObject(StrToInt(sgENReconstrModernOZ2ENact.Cells[0,sgENReconstrModernOZ2ENact.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENReconstrModernOZ2ENactEdit:=TfrmENReconstrModernOZ2ENactEdit.Create(Application, dsEdit);
  try
    if frmENReconstrModernOZ2ENactEdit.ShowModal= mrOk then
      begin
        //TempENReconstrModernOZ2ENact.save(ENReconstrModernOZ2ENactObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENReconstrModernOZ2ENactEdit.Free;
    frmENReconstrModernOZ2ENactEdit:=nil;
  end;
end;

procedure TfrmENReconstrModernOZ2ENactShow.actDeleteExecute(Sender: TObject);
Var TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort;
  ObjCode: Integer;
begin
 TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;
   try
     ObjCode := StrToInt(sgENReconstrModernOZ2ENact.Cells[0,sgENReconstrModernOZ2ENact.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (связка реконструкція модернізація Основних засобів к актам выполненых работ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENReconstrModernOZ2ENact.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENReconstrModernOZ2ENactShow.actInsertExecute(Sender: TObject);
// Var TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort; 
begin
  // TempENReconstrModernOZ2ENact := HTTPRIOENReconstrModernOZ2ENact as ENReconstrModernOZ2ENactControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENReconstrModernOZ2ENactObj:=ENReconstrModernOZ2ENact.Create;



  try
    frmENReconstrModernOZ2ENactEdit:=TfrmENReconstrModernOZ2ENactEdit.Create(Application, dsInsert);
    try
      if frmENReconstrModernOZ2ENactEdit.ShowModal = mrOk then
      begin
        if ENReconstrModernOZ2ENactObj<>nil then
            //TempENReconstrModernOZ2ENact.add(ENReconstrModernOZ2ENactObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENReconstrModernOZ2ENactEdit.Free;
      frmENReconstrModernOZ2ENactEdit:=nil;
    end;
  finally
    ENReconstrModernOZ2ENactObj.Free;
  end;
end;

procedure TfrmENReconstrModernOZ2ENactShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENReconstrModernOZ2ENactShow.actFilterExecute(Sender: TObject);
begin
{frmENReconstrModernOZ2ENactFilterEdit:=TfrmENReconstrModernOZ2ENactFilterEdit.Create(Application, dsInsert);
  try
    ENReconstrModernOZ2ENactFilterObj := ENReconstrModernOZ2ENactFilter.Create;
    SetNullIntProps(ENReconstrModernOZ2ENactFilterObj);
    SetNullXSProps(ENReconstrModernOZ2ENactFilterObj);

    if frmENReconstrModernOZ2ENactFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENReconstrModernOZ2ENactFilter.Create;
      FilterObject := ENReconstrModernOZ2ENactFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENReconstrModernOZ2ENactFilterEdit.Free;
    frmENReconstrModernOZ2ENactFilterEdit:=nil;
  end;}
end;

procedure TfrmENReconstrModernOZ2ENactShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.