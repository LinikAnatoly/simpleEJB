
unit ShowENAutoTires;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAutoTiresController, AdvObj ;


type
  TfrmENAutoTiresShow = class(TChildForm)  
  HTTPRIOENAutoTires: THTTPRIO;
    ImageList1: TImageList;
    sgENAutoTires: TAdvStringGrid;
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
procedure sgENAutoTiresTopLeftChanged(Sender: TObject);
procedure sgENAutoTiresDblClick(Sender: TObject);
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
 frmENAutoTiresShow : TfrmENAutoTiresShow;
 // ENAutoTiresObj: ENAutoTires;
 // ENAutoTiresFilterObj: ENAutoTiresFilter;
  
  
implementation

uses Main, EditENAutoTires, EditENAutoTiresFilter;


{$R *.dfm}

var
  //frmENAutoTiresShow : TfrmENAutoTiresShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAutoTiresHeaders: array [1..8] of String =
        ( 'Код'
          ,'тип или название'
          ,'гаражный №'
          ,'серийный №'
          ,'завод-изготовитель'
          ,'ресурс, км'
          ,'общий пробег, км'
          ,'размер'
        );
   

procedure TfrmENAutoTiresShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAutoTiresShow:=nil;
    inherited;
  end;


procedure TfrmENAutoTiresShow.FormShow(Sender: TObject);
var
  TempENAutoTires: ENAutoTiresControllerSoapPort;
  i: Integer;
  ENAutoTiresList: ENAutoTiresShortList;
  begin
  SetGridHeaders(ENAutoTiresHeaders, sgENAutoTires.ColumnHeaders);
  ColCount:=100;
  TempENAutoTires :=  HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAutoTiresFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutoTiresList := TempENAutoTires.getScrollableFilteredList(ENAutoTiresFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAutoTiresList.list);

  if LastCount > -1 then
     sgENAutoTires.RowCount:=LastCount+2
  else
     sgENAutoTires.RowCount:=2;

   with sgENAutoTires do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutoTiresList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAutoTiresList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENAutoTiresList.list[i].typeName;
        Cells[2,i+1] := ENAutoTiresList.list[i].garageNumber;
        Cells[3,i+1] := ENAutoTiresList.list[i].serialNumber;
        Cells[4,i+1] := ENAutoTiresList.list[i].factory;
        if ENAutoTiresList.list[i].potencial = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := ENAutoTiresList.list[i].potencial.DecimalString;
        if ENAutoTiresList.list[i].distanceAll = nil then
          Cells[6,i+1] := ''
        else
          Cells[6,i+1] := ENAutoTiresList.list[i].distanceAll.DecimalString;
        Cells[7,i+1] := ENAutoTiresList.list[i].nominal;
        LastRow:=i+1;
        sgENAutoTires.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAutoTires.Row:=1;
end;

procedure TfrmENAutoTiresShow.sgENAutoTiresTopLeftChanged(Sender: TObject);
var
  TempENAutoTires: ENAutoTiresControllerSoapPort;
  i,CurrentRow: Integer;
  ENAutoTiresList: ENAutoTiresShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAutoTires.TopRow + sgENAutoTires.VisibleRowCount) = ColCount
  then
    begin
      TempENAutoTires :=  HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
      CurrentRow:=sgENAutoTires.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAutoTiresFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAutoTiresList := TempENAutoTires.getScrollableFilteredList(ENAutoTiresFilter(FilterObject),ColCount-1, 100);



  sgENAutoTires.RowCount:=sgENAutoTires.RowCount+100;
  LastCount:=High(ENAutoTiresList.list);
  with sgENAutoTires do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAutoTiresList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAutoTiresList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENAutoTiresList.list[i].typeName;
        Cells[2,i+CurrentRow] := ENAutoTiresList.list[i].garageNumber;
        Cells[3,i+CurrentRow] := ENAutoTiresList.list[i].serialNumber;
        Cells[4,i+CurrentRow] := ENAutoTiresList.list[i].factory;
        if ENAutoTiresList.list[i].potencial = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := ENAutoTiresList.list[i].potencial.DecimalString;
        if ENAutoTiresList.list[i].distanceAll = nil then
          Cells[6,i+CurrentRow] := ''
        else
          Cells[6,i+CurrentRow] := ENAutoTiresList.list[i].distanceAll.DecimalString;
        Cells[7,i+CurrentRow] := ENAutoTiresList.list[i].nominal;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAutoTires.Row:=CurrentRow-5;
   sgENAutoTires.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAutoTiresShow.sgENAutoTiresDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAutoTires,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAutoTiresShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAutoTires.RowCount-1 do
   for j:=0 to sgENAutoTires.ColCount-1 do
     sgENAutoTires.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAutoTiresShow.actViewExecute(Sender: TObject);
var TempENAutoTires: ENAutoTiresControllerSoapPort;
    ObjCode : Integer;
begin
 TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAutoTires.Cells[0,sgENAutoTires.Row]);
   except
   on EConvertError do Exit;
  end;
  frmENAutoTiresEdit:=TfrmENAutoTiresEdit.Create(Application, dsView);
  try
    frmENAutoTiresEdit.ENAutoTiresObj := TempENAutoTires.getObject(ObjCode);
    frmENAutoTiresEdit.ShowModal;
  finally
    frmENAutoTiresEdit.Free;
    frmENAutoTiresEdit:=nil;
  end;
end;

procedure TfrmENAutoTiresShow.actEditExecute(Sender: TObject);
var TempENAutoTires: ENAutoTiresControllerSoapPort;
    ObjCode : Integer;
begin
 TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAutoTires.Cells[0,sgENAutoTires.Row]);
   except
   on EConvertError do Exit;
  end;
  frmENAutoTiresEdit:=TfrmENAutoTiresEdit.Create(Application, dsEdit);
  try
    frmENAutoTiresEdit.ENAutoTiresObj := TempENAutoTires.getObject(ObjCode);
    if frmENAutoTiresEdit.ShowModal= mrOk then
      begin
        //TempENAutoTires.save(ENAutoTiresObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAutoTiresEdit.Free;
    frmENAutoTiresEdit:=nil;
  end;
end;

procedure TfrmENAutoTiresShow.actDeleteExecute(Sender: TObject);
Var TempENAutoTires: ENAutoTiresControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAutoTires.Cells[0,sgENAutoTires.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Автопокрышки) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAutoTires.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAutoTiresShow.actInsertExecute(Sender: TObject);
Var TempENAutoTires: ENAutoTiresControllerSoapPort;
begin
  TempENAutoTires := HTTPRIOENAutoTires as ENAutoTiresControllerSoapPort;

   //ENAutoTiresObj.potencial:= TXSDecimal.Create;
   //ENAutoTiresObj.distanceAll:= TXSDecimal.Create;

  try
    frmENAutoTiresEdit := TfrmENAutoTiresEdit.Create(Application, dsInsert);
    frmENAutoTiresEdit.ENAutoTiresObj := ENAutoTires.Create;

    try
      if frmENAutoTiresEdit.ShowModal = mrOk then
      begin
        if frmENAutoTiresEdit.ENAutoTiresObj <> nil then
            //TempENAutoTires.add(ENAutoTiresObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAutoTiresEdit.Free;
      frmENAutoTiresEdit:=nil;
    end;
  finally
    //ENAutoTiresObj.Free;
  end;
end;

procedure TfrmENAutoTiresShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAutoTiresShow.actFilterExecute(Sender: TObject);
begin
frmENAutoTiresFilterEdit:=TfrmENAutoTiresFilterEdit.Create(Application, dsInsert);
  try
    ENAutoTiresFilterObj := ENAutoTiresFilter.Create;
    SetNullIntProps(ENAutoTiresFilterObj);
    SetNullXSProps(ENAutoTiresFilterObj);

    if frmENAutoTiresFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAutoTiresFilter.Create;
      FilterObject := ENAutoTiresFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAutoTiresFilterEdit.Free;
    frmENAutoTiresFilterEdit:=nil;
  end;
end;

procedure TfrmENAutoTiresShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.