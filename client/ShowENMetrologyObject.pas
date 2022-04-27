
unit ShowENMetrologyObject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENMetrologyObjectController, AdvObj ;


type
  TfrmENMetrologyObjectShow = class(TChildForm)  
  HTTPRIOENMetrologyObject: THTTPRIO;
    ImageList1: TImageList;
    sgENMetrologyObject: TAdvStringGrid;
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
procedure sgENMetrologyObjectTopLeftChanged(Sender: TObject);
procedure sgENMetrologyObjectDblClick(Sender: TObject);
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
 frmENMetrologyObjectShow : TfrmENMetrologyObjectShow;
 // ENMetrologyObjectObj: ENMetrologyObject;
 // ENMetrologyObjectFilterObj: ENMetrologyObjectFilter;
  
  
implementation

uses Main, EditENMetrologyObject, EditENMetrologyObjectFilter;


{$R *.dfm}

var
  //frmENMetrologyObjectShow : TfrmENMetrologyObjectShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENMetrologyObjectHeaders: array [1..4] of String =
        ( 'Код'
          ,'Найменування  об''єкту (тип лічильника)'
          ,'Фазність' //'Кількість фаз'
          ,'Тип (Індукційний/Електронний)'
        );
   

procedure TfrmENMetrologyObjectShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENMetrologyObjectShow:=nil;
    inherited;
  end;


procedure TfrmENMetrologyObjectShow.FormShow(Sender: TObject);
var
  TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
  i: Integer;
  ENMetrologyObjectList: ENMetrologyObjectShortList;
  begin
  SetGridHeaders(ENMetrologyObjectHeaders, sgENMetrologyObject.ColumnHeaders);
  ColCount:=100;
  TempENMetrologyObject :=  HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMetrologyObjectList := TempENMetrologyObject.getScrollableFilteredList(ENMetrologyObjectFilter(FilterObject),0,ColCount);


  LastCount:=High(ENMetrologyObjectList.list);

  if LastCount > -1 then
     sgENMetrologyObject.RowCount:=LastCount+2
  else
     sgENMetrologyObject.RowCount:=2;

   with sgENMetrologyObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENMetrologyObjectList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENMetrologyObjectList.list[i].name;

        if ENMetrologyObjectList.list[i].is3phase = Low(Integer) then
          Cells[2,i+1] := ''
        else
        begin
          if  ENMetrologyObjectList.list[i].is3phase = 1 then
             Cells[2,i+1] := 'Трифазний' //IntToStr(ENMetrologyObjectList.list[i].is3phase);
          else
             Cells[2,i+1] := 'Однофазний'
        end;

        if ENMetrologyObjectList.list[i].isElectron = Low(Integer) then
          Cells[3,i+1] := ''
        else
        begin

          if  ENMetrologyObjectList.list[i].isElectron = 1 then
             Cells[3,i+1] := 'Електронний' //IntToStr(ENMetrologyObjectList.list[i].is3phase);
          else
             Cells[3,i+1] := 'Індукцiйний';

        end;
          //Cells[3,i+1] := IntToStr(ENMetrologyObjectList.list[i].isElectron);


        LastRow:=i+1;
        sgENMetrologyObject.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENMetrologyObject.Row:=1;
end;

procedure TfrmENMetrologyObjectShow.sgENMetrologyObjectTopLeftChanged(Sender: TObject);
var
  TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
  i,CurrentRow: Integer;
  ENMetrologyObjectList: ENMetrologyObjectShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENMetrologyObject.TopRow + sgENMetrologyObject.VisibleRowCount) = ColCount
  then
    begin
      TempENMetrologyObject :=  HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
      CurrentRow:=sgENMetrologyObject.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENMetrologyObjectFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENMetrologyObjectList := TempENMetrologyObject.getScrollableFilteredList(ENMetrologyObjectFilter(FilterObject),ColCount-1, 100);



  sgENMetrologyObject.RowCount:=sgENMetrologyObject.RowCount+100;
  LastCount:=High(ENMetrologyObjectList.list);
  with sgENMetrologyObject do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENMetrologyObjectList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENMetrologyObjectList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENMetrologyObjectList.list[i].name;

        if ENMetrologyObjectList.list[i].is3phase = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
        begin
          if  ENMetrologyObjectList.list[i].is3phase = 1 then
             Cells[2,i+CurrentRow] := 'Трифазний' //IntToStr(ENMetrologyObjectList.list[i].is3phase);
          else
             Cells[2,i+CurrentRow] := 'Однофазний';
        end;

        if ENMetrologyObjectList.list[i].isElectron = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
        begin

          if  ENMetrologyObjectList.list[i].isElectron = 1 then
             Cells[3,i+CurrentRow] := 'Електронний' //IntToStr(ENMetrologyObjectList.list[i].is3phase);
          else
             Cells[3,i+CurrentRow] := 'Індукцiйний';
        end;
        

{
        if ENMetrologyObjectList.list[i].is3phase = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENMetrologyObjectList.list[i].is3phase);
        if ENMetrologyObjectList.list[i].isElectron = Low(Integer) then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := IntToStr(ENMetrologyObjectList.list[i].isElectron);
}
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENMetrologyObject.Row:=CurrentRow-5;
   sgENMetrologyObject.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENMetrologyObjectShow.sgENMetrologyObjectDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENMetrologyObject,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENMetrologyObjectShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENMetrologyObject.RowCount-1 do
   for j:=0 to sgENMetrologyObject.ColCount-1 do
     sgENMetrologyObject.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENMetrologyObjectShow.actViewExecute(Sender: TObject);
Var TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
begin
 TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
   try
     ENMetrologyObjectObj := TempENMetrologyObject.getObject(StrToInt(sgENMetrologyObject.Cells[0,sgENMetrologyObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyObjectEdit:=TfrmENMetrologyObjectEdit.Create(Application, dsView);
  try
    frmENMetrologyObjectEdit.ShowModal;
  finally
    frmENMetrologyObjectEdit.Free;
    frmENMetrologyObjectEdit:=nil;
  end;
end;

procedure TfrmENMetrologyObjectShow.actEditExecute(Sender: TObject);
Var TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
begin
 TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
   try
     ENMetrologyObjectObj := TempENMetrologyObject.getObject(StrToInt(sgENMetrologyObject.Cells[0,sgENMetrologyObject.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENMetrologyObjectEdit:=TfrmENMetrologyObjectEdit.Create(Application, dsEdit);
  try
    if frmENMetrologyObjectEdit.ShowModal= mrOk then
      begin
        //TempENMetrologyObject.save(ENMetrologyObjectObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENMetrologyObjectEdit.Free;
    frmENMetrologyObjectEdit:=nil;
  end;
end;

procedure TfrmENMetrologyObjectShow.actDeleteExecute(Sender: TObject);
Var TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
  ObjCode: Integer;
begin
 TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
   try
     ObjCode := StrToInt(sgENMetrologyObject.Cells[0,sgENMetrologyObject.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьекти для замовлення матеріалів Метрології) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENMetrologyObject.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENMetrologyObjectShow.actInsertExecute(Sender: TObject);
Var TempENMetrologyObject: ENMetrologyObjectControllerSoapPort;
begin
  TempENMetrologyObject := HTTPRIOENMetrologyObject as ENMetrologyObjectControllerSoapPort;
  ENMetrologyObjectObj:=ENMetrologyObject.Create;



  try
    frmENMetrologyObjectEdit:=TfrmENMetrologyObjectEdit.Create(Application, dsInsert);
    try
      if frmENMetrologyObjectEdit.ShowModal = mrOk then
      begin
        if ENMetrologyObjectObj<>nil then
            //TempENMetrologyObject.add(ENMetrologyObjectObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENMetrologyObjectEdit.Free;
      frmENMetrologyObjectEdit:=nil;
    end;
  finally
    ENMetrologyObjectObj.Free;
  end;
end;

procedure TfrmENMetrologyObjectShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENMetrologyObjectShow.actFilterExecute(Sender: TObject);
begin
{frmENMetrologyObjectFilterEdit:=TfrmENMetrologyObjectFilterEdit.Create(Application, dsEdit);
  try
    ENMetrologyObjectFilterObj := ENMetrologyObjectFilter.Create;
    SetNullIntProps(ENMetrologyObjectFilterObj);
    SetNullXSProps(ENMetrologyObjectFilterObj);

    if frmENMetrologyObjectFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENMetrologyObjectFilter.Create;
      FilterObject := ENMetrologyObjectFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENMetrologyObjectFilterEdit.Free;
    frmENMetrologyObjectFilterEdit:=nil;
  end;}
end;

procedure TfrmENMetrologyObjectShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.