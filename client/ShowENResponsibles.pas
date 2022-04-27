
unit ShowENResponsibles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENResponsiblesController, AdvObj ;


type
  TfrmENResponsiblesShow = class(TChildForm)  
  HTTPRIOENResponsibles: THTTPRIO;
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
    sgENResponsibles: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENResponsiblesTopLeftChanged(Sender: TObject);
procedure sgENResponsiblesDblClick(Sender: TObject);
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
 frmENResponsiblesShow : TfrmENResponsiblesShow;
 // ENResponsiblesObj: ENResponsibles;
 // ENResponsiblesFilterObj: ENResponsiblesFilter;
  
  
implementation

uses Main, EditENResponsibles, EditENResponsiblesFilter,
  ENResponsiblesKindController, ENConsts;


{$R *.dfm}

var
  //frmENResponsiblesShow : TfrmENResponsiblesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENResponsiblesHeaders: array [1..4] of String =
        ( 'Код'
          ,'ПІБ'
          ,'Таб. №'
          ,'Посада'
        );
   

procedure TfrmENResponsiblesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENResponsiblesShow:=nil;
    inherited;
  end;


procedure TfrmENResponsiblesShow.FormShow(Sender: TObject);
var
  TempENResponsibles: ENResponsiblesControllerSoapPort;
  i: Integer;
  ENResponsiblesList: ENResponsiblesShortList;
  begin
  SetGridHeaders(ENResponsiblesHeaders, sgENResponsibles.ColumnHeaders);
  ColCount:=100;
  TempENResponsibles :=  HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENResponsiblesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);

     ENResponsiblesFilter(FilterObject).orderBySQL := 'FIO';
  end;

  ENResponsiblesList := TempENResponsibles.getScrollableFilteredList(ENResponsiblesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENResponsiblesList.list);

  if LastCount > -1 then
     sgENResponsibles.RowCount:=LastCount+2
  else
     sgENResponsibles.RowCount:=2;

   with sgENResponsibles do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENResponsiblesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENResponsiblesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENResponsiblesList.list[i].FIO;
        if ENResponsiblesList.list[i].tabNumber = '' then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENResponsiblesList.list[i].tabNumber;

        Cells[3,i+1] := ENResponsiblesList.list[i].position;
        {
        Cells[4,i+1] := ENResponsiblesList.list[i].depName;
        Cells[5,i+1] := ENResponsiblesList.list[i].depCode;
        Cells[6,i+1] := ENResponsiblesList.list[i].phone;
        }
        LastRow:=i+1;
        sgENResponsibles.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENResponsibles.Row:=1;
end;

procedure TfrmENResponsiblesShow.sgENResponsiblesTopLeftChanged(Sender: TObject);
var
  TempENResponsibles: ENResponsiblesControllerSoapPort;
  i,CurrentRow: Integer;
  ENResponsiblesList: ENResponsiblesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENResponsibles.TopRow + sgENResponsibles.VisibleRowCount) = ColCount
  then
    begin
      TempENResponsibles :=  HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
      CurrentRow:=sgENResponsibles.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENResponsiblesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);

     ENResponsiblesFilter(FilterObject).orderBySQL := 'FIO';
  end;

  ENResponsiblesList := TempENResponsibles.getScrollableFilteredList(ENResponsiblesFilter(FilterObject),ColCount-1, 100);



  sgENResponsibles.RowCount:=sgENResponsibles.RowCount+100;
  LastCount:=High(ENResponsiblesList.list);
  with sgENResponsibles do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENResponsiblesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENResponsiblesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENResponsiblesList.list[i].FIO;
        if ENResponsiblesList.list[i].tabNumber = '' then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENResponsiblesList.list[i].tabNumber;

        Cells[3,i+CurrentRow] := ENResponsiblesList.list[i].position;
        {
        Cells[4,i+CurrentRow] := ENResponsiblesList.list[i].depName;
        Cells[5,i+CurrentRow] := ENResponsiblesList.list[i].depCode;
        Cells[6,i+CurrentRow] := ENResponsiblesList.list[i].phone;
        }
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENResponsibles.Row:=CurrentRow-5;
   sgENResponsibles.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENResponsiblesShow.sgENResponsiblesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENResponsibles,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENResponsiblesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENResponsibles.RowCount-1 do
   for j:=0 to sgENResponsibles.ColCount-1 do
     sgENResponsibles.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENResponsiblesShow.actViewExecute(Sender: TObject);
Var TempENResponsibles: ENResponsiblesControllerSoapPort;
begin
 TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
   try
     ENResponsiblesObj := TempENResponsibles.getObject(StrToInt(sgENResponsibles.Cells[0,sgENResponsibles.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENResponsiblesEdit:=TfrmENResponsiblesEdit.Create(Application, dsView);
  try
    frmENResponsiblesEdit.ShowModal;
  finally
    frmENResponsiblesEdit.Free;
    frmENResponsiblesEdit:=nil;
  end;
end;

procedure TfrmENResponsiblesShow.actEditExecute(Sender: TObject);
Var TempENResponsibles: ENResponsiblesControllerSoapPort;
begin
 TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
   try
     ENResponsiblesObj := TempENResponsibles.getObject(StrToInt(sgENResponsibles.Cells[0,sgENResponsibles.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENResponsiblesEdit:=TfrmENResponsiblesEdit.Create(Application, dsEdit);
  try
    if frmENResponsiblesEdit.ShowModal= mrOk then
      begin
        //TempENResponsibles.save(ENResponsiblesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENResponsiblesEdit.Free;
    frmENResponsiblesEdit:=nil;
  end;
end;

procedure TfrmENResponsiblesShow.actDeleteExecute(Sender: TObject);
Var TempENResponsibles: ENResponsiblesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENResponsibles.Cells[0,sgENResponsibles.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відповідальні особи (ВМТП,...)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENResponsibles.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENResponsiblesShow.actInsertExecute(Sender: TObject);
// Var TempENResponsibles: ENResponsiblesControllerSoapPort; 
begin
  // TempENResponsibles := HTTPRIOENResponsibles as ENResponsiblesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENResponsiblesObj:=ENResponsibles.Create;
  try
    ENResponsiblesObj.kindRef := ENResponsiblesKindRef.Create;
    ENResponsiblesObj.kindRef.code := ENRESPONSIBLESKIND_OMTS;

    frmENResponsiblesEdit:=TfrmENResponsiblesEdit.Create(Application, dsInsert);
    try
      if frmENResponsiblesEdit.ShowModal = mrOk then
      begin
        if ENResponsiblesObj<>nil then
            //TempENResponsibles.add(ENResponsiblesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENResponsiblesEdit.Free;
      frmENResponsiblesEdit:=nil;
    end;
  finally
    ENResponsiblesObj.Free;
  end;
end;

procedure TfrmENResponsiblesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENResponsiblesShow.actFilterExecute(Sender: TObject);
begin
{frmENResponsiblesFilterEdit:=TfrmENResponsiblesFilterEdit.Create(Application, dsInsert);
  try
    ENResponsiblesFilterObj := ENResponsiblesFilter.Create;
    SetNullIntProps(ENResponsiblesFilterObj);
    SetNullXSProps(ENResponsiblesFilterObj);

    if frmENResponsiblesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENResponsiblesFilter.Create;
      FilterObject := ENResponsiblesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENResponsiblesFilterEdit.Free;
    frmENResponsiblesFilterEdit:=nil;
  end;}
end;

procedure TfrmENResponsiblesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.