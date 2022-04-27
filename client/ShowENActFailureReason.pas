
unit ShowENActFailureReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENActFailureReasonController, AdvObj ;


type
  TfrmENActFailureReasonShow = class(TChildForm)  
  HTTPRIOENActFailureReason: THTTPRIO;
    ImageList1: TImageList;
    sgENActFailureReason: TAdvStringGrid;
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
procedure sgENActFailureReasonTopLeftChanged(Sender: TObject);
procedure sgENActFailureReasonDblClick(Sender: TObject);
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

var
 frmENActFailureReasonShow : TfrmENActFailureReasonShow;
 // ENActFailureReasonObj: ENActFailureReason;
 // ENActFailureReasonFilterObj: ENActFailureReasonFilter;
  
  
implementation

uses Main, EditENActFailureReason, EditENActFailureReasonFilter;


{$R *.dfm}

var
  //frmENActFailureReasonShow : TfrmENActFailureReasonShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENActFailureReasonHeaders: array [1..2] of String =
        ( 'Код'
          ,'Найменування'
        );
   

procedure TfrmENActFailureReasonShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENActFailureReasonShow:=nil;
    inherited;
  end;


procedure TfrmENActFailureReasonShow.FormShow(Sender: TObject);
var
  TempENActFailureReason: ENActFailureReasonControllerSoapPort;
  i: Integer;
  ENActFailureReasonList: ENActFailureReasonShortList;
  begin
  SetGridHeaders(ENActFailureReasonHeaders, sgENActFailureReason.ColumnHeaders);
  ColCount:=100;
  TempENActFailureReason :=  HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENActFailureReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActFailureReasonList := TempENActFailureReason.getScrollableFilteredList(ENActFailureReasonFilter(FilterObject),0,ColCount);


  LastCount:=High(ENActFailureReasonList.list);

  if LastCount > -1 then
     sgENActFailureReason.RowCount:=LastCount+2
  else
     sgENActFailureReason.RowCount:=2;

   with sgENActFailureReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActFailureReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENActFailureReasonList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENActFailureReasonList.list[i].name;
        LastRow:=i+1;
        sgENActFailureReason.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENActFailureReason.Row:=1;
end;

procedure TfrmENActFailureReasonShow.sgENActFailureReasonTopLeftChanged(Sender: TObject);
var
  TempENActFailureReason: ENActFailureReasonControllerSoapPort;
  i,CurrentRow: Integer;
  ENActFailureReasonList: ENActFailureReasonShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENActFailureReason.TopRow + sgENActFailureReason.VisibleRowCount) = ColCount
  then
    begin
      TempENActFailureReason :=  HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;
      CurrentRow:=sgENActFailureReason.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENActFailureReasonFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENActFailureReasonList := TempENActFailureReason.getScrollableFilteredList(ENActFailureReasonFilter(FilterObject),ColCount-1, 100);



  sgENActFailureReason.RowCount:=sgENActFailureReason.RowCount+100;
  LastCount:=High(ENActFailureReasonList.list);
  with sgENActFailureReason do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENActFailureReasonList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENActFailureReasonList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENActFailureReasonList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENActFailureReason.Row:=CurrentRow-5;
   sgENActFailureReason.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENActFailureReasonShow.sgENActFailureReasonDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENActFailureReason,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENActFailureReasonShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENActFailureReason.RowCount-1 do
   for j:=0 to sgENActFailureReason.ColCount-1 do
     sgENActFailureReason.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENActFailureReasonShow.actViewExecute(Sender: TObject);
Var TempENActFailureReason: ENActFailureReasonControllerSoapPort;
begin
 TempENActFailureReason := HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;
   try
     ENActFailureReasonObj := TempENActFailureReason.getObject(StrToInt(sgENActFailureReason.Cells[0,sgENActFailureReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActFailureReasonEdit:=TfrmENActFailureReasonEdit.Create(Application, dsView);
  try
    frmENActFailureReasonEdit.ShowModal;
  finally
    frmENActFailureReasonEdit.Free;
    frmENActFailureReasonEdit:=nil;
  end;
end;

procedure TfrmENActFailureReasonShow.actEditExecute(Sender: TObject);
Var TempENActFailureReason: ENActFailureReasonControllerSoapPort;
begin
 TempENActFailureReason := HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;
   try
     ENActFailureReasonObj := TempENActFailureReason.getObject(StrToInt(sgENActFailureReason.Cells[0,sgENActFailureReason.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENActFailureReasonEdit:=TfrmENActFailureReasonEdit.Create(Application, dsEdit);
  try
    if frmENActFailureReasonEdit.ShowModal= mrOk then
      begin
        //TempENActFailureReason.save(ENActFailureReasonObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENActFailureReasonEdit.Free;
    frmENActFailureReasonEdit:=nil;
  end;
end;

procedure TfrmENActFailureReasonShow.actDeleteExecute(Sender: TObject);
Var TempENActFailureReason: ENActFailureReasonControllerSoapPort;
  ObjCode: Integer;
begin
 TempENActFailureReason := HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;
   try
     ObjCode := StrToInt(sgENActFailureReason.Cells[0,sgENActFailureReason.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Причини невиконання робіт) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENActFailureReason.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENActFailureReasonShow.actInsertExecute(Sender: TObject);
// Var TempENActFailureReason: ENActFailureReasonControllerSoapPort; 
begin
  // TempENActFailureReason := HTTPRIOENActFailureReason as ENActFailureReasonControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENActFailureReasonObj:=ENActFailureReason.Create;



  try
    frmENActFailureReasonEdit:=TfrmENActFailureReasonEdit.Create(Application, dsInsert);
    try
      if frmENActFailureReasonEdit.ShowModal = mrOk then
      begin
        if ENActFailureReasonObj<>nil then
            //TempENActFailureReason.add(ENActFailureReasonObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENActFailureReasonEdit.Free;
      frmENActFailureReasonEdit:=nil;
    end;
  finally
    ENActFailureReasonObj.Free;
  end;
end;

procedure TfrmENActFailureReasonShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENActFailureReasonShow.actFilterExecute(Sender: TObject);
begin
{frmENActFailureReasonFilterEdit:=TfrmENActFailureReasonFilterEdit.Create(Application, dsInsert);
  try
    ENActFailureReasonFilterObj := ENActFailureReasonFilter.Create;
    SetNullIntProps(ENActFailureReasonFilterObj);
    SetNullXSProps(ENActFailureReasonFilterObj);

    if frmENActFailureReasonFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENActFailureReasonFilter.Create;
      FilterObject := ENActFailureReasonFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENActFailureReasonFilterEdit.Free;
    frmENActFailureReasonFilterEdit:=nil;
  end;}
end;

procedure TfrmENActFailureReasonShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.