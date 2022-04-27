
unit ShowENAccess2Enelement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENAccess2EnelementController ;


type
  TfrmENAccess2EnelementShow = class(TChildForm)  
  HTTPRIOENAccess2Enelement: THTTPRIO;
    ImageList1: TImageList;
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
    sgENAccess2Enelement: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENAccess2EnelementTopLeftChanged(Sender: TObject);
procedure sgENAccess2EnelementDblClick(Sender: TObject);
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
   isFiltered : boolean;
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENAccess2EnelementObj: ENAccess2Enelement;
 // ENAccess2EnelementFilterObj: ENAccess2EnelementFilter;
  
  
implementation

uses Main, EditENAccess2Enelement, EditENAccess2EnelementFilter; //,
//  ShowENAccess2Enelement;


{$R *.dfm}

var
  //frmENAccess2EnelementShow : TfrmENAccess2EnelementShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENAccess2EnelementHeaders: array [1..6] of String =
        (  'Код'
          ,'Назва об`єкту'
          ,'Бухгалтерська назва об`єкту'
          ,'Інвентарний номер об`єкту'
          ,'Підрозділ'
          ,'Доступ'
        );
   

procedure TfrmENAccess2EnelementShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENAccess2EnelementShow:=nil;
    inherited;
  end;


procedure TfrmENAccess2EnelementShow.FormShow(Sender: TObject);
var
  TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort;
  i: Integer;
  ENAccess2EnelementList: ENAccess2EnelementShortList;
  begin
  SetGridHeaders(ENAccess2EnelementHeaders, sgENAccess2Enelement.ColumnHeaders);
  ColCount:=100;
  TempENAccess2Enelement :=  HTTPRIOENAccess2Enelement as ENAccess2EnelementControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENAccess2EnelementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if not isFiltered then
  begin
      isFiltered := true;
      actFilterExecute(Sender);
      exit;
  end;

  ENAccess2EnelementList := TempENAccess2Enelement.getScrollableFilteredList(ENAccess2EnelementFilter(FilterObject),0,ColCount);


  LastCount:=High(ENAccess2EnelementList.list);

  if LastCount > -1 then
     sgENAccess2Enelement.RowCount:=LastCount+2
  else
     sgENAccess2Enelement.RowCount:=2;

   with sgENAccess2Enelement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENAccess2EnelementList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENAccess2EnelementList.list[i].code)
        else
        Cells[0,i+1] := '';

        Cells[1,i+1] := ENAccess2EnelementList.list[i].name;
        Cells[2,i+1] := ENAccess2EnelementList.list[i].buhName;
        Cells[3,i+1] := ENAccess2EnelementList.list[i].invNumber;
        Cells[4,i+1] := ENAccess2EnelementList.list[i].renName;


       { if ENAccess2EnelementList.list[i].isAccess = Low(Integer) then
          Cells[5,i+1] := ''
        else
          Cells[5,i+1] := IntToStr(ENAccess2EnelementList.list[i].isAccess);

        }
        if ENAccess2EnelementList.list[i].isAccess = Low(Integer) then
        Cells[5,i+1] := 'Заборонено для планування'
        else if ENAccess2EnelementList.list[i].isAccess <= 0 then
        Cells[5,i+1] := 'Заборонено для планування'
        else if ENAccess2EnelementList.list[i].isAccess > 0 then
        Cells[5,i+1] := 'Дозволено для планування';





        LastRow:=i+1;

        sgENAccess2Enelement.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENAccess2Enelement.Row:=1;
end;

procedure TfrmENAccess2EnelementShow.sgENAccess2EnelementTopLeftChanged(Sender: TObject);
var
  TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort;
  i,CurrentRow: Integer;
  ENAccess2EnelementList: ENAccess2EnelementShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENAccess2Enelement.TopRow + sgENAccess2Enelement.VisibleRowCount) = ColCount
  then
    begin
      TempENAccess2Enelement :=  HTTPRIOENAccess2Enelement as ENAccess2EnelementControllerSoapPort;
      CurrentRow:=sgENAccess2Enelement.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENAccess2EnelementFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENAccess2EnelementList := TempENAccess2Enelement.getScrollableFilteredList(ENAccess2EnelementFilter(FilterObject),ColCount-1, 100);



  sgENAccess2Enelement.RowCount:=sgENAccess2Enelement.RowCount+100;
  LastCount:=High(ENAccess2EnelementList.list);
  with sgENAccess2Enelement do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

          if ENAccess2EnelementList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENAccess2EnelementList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENAccess2EnelementList.list[i].name;
        Cells[2,i+CurrentRow] := ENAccess2EnelementList.list[i].buhName;
        Cells[3,i+CurrentRow] := ENAccess2EnelementList.list[i].invNumber;
        Cells[4,i+CurrentRow] := ENAccess2EnelementList.list[i].renName;


        if ENAccess2EnelementList.list[i].isAccess = Low(Integer) then
        Cells[5,i+CurrentRow] := 'Заборонено для планування'
        else if ENAccess2EnelementList.list[i].isAccess <= 0 then
        Cells[5,i+CurrentRow] := 'Заборонено для планування'
        else if ENAccess2EnelementList.list[i].isAccess > 0 then
        Cells[5,i+CurrentRow] := 'Дозволено для планування';


        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENAccess2Enelement.Row:=CurrentRow-5;
   sgENAccess2Enelement.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENAccess2EnelementShow.sgENAccess2EnelementDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENAccess2Enelement,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENAccess2EnelementShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENAccess2Enelement.RowCount-1 do
   for j:=0 to sgENAccess2Enelement.ColCount-1 do
     sgENAccess2Enelement.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENAccess2EnelementShow.actViewExecute(Sender: TObject);
Var TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort;
begin
 TempENAccess2Enelement := HTTPRIOENAccess2Enelement as ENAccess2EnelementControllerSoapPort;
   try
     ENAccess2EnelementObj := TempENAccess2Enelement.getObject(StrToInt(sgENAccess2Enelement.Cells[0,sgENAccess2Enelement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAccess2EnelementEdit:=TfrmENAccess2EnelementEdit.Create(Application, dsView);

  try
    frmENAccess2EnelementEdit.edtInvNumber.Text := sgENAccess2Enelement.Cells[3,sgENAccess2Enelement.row];
    frmENAccess2EnelementEdit.edtName.Text := sgENAccess2Enelement.Cells[1,sgENAccess2Enelement.row];
    frmENAccess2EnelementEdit.edtbuhName.Text := sgENAccess2Enelement.Cells[2,sgENAccess2Enelement.row];
    frmENAccess2EnelementEdit.edtEPRenName.Text  := sgENAccess2Enelement.Cells[4,sgENAccess2Enelement.row];

    frmENAccess2EnelementEdit.ShowModal;
  finally
    frmENAccess2EnelementEdit.Free;
    frmENAccess2EnelementEdit:=nil;
  end;
end;

procedure TfrmENAccess2EnelementShow.actEditExecute(Sender: TObject);
Var TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort;
begin
 TempENAccess2Enelement := HTTPRIOENAccess2Enelement as ENAccess2EnelementControllerSoapPort;
   try
     ENAccess2EnelementObj := TempENAccess2Enelement.getObject(StrToInt(sgENAccess2Enelement.Cells[0,sgENAccess2Enelement.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENAccess2EnelementEdit:=TfrmENAccess2EnelementEdit.Create(Application, dsEdit);
  try
    frmENAccess2EnelementEdit.edtInvNumber.Text := sgENAccess2Enelement.Cells[3,sgENAccess2Enelement.row];
    frmENAccess2EnelementEdit.edtName.Text := sgENAccess2Enelement.Cells[1,sgENAccess2Enelement.row];
    frmENAccess2EnelementEdit.edtbuhName.Text := sgENAccess2Enelement.Cells[2,sgENAccess2Enelement.row];
    frmENAccess2EnelementEdit.edtEPRenName.Text  := sgENAccess2Enelement.Cells[4,sgENAccess2Enelement.row];
    
    if frmENAccess2EnelementEdit.ShowModal= mrOk then
      begin
        //TempENAccess2Enelement.save(ENAccess2EnelementObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENAccess2EnelementEdit.Free;
    frmENAccess2EnelementEdit:=nil;
  end;
end;

procedure TfrmENAccess2EnelementShow.actDeleteExecute(Sender: TObject);
Var TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort;
  ObjCode: Integer;
begin
 TempENAccess2Enelement := HTTPRIOENAccess2Enelement as ENAccess2EnelementControllerSoapPort;
   try
     ObjCode := StrToInt(sgENAccess2Enelement.Cells[0,sgENAccess2Enelement.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Доступ для объектов EnergyNET) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENAccess2Enelement.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENAccess2EnelementShow.actInsertExecute(Sender: TObject);
// Var TempENAccess2Enelement: ENAccess2EnelementControllerSoapPort; 
begin
  // TempENAccess2Enelement := HTTPRIOENAccess2Enelement as ENAccess2EnelementControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENAccess2EnelementObj:=ENAccess2Enelement.Create;



  try
    frmENAccess2EnelementEdit:=TfrmENAccess2EnelementEdit.Create(Application, dsInsert);
    try
      if frmENAccess2EnelementEdit.ShowModal = mrOk then
      begin
        if ENAccess2EnelementObj<>nil then
            //TempENAccess2Enelement.add(ENAccess2EnelementObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENAccess2EnelementEdit.Free;
      frmENAccess2EnelementEdit:=nil;
    end;
  finally
    ENAccess2EnelementObj.Free;
  end;
end;

procedure TfrmENAccess2EnelementShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENAccess2EnelementShow.actFilterExecute(Sender: TObject);
begin
frmENAccess2EnelementFilterEdit:=TfrmENAccess2EnelementFilterEdit.Create(Application, dsInsert);
  try
    ENAccess2EnelementFilterObj := ENAccess2EnelementFilter.Create;
    SetNullIntProps(ENAccess2EnelementFilterObj);
    SetNullXSProps(ENAccess2EnelementFilterObj);

    if frmENAccess2EnelementFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENAccess2EnelementFilter.Create;
      FilterObject := ENAccess2EnelementFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENAccess2EnelementFilterEdit.Free;
    frmENAccess2EnelementFilterEdit:=nil;
  end;
end;

procedure TfrmENAccess2EnelementShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.
