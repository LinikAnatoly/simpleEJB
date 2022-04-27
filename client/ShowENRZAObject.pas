
unit ShowENRZAObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENRZAObjectController ;


type
  TfrmENRZAObjectShow = class(TChildForm)  
  HTTPRIOENRZAObject: THTTPRIO;
    ImageList1: TImageList;
    sgENRZAObject: TAdvStringGrid;
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
procedure sgENRZAObjectTopLeftChanged(Sender: TObject);
procedure sgENRZAObjectDblClick(Sender: TObject);
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
 // ENRZAObjectObj: ENRZAObject;
 // ENRZAObjectFilterObj: ENRZAObjectFilter;
  
  
implementation

uses Main, EditENRZAObject, EditENRZAObjectFilter;


{$R *.dfm}

var
  //frmENRZAObjectShow : TfrmENRZAObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENRZAObjectHeaders: array [1..4] of String =
        ( 'Код'
          ,'Назва'
          ,'Бухгалтерське найменування'
          ,'Інвентарний номер'
        );
   

procedure TfrmENRZAObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENRZAObjectShow:=nil;
    inherited;
  end;


procedure TfrmENRZAObjectShow.FormShow(Sender: TObject);
var
  TempENRZAObject: ENRZAObjectControllerSoapPort;
  i: Integer;
  ENRZAObjectList: ENRZAObjectShortList;
  begin
  SetGridHeaders(ENRZAObjectHeaders, sgENRZAObject.ColumnHeaders);
  ColCount:=100;
  TempENRZAObject :=  HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENRZAObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRZAObjectList := TempENRZAObject.getScrollableFilteredList(ENRZAObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENRZAObjectList.list);

  if LastCount > -1 then
     sgENRZAObject.RowCount:=LastCount+2
  else
     sgENRZAObject.RowCount:=2;

   with sgENRZAObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRZAObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENRZAObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENRZAObjectList.list[i].name;
        Cells[2,i+1] := ENRZAObjectList.list[i].buhName;
        Cells[3,i+1] := ENRZAObjectList.list[i].invNumber;
        LastRow:=i+1;
        sgENRZAObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENRZAObject.Row:=1;
end;

procedure TfrmENRZAObjectShow.sgENRZAObjectTopLeftChanged(Sender: TObject);
var
  TempENRZAObject: ENRZAObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENRZAObjectList: ENRZAObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENRZAObject.TopRow + sgENRZAObject.VisibleRowCount) = ColCount
  then
    begin
      TempENRZAObject :=  HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;
      CurrentRow:=sgENRZAObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENRZAObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENRZAObjectList := TempENRZAObject.getScrollableFilteredList(ENRZAObjectFilter(FilterObject),ColCount-1, 100);



  sgENRZAObject.RowCount:=sgENRZAObject.RowCount+100;
  LastCount:=High(ENRZAObjectList.list);
  with sgENRZAObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENRZAObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENRZAObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENRZAObjectList.list[i].name;
        Cells[2,i+CurrentRow] := ENRZAObjectList.list[i].buhName;
        Cells[3,i+CurrentRow] := ENRZAObjectList.list[i].invNumber;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENRZAObject.Row:=CurrentRow-5;
   sgENRZAObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENRZAObjectShow.sgENRZAObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENRZAObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENRZAObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENRZAObject.RowCount-1 do
   for j:=0 to sgENRZAObject.ColCount-1 do
     sgENRZAObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENRZAObjectShow.actViewExecute(Sender: TObject);
Var TempENRZAObject: ENRZAObjectControllerSoapPort;
begin
 TempENRZAObject := HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;
   try
     ENRZAObjectObj := TempENRZAObject.getObject(StrToInt(sgENRZAObject.Cells[0,sgENRZAObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRZAObjectEdit:=TfrmENRZAObjectEdit.Create(Application, dsView);
  try
    frmENRZAObjectEdit.ShowModal;
  finally
    frmENRZAObjectEdit.Free;
    frmENRZAObjectEdit:=nil;
  end;
end;

procedure TfrmENRZAObjectShow.actEditExecute(Sender: TObject);
Var TempENRZAObject: ENRZAObjectControllerSoapPort;
begin
 TempENRZAObject := HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;
   try
     ENRZAObjectObj := TempENRZAObject.getObject(StrToInt(sgENRZAObject.Cells[0,sgENRZAObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENRZAObjectEdit:=TfrmENRZAObjectEdit.Create(Application, dsEdit);
  try
    if frmENRZAObjectEdit.ShowModal= mrOk then
      begin
        //TempENRZAObject.save(ENRZAObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENRZAObjectEdit.Free;
    frmENRZAObjectEdit:=nil;
  end;
end;

procedure TfrmENRZAObjectShow.actDeleteExecute(Sender: TObject);
Var TempENRZAObject: ENRZAObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENRZAObject := HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENRZAObject.Cells[0,sgENRZAObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьект РЗА) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENRZAObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENRZAObjectShow.actInsertExecute(Sender: TObject);
Var TempENRZAObject: ENRZAObjectControllerSoapPort;
begin
  TempENRZAObject := HTTPRIOENRZAObject as ENRZAObjectControllerSoapPort;
  ENRZAObjectObj:=ENRZAObject.Create;



  try
    frmENRZAObjectEdit:=TfrmENRZAObjectEdit.Create(Application, dsInsert);
    try
      if frmENRZAObjectEdit.ShowModal = mrOk then
      begin
        if ENRZAObjectObj<>nil then
            //TempENRZAObject.add(ENRZAObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENRZAObjectEdit.Free;
      frmENRZAObjectEdit:=nil;
    end;
  finally
    ENRZAObjectObj.Free;
  end;
end;

procedure TfrmENRZAObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENRZAObjectShow.actFilterExecute(Sender: TObject);
begin
  frmENRZAObjectFilterEdit:=TfrmENRZAObjectFilterEdit.Create(Application, dsEdit);
  try
    ENRZAObjectFilterObj := ENRZAObjectFilter.Create;
    SetNullIntProps(ENRZAObjectFilterObj);
    SetNullXSProps(ENRZAObjectFilterObj);

    if frmENRZAObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENRZAObjectFilter.Create;
      FilterObject := ENRZAObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENRZAObjectFilterEdit.Free;
    frmENRZAObjectFilterEdit:=nil;
  end;
end;

procedure TfrmENRZAObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.