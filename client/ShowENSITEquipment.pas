
unit ShowENSITEquipment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENSITEquipmentController ;


type
  TfrmENSITEquipmentShow = class(TChildForm)  
  HTTPRIOENSITEquipment: THTTPRIO;
    ImageList1: TImageList;
    sgENSITEquipment: TAdvStringGrid;
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
procedure sgENSITEquipmentTopLeftChanged(Sender: TObject);
procedure sgENSITEquipmentDblClick(Sender: TObject);
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
 // ENSITEquipmentObj: ENSITEquipment;
 // ENSITEquipmentFilterObj: ENSITEquipmentFilter;
  
  
implementation

uses Main, EditENSITEquipment, EditENSITEquipmentFilter;


{$R *.dfm}

var
  //frmENSITEquipmentShow : TfrmENSITEquipmentShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSITEquipmentHeaders: array [1..12] of String =
        ( 'Код'
          ,'Назва'
          ,'Серійний номер'
          ,'Постачальник'
          ,'Інвентарний номер'
          ,'Дата постачання'
          ,'Ліцензія'
          ,'Опис'
          ,'Знаходження'
          ,'РЕМ'
          ,'Дата установки'
          ,'Дата ввода'
        );
   

procedure TfrmENSITEquipmentShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENSITEquipmentShow:=nil;
    inherited;
  end;


procedure TfrmENSITEquipmentShow.FormShow(Sender: TObject);
var
  TempENSITEquipment: ENSITEquipmentControllerSoapPort;
  i: Integer;
  ENSITEquipmentList: ENSITEquipmentShortList;
  begin
  SetGridHeaders(ENSITEquipmentHeaders, sgENSITEquipment.ColumnHeaders);
  ColCount:=100;
  TempENSITEquipment :=  HTTPRIOENSITEquipment as ENSITEquipmentControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSITEquipmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITEquipmentList := TempENSITEquipment.getScrollableFilteredList(ENSITEquipmentFilter(FilterObject),0,ColCount);


  LastCount:=High(ENSITEquipmentList.list);

  if LastCount > -1 then
     sgENSITEquipment.RowCount:=LastCount+2
  else
     sgENSITEquipment.RowCount:=2;

   with sgENSITEquipment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITEquipmentList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENSITEquipmentList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENSITEquipmentList.list[i].name;
        Cells[2,i+1] := ENSITEquipmentList.list[i].serialnumber;
        Cells[3,i+1] := ENSITEquipmentList.list[i].suppliername;
        Cells[4,i+1] := ENSITEquipmentList.list[i].num;
        if ENSITEquipmentList.list[i].supplierdate = nil then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := XSDate2String(ENSITEquipmentList.list[i].supplierdate);
        Cells[6,i+1] := ENSITEquipmentList.list[i].lisencepack;
        Cells[7,i+1] := ENSITEquipmentList.list[i].descr;
        Cells[8,i+1] := ENSITEquipmentList.list[i].location;
        Cells[9,i+1] := ENSITEquipmentList.list[i].ren;
        if ENSITEquipmentList.list[i].installdate = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(ENSITEquipmentList.list[i].installdate);
        if ENSITEquipmentList.list[i].inputdate = nil then
          Cells[11,i+1] := ''
        else
          Cells[11,i+1] := XSDate2String(ENSITEquipmentList.list[i].inputdate);
        LastRow:=i+1;
        sgENSITEquipment.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENSITEquipment.Row:=1;
end;

procedure TfrmENSITEquipmentShow.sgENSITEquipmentTopLeftChanged(Sender: TObject);
var
  TempENSITEquipment: ENSITEquipmentControllerSoapPort;
  i,CurrentRow: Integer;
  ENSITEquipmentList: ENSITEquipmentShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENSITEquipment.TopRow + sgENSITEquipment.VisibleRowCount) = ColCount
  then
    begin
      TempENSITEquipment :=  HTTPRIOENSITEquipment as ENSITEquipmentControllerSoapPort;
      CurrentRow:=sgENSITEquipment.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENSITEquipmentFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSITEquipmentList := TempENSITEquipment.getScrollableFilteredList(ENSITEquipmentFilter(FilterObject),ColCount-1, 100);



  sgENSITEquipment.RowCount:=sgENSITEquipment.RowCount+100;
  LastCount:=High(ENSITEquipmentList.list);
  with sgENSITEquipment do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSITEquipmentList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENSITEquipmentList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENSITEquipmentList.list[i].name;
        Cells[2,i+CurrentRow] := ENSITEquipmentList.list[i].serialnumber;
        Cells[3,i+CurrentRow] := ENSITEquipmentList.list[i].suppliername;
        Cells[4,i+CurrentRow] := ENSITEquipmentList.list[i].num;
        if ENSITEquipmentList.list[i].supplierdate = nil then
          Cells[5,i+CurrentRow] := ''
        else
          Cells[5,i+CurrentRow] := XSDate2String(ENSITEquipmentList.list[i].supplierdate);
        Cells[6,i+CurrentRow] := ENSITEquipmentList.list[i].lisencepack;
        Cells[7,i+CurrentRow] := ENSITEquipmentList.list[i].descr;
        Cells[8,i+CurrentRow] := ENSITEquipmentList.list[i].location;
        if ENSITEquipmentList.list[i].installdate = nil then
          Cells[9,i+CurrentRow] := ''
        else
          Cells[9,i+CurrentRow] := XSDate2String(ENSITEquipmentList.list[i].installdate);
        if ENSITEquipmentList.list[i].inputdate = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDate2String(ENSITEquipmentList.list[i].inputdate);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENSITEquipment.Row:=CurrentRow-5;
   sgENSITEquipment.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENSITEquipmentShow.sgENSITEquipmentDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSITEquipment,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSITEquipmentShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSITEquipment.RowCount-1 do
   for j:=0 to sgENSITEquipment.ColCount-1 do
     sgENSITEquipment.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSITEquipmentShow.actViewExecute(Sender: TObject);
Var TempENSITEquipment: ENSITEquipmentControllerSoapPort;
begin
 TempENSITEquipment := HTTPRIOENSITEquipment as ENSITEquipmentControllerSoapPort;
   try
     ENSITEquipmentObj := TempENSITEquipment.getObject(StrToInt(sgENSITEquipment.Cells[0,sgENSITEquipment.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITEquipmentEdit:=TfrmENSITEquipmentEdit.Create(Application, dsView);
  try
    frmENSITEquipmentEdit.ShowModal;
  finally
    frmENSITEquipmentEdit.Free;
    frmENSITEquipmentEdit:=nil;
  end;
end;

procedure TfrmENSITEquipmentShow.actEditExecute(Sender: TObject);
Var TempENSITEquipment: ENSITEquipmentControllerSoapPort;
begin
 TempENSITEquipment := HTTPRIOENSITEquipment as ENSITEquipmentControllerSoapPort;
   try
     ENSITEquipmentObj := TempENSITEquipment.getObject(StrToInt(sgENSITEquipment.Cells[0,sgENSITEquipment.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSITEquipmentEdit:=TfrmENSITEquipmentEdit.Create(Application, dsEdit);
  try
    if frmENSITEquipmentEdit.ShowModal= mrOk then
      begin
        //TempENSITEquipment.save(ENSITEquipmentObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSITEquipmentEdit.Free;
    frmENSITEquipmentEdit:=nil;
  end;
end;

procedure TfrmENSITEquipmentShow.actDeleteExecute(Sender: TObject);
Var TempENSITEquipment: ENSITEquipmentControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSITEquipment := HTTPRIOENSITEquipment as ENSITEquipmentControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSITEquipment.Cells[0,sgENSITEquipment.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Обьект СІТ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSITEquipment.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSITEquipmentShow.actInsertExecute(Sender: TObject);
Var TempENSITEquipment: ENSITEquipmentControllerSoapPort;
begin
  TempENSITEquipment := HTTPRIOENSITEquipment as ENSITEquipmentControllerSoapPort;
  ENSITEquipmentObj:=ENSITEquipment.Create;

   ENSITEquipmentObj.supplierdate:= TXSDate.Create;
   ENSITEquipmentObj.installdate:= TXSDate.Create;
   ENSITEquipmentObj.inputdate:= TXSDate.Create;


  try
    frmENSITEquipmentEdit:=TfrmENSITEquipmentEdit.Create(Application, dsInsert);
    try
      if frmENSITEquipmentEdit.ShowModal = mrOk then
      begin
        if ENSITEquipmentObj<>nil then
            //TempENSITEquipment.add(ENSITEquipmentObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSITEquipmentEdit.Free;
      frmENSITEquipmentEdit:=nil;
    end;
  finally
    ENSITEquipmentObj.Free;
  end;
end;

procedure TfrmENSITEquipmentShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSITEquipmentShow.actFilterExecute(Sender: TObject);
begin
frmENSITEquipmentFilterEdit:=TfrmENSITEquipmentFilterEdit.Create(Application, dsEdit);
  try
    ENSITEquipmentFilterObj := ENSITEquipmentFilter.Create;
    SetNullIntProps(ENSITEquipmentFilterObj);
    SetNullXSProps(ENSITEquipmentFilterObj);

    if frmENSITEquipmentFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSITEquipmentFilter.Create;
      FilterObject := ENSITEquipmentFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSITEquipmentFilterEdit.Free;
    frmENSITEquipmentFilterEdit:=nil;
  end;


end;

procedure TfrmENSITEquipmentShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.