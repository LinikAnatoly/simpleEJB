
unit ShowENCabelMuftaType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENCabelMuftaTypeController, AdvObj ;


type
  TfrmENCabelMuftaTypeShow = class(TChildForm)  
  HTTPRIOENCabelMuftaType: THTTPRIO;
    ImageList1: TImageList;
    sgENCabelMuftaType: TAdvStringGrid;
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
procedure sgENCabelMuftaTypeTopLeftChanged(Sender: TObject);
procedure sgENCabelMuftaTypeDblClick(Sender: TObject);
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
 frmENCabelMuftaTypeShow : TfrmENCabelMuftaTypeShow;
 // ENCabelMuftaTypeObj: ENCabelMuftaType;
 // ENCabelMuftaTypeFilterObj: ENCabelMuftaTypeFilter;
  
  
implementation

uses Main, EditENCabelMuftaType, EditENCabelMuftaTypeFilter;


{$R *.dfm}

var
  //frmENCabelMuftaTypeShow : TfrmENCabelMuftaTypeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCabelMuftaTypeHeaders: array [1..2] of String =
        ( 'Код'
          ,'Тип кінцевої муфти'
        );
   

procedure TfrmENCabelMuftaTypeShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENCabelMuftaTypeShow:=nil;
    inherited;
  end;


procedure TfrmENCabelMuftaTypeShow.FormShow(Sender: TObject);
var
  TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
  i: Integer;
  ENCabelMuftaTypeList: ENCabelMuftaTypeShortList;
  begin
  SetGridHeaders(ENCabelMuftaTypeHeaders, sgENCabelMuftaType.ColumnHeaders);
  ColCount:=100;
  TempENCabelMuftaType :=  HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelMuftaTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelMuftaTypeList := TempENCabelMuftaType.getScrollableFilteredList(ENCabelMuftaTypeFilter(FilterObject),0,ColCount);


  LastCount:=High(ENCabelMuftaTypeList.list);

  if LastCount > -1 then
     sgENCabelMuftaType.RowCount:=LastCount+2
  else
     sgENCabelMuftaType.RowCount:=2;

   with sgENCabelMuftaType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCabelMuftaTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENCabelMuftaTypeList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENCabelMuftaTypeList.list[i].name;
        LastRow:=i+1;
        sgENCabelMuftaType.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENCabelMuftaType.Row:=1;
end;

procedure TfrmENCabelMuftaTypeShow.sgENCabelMuftaTypeTopLeftChanged(Sender: TObject);
var
  TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
  i,CurrentRow: Integer;
  ENCabelMuftaTypeList: ENCabelMuftaTypeShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENCabelMuftaType.TopRow + sgENCabelMuftaType.VisibleRowCount) = ColCount
  then
    begin
      TempENCabelMuftaType :=  HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;
      CurrentRow:=sgENCabelMuftaType.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENCabelMuftaTypeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCabelMuftaTypeList := TempENCabelMuftaType.getScrollableFilteredList(ENCabelMuftaTypeFilter(FilterObject),ColCount-1, 100);



  sgENCabelMuftaType.RowCount:=sgENCabelMuftaType.RowCount+100;
  LastCount:=High(ENCabelMuftaTypeList.list);
  with sgENCabelMuftaType do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENCabelMuftaTypeList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENCabelMuftaTypeList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENCabelMuftaTypeList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCabelMuftaType.Row:=CurrentRow-5;
   sgENCabelMuftaType.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENCabelMuftaTypeShow.sgENCabelMuftaTypeDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENCabelMuftaType,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENCabelMuftaTypeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENCabelMuftaType.RowCount-1 do
   for j:=0 to sgENCabelMuftaType.ColCount-1 do
     sgENCabelMuftaType.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENCabelMuftaTypeShow.actViewExecute(Sender: TObject);
Var TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
begin
 TempENCabelMuftaType := HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;
   try
     ENCabelMuftaTypeObj := TempENCabelMuftaType.getObject(StrToInt(sgENCabelMuftaType.Cells[0,sgENCabelMuftaType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelMuftaTypeEdit:=TfrmENCabelMuftaTypeEdit.Create(Application, dsView);
  try
    frmENCabelMuftaTypeEdit.ShowModal;
  finally
    frmENCabelMuftaTypeEdit.Free;
    frmENCabelMuftaTypeEdit:=nil;
  end;
end;

procedure TfrmENCabelMuftaTypeShow.actEditExecute(Sender: TObject);
Var TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
begin
 TempENCabelMuftaType := HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;
   try
     ENCabelMuftaTypeObj := TempENCabelMuftaType.getObject(StrToInt(sgENCabelMuftaType.Cells[0,sgENCabelMuftaType.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENCabelMuftaTypeEdit:=TfrmENCabelMuftaTypeEdit.Create(Application, dsEdit);
  try
    if frmENCabelMuftaTypeEdit.ShowModal= mrOk then
      begin
        //TempENCabelMuftaType.save(ENCabelMuftaTypeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCabelMuftaTypeEdit.Free;
    frmENCabelMuftaTypeEdit:=nil;
  end;
end;

procedure TfrmENCabelMuftaTypeShow.actDeleteExecute(Sender: TObject);
Var TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENCabelMuftaType := HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENCabelMuftaType.Cells[0,sgENCabelMuftaType.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Тип кінцевої муфти) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCabelMuftaType.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENCabelMuftaTypeShow.actInsertExecute(Sender: TObject);
// Var TempENCabelMuftaType: ENCabelMuftaTypeControllerSoapPort; 
begin
  // TempENCabelMuftaType := HTTPRIOENCabelMuftaType as ENCabelMuftaTypeControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENCabelMuftaTypeObj:=ENCabelMuftaType.Create;



  try
    frmENCabelMuftaTypeEdit:=TfrmENCabelMuftaTypeEdit.Create(Application, dsInsert);
    try
      if frmENCabelMuftaTypeEdit.ShowModal = mrOk then
      begin
        if ENCabelMuftaTypeObj<>nil then
            //TempENCabelMuftaType.add(ENCabelMuftaTypeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENCabelMuftaTypeEdit.Free;
      frmENCabelMuftaTypeEdit:=nil;
    end;
  finally
    ENCabelMuftaTypeObj.Free;
  end;
end;

procedure TfrmENCabelMuftaTypeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENCabelMuftaTypeShow.actFilterExecute(Sender: TObject);
begin
{frmENCabelMuftaTypeFilterEdit:=TfrmENCabelMuftaTypeFilterEdit.Create(Application, dsInsert);
  try
    ENCabelMuftaTypeFilterObj := ENCabelMuftaTypeFilter.Create;
    SetNullIntProps(ENCabelMuftaTypeFilterObj);
    SetNullXSProps(ENCabelMuftaTypeFilterObj);

    if frmENCabelMuftaTypeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENCabelMuftaTypeFilter.Create;
      FilterObject := ENCabelMuftaTypeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENCabelMuftaTypeFilterEdit.Free;
    frmENCabelMuftaTypeFilterEdit:=nil;
  end;}
end;

procedure TfrmENCabelMuftaTypeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.