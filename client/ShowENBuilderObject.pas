
unit ShowENBuilderObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENBuilderObjectController ;


type
  TfrmENBuilderObjectShow = class(TChildForm)  
  HTTPRIOENBuilderObject: THTTPRIO;
    ImageList1: TImageList;
    sgENBuilderObject: TAdvStringGrid;
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
procedure sgENBuilderObjectTopLeftChanged(Sender: TObject);
procedure sgENBuilderObjectDblClick(Sender: TObject);
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
 // ENBuilderObjectObj: ENBuilderObject;
 // ENBuilderObjectFilterObj: ENBuilderObjectFilter;
  
  
implementation

uses Main, EditENBuilderObject, EditENBuilderObjectFilter;


{$R *.dfm}

var
  //frmENBuilderObjectShow : TfrmENBuilderObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENBuilderObjectHeaders: array [1..7] of String =
        ( 'Код'
          ,'Інвентарній номер обьекту'
          ,'Найменування  обьекту'
          ,'Бухгалтерське найменування обьекту'
          ,'Рік будівництва'
          ,'Рік введення у експлуатацію'
          ,'пользователь внесший изменение'
        );
   

procedure TfrmENBuilderObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENBuilderObjectShow:=nil;
    inherited;
  end;


procedure TfrmENBuilderObjectShow.FormShow(Sender: TObject);
var
  TempENBuilderObject: ENBuilderObjectControllerSoapPort;
  i: Integer;
  ENBuilderObjectList: ENBuilderObjectShortList;
  begin
  SetGridHeaders(ENBuilderObjectHeaders, sgENBuilderObject.ColumnHeaders);
  ColCount:=100;
  TempENBuilderObject :=  HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilderObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilderObjectList := TempENBuilderObject.getScrollableFilteredList(ENBuilderObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENBuilderObjectList.list);

  if LastCount > -1 then
     sgENBuilderObject.RowCount:=LastCount+2
  else
     sgENBuilderObject.RowCount:=2;

   with sgENBuilderObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilderObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENBuilderObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENBuilderObjectList.list[i].invNumber;
        Cells[2,i+1] := ENBuilderObjectList.list[i].name;
        Cells[3,i+1] := ENBuilderObjectList.list[i].buhName;
        if ENBuilderObjectList.list[i].yearBuild = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENBuilderObjectList.list[i].yearBuild);
        if ENBuilderObjectList.list[i].yearWorkingStart = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENBuilderObjectList.list[i].yearWorkingStart);
        Cells[6,i+1] := ENBuilderObjectList.list[i].userGen;
        LastRow:=i+1;
        sgENBuilderObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENBuilderObject.Row:=1;
end;

procedure TfrmENBuilderObjectShow.sgENBuilderObjectTopLeftChanged(Sender: TObject);
var
  TempENBuilderObject: ENBuilderObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENBuilderObjectList: ENBuilderObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENBuilderObject.TopRow + sgENBuilderObject.VisibleRowCount) = ColCount
  then
    begin
      TempENBuilderObject :=  HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;
      CurrentRow:=sgENBuilderObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENBuilderObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENBuilderObjectList := TempENBuilderObject.getScrollableFilteredList(ENBuilderObjectFilter(FilterObject),ColCount-1, 100);



  sgENBuilderObject.RowCount:=sgENBuilderObject.RowCount+100;
  LastCount:=High(ENBuilderObjectList.list);
  with sgENBuilderObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENBuilderObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENBuilderObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENBuilderObjectList.list[i].invNumber;
        Cells[2,i+CurrentRow] := ENBuilderObjectList.list[i].name;
        Cells[3,i+CurrentRow] := ENBuilderObjectList.list[i].buhName;
        if ENBuilderObjectList.list[i].yearBuild = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENBuilderObjectList.list[i].yearBuild);
        if ENBuilderObjectList.list[i].yearWorkingStart = Low(Integer) then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := IntToStr(ENBuilderObjectList.list[i].yearWorkingStart);
        Cells[6,i+CurrentRow] := ENBuilderObjectList.list[i].userGen;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENBuilderObject.Row:=CurrentRow-5;
   sgENBuilderObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENBuilderObjectShow.sgENBuilderObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENBuilderObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENBuilderObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENBuilderObject.RowCount-1 do
   for j:=0 to sgENBuilderObject.ColCount-1 do
     sgENBuilderObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENBuilderObjectShow.actViewExecute(Sender: TObject);
Var TempENBuilderObject: ENBuilderObjectControllerSoapPort;
begin
 TempENBuilderObject := HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;
   try
     ENBuilderObjectObj := TempENBuilderObject.getObject(StrToInt(sgENBuilderObject.Cells[0,sgENBuilderObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBuilderObjectEdit:=TfrmENBuilderObjectEdit.Create(Application, dsView);
  try
    frmENBuilderObjectEdit.ShowModal;
  finally
    frmENBuilderObjectEdit.Free;
    frmENBuilderObjectEdit:=nil;
  end;
end;

procedure TfrmENBuilderObjectShow.actEditExecute(Sender: TObject);
Var TempENBuilderObject: ENBuilderObjectControllerSoapPort;
begin
 TempENBuilderObject := HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;
   try
     ENBuilderObjectObj := TempENBuilderObject.getObject(StrToInt(sgENBuilderObject.Cells[0,sgENBuilderObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENBuilderObjectEdit:=TfrmENBuilderObjectEdit.Create(Application, dsEdit);
  try
    if frmENBuilderObjectEdit.ShowModal= mrOk then
      begin
        //TempENBuilderObject.save(ENBuilderObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENBuilderObjectEdit.Free;
    frmENBuilderObjectEdit:=nil;
  end;
end;

procedure TfrmENBuilderObjectShow.actDeleteExecute(Sender: TObject);
Var TempENBuilderObject: ENBuilderObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENBuilderObject := HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENBuilderObject.Cells[0,sgENBuilderObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьекти будівельной служби) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENBuilderObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENBuilderObjectShow.actInsertExecute(Sender: TObject);
Var TempENBuilderObject: ENBuilderObjectControllerSoapPort;
begin
  TempENBuilderObject := HTTPRIOENBuilderObject as ENBuilderObjectControllerSoapPort;
  ENBuilderObjectObj:=ENBuilderObject.Create;

   ENBuilderObjectObj.dateGen:= TXSDate.Create;


  try
    frmENBuilderObjectEdit:=TfrmENBuilderObjectEdit.Create(Application, dsInsert);
    try
      if frmENBuilderObjectEdit.ShowModal = mrOk then
      begin
        if ENBuilderObjectObj<>nil then
            //TempENBuilderObject.add(ENBuilderObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENBuilderObjectEdit.Free;
      frmENBuilderObjectEdit:=nil;
    end;
  finally
    ENBuilderObjectObj.Free;
  end;
end;

procedure TfrmENBuilderObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENBuilderObjectShow.actFilterExecute(Sender: TObject);
begin
{frmENBuilderObjectFilterEdit:=TfrmENBuilderObjectFilterEdit.Create(Application, dsEdit);
  try
    ENBuilderObjectFilterObj := ENBuilderObjectFilter.Create;
    SetNullIntProps(ENBuilderObjectFilterObj);
    SetNullXSProps(ENBuilderObjectFilterObj);

    if frmENBuilderObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENBuilderObjectFilter.Create;
      FilterObject := ENBuilderObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENBuilderObjectFilterEdit.Free;
    frmENBuilderObjectFilterEdit:=nil;
  end;}
end;

procedure TfrmENBuilderObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.