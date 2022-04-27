
unit ShowENOwner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENOwnerController, AdvObj ;


type
  TfrmENOwnerShow = class(TChildForm)  
  HTTPRIOENOwner: THTTPRIO;
    ImageList1: TImageList;
    sgENOwner: TAdvStringGrid;
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
procedure sgENOwnerTopLeftChanged(Sender: TObject);
procedure sgENOwnerDblClick(Sender: TObject);
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
 frmENOwnerShow : TfrmENOwnerShow;
 // ENOwnerObj: ENOwner;
 // ENOwnerFilterObj: ENOwnerFilter;
  
  
implementation

uses Main, EditENOwner, EditENOwnerFilter;


{$R *.dfm}

var
  //frmENOwnerShow : TfrmENOwnerShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENOwnerHeaders: array [1..2] of String =
        ( 'Код'
          ,'Власність об"єкта'
        );
   

procedure TfrmENOwnerShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENOwnerShow:=nil;
    inherited;
  end;


procedure TfrmENOwnerShow.FormShow(Sender: TObject);
var
  TempENOwner: ENOwnerControllerSoapPort;
  i: Integer;
  ENOwnerList: ENOwnerShortList;
  begin
  SetGridHeaders(ENOwnerHeaders, sgENOwner.ColumnHeaders);
  ColCount:=100;
  TempENOwner :=  HTTPRIOENOwner as ENOwnerControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENOwnerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENOwnerList := TempENOwner.getScrollableFilteredList(ENOwnerFilter(FilterObject),0,ColCount);


  LastCount:=High(ENOwnerList.list);

  if LastCount > -1 then
     sgENOwner.RowCount:=LastCount+2
  else
     sgENOwner.RowCount:=2;

   with sgENOwner do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENOwnerList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENOwnerList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENOwnerList.list[i].name;
        LastRow:=i+1;
        sgENOwner.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENOwner.Row:=1;
end;

procedure TfrmENOwnerShow.sgENOwnerTopLeftChanged(Sender: TObject);
var
  TempENOwner: ENOwnerControllerSoapPort;
  i,CurrentRow: Integer;
  ENOwnerList: ENOwnerShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENOwner.TopRow + sgENOwner.VisibleRowCount) = ColCount
  then
    begin
      TempENOwner :=  HTTPRIOENOwner as ENOwnerControllerSoapPort;
      CurrentRow:=sgENOwner.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENOwnerFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENOwnerList := TempENOwner.getScrollableFilteredList(ENOwnerFilter(FilterObject),ColCount-1, 100);



  sgENOwner.RowCount:=sgENOwner.RowCount+100;
  LastCount:=High(ENOwnerList.list);
  with sgENOwner do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENOwnerList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENOwnerList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENOwnerList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENOwner.Row:=CurrentRow-5;
   sgENOwner.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENOwnerShow.sgENOwnerDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENOwner,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENOwnerShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENOwner.RowCount-1 do
   for j:=0 to sgENOwner.ColCount-1 do
     sgENOwner.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENOwnerShow.actViewExecute(Sender: TObject);
Var TempENOwner: ENOwnerControllerSoapPort;
begin
 TempENOwner := HTTPRIOENOwner as ENOwnerControllerSoapPort;
   try
     ENOwnerObj := TempENOwner.getObject(StrToInt(sgENOwner.Cells[0,sgENOwner.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOwnerEdit:=TfrmENOwnerEdit.Create(Application, dsView);
  try
    frmENOwnerEdit.ShowModal;
  finally
    frmENOwnerEdit.Free;
    frmENOwnerEdit:=nil;
  end;
end;

procedure TfrmENOwnerShow.actEditExecute(Sender: TObject);
Var TempENOwner: ENOwnerControllerSoapPort;
begin
 TempENOwner := HTTPRIOENOwner as ENOwnerControllerSoapPort;
   try
     ENOwnerObj := TempENOwner.getObject(StrToInt(sgENOwner.Cells[0,sgENOwner.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENOwnerEdit:=TfrmENOwnerEdit.Create(Application, dsEdit);
  try
    if frmENOwnerEdit.ShowModal= mrOk then
      begin
        //TempENOwner.save(ENOwnerObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENOwnerEdit.Free;
    frmENOwnerEdit:=nil;
  end;
end;

procedure TfrmENOwnerShow.actDeleteExecute(Sender: TObject);
Var TempENOwner: ENOwnerControllerSoapPort;
  ObjCode: Integer;
begin
 TempENOwner := HTTPRIOENOwner as ENOwnerControllerSoapPort;
   try
     ObjCode := StrToInt(sgENOwner.Cells[0,sgENOwner.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Власник об"єкта) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENOwner.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENOwnerShow.actInsertExecute(Sender: TObject);
Var TempENOwner: ENOwnerControllerSoapPort;
begin
  TempENOwner := HTTPRIOENOwner as ENOwnerControllerSoapPort;
  ENOwnerObj:=ENOwner.Create;



  try
    frmENOwnerEdit:=TfrmENOwnerEdit.Create(Application, dsInsert);
    try
      if frmENOwnerEdit.ShowModal = mrOk then
      begin
        if ENOwnerObj<>nil then
            //TempENOwner.add(ENOwnerObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENOwnerEdit.Free;
      frmENOwnerEdit:=nil;
    end;
  finally
    ENOwnerObj.Free;
  end;
end;

procedure TfrmENOwnerShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENOwnerShow.actFilterExecute(Sender: TObject);
begin
frmENOwnerFilterEdit:=TfrmENOwnerFilterEdit.Create(Application, dsEdit);
  try
    ENOwnerFilterObj := ENOwnerFilter.Create;
    SetNullIntProps(ENOwnerFilterObj);
    SetNullXSProps(ENOwnerFilterObj);

    if frmENOwnerFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := ENOwnerFilter.Create;
      FilterObject := ENOwnerFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENOwnerFilterEdit.Free;
    frmENOwnerFilterEdit:=nil;
  end;
end;

procedure TfrmENOwnerShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.