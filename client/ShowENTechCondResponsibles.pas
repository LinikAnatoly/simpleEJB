
unit ShowENTechCondResponsibles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENTechCondResponsiblesController ;


type
  TfrmENTechCondResponsiblesShow = class(TChildForm)  
  HTTPRIOENTechCondResponsibles: THTTPRIO;
    ImageList1: TImageList;
    sgENTechCondResponsibles: TAdvStringGrid;
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
procedure sgENTechCondResponsiblesTopLeftChanged(Sender: TObject);
procedure sgENTechCondResponsiblesDblClick(Sender: TObject);
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
 // ENTechCondResponsiblesObj: ENTechCondResponsibles;
 // ENTechCondResponsiblesFilterObj: ENTechCondResponsiblesFilter;
  

implementation

uses Main, EditENTechCondResponsibles, EditENTechCondResponsiblesFilter;


{$R *.dfm}

var
  //frmENTechCondResponsiblesShow : TfrmENTechCondResponsiblesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENTechCondResponsiblesHeaders: array [1..4] of String =
        ( 'Код'
          ,'ПІБ'
          ,'Таб. №'
          ,'Посада'
          //,'Підрозділ відповідальної особи'
          //,'код підрозділу відповідальної особи'
          //,'Потужність (гранична)'
        );
   

procedure TfrmENTechCondResponsiblesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENTechCondResponsiblesShow:=nil;
    inherited;
  end;


procedure TfrmENTechCondResponsiblesShow.FormShow(Sender: TObject);
var
  TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
  i: Integer;
  ENTechCondResponsiblesList: ENTechCondResponsiblesShortList;
  begin
  SetGridHeaders(ENTechCondResponsiblesHeaders, sgENTechCondResponsibles.ColumnHeaders);
  ColCount:=100;
  TempENTechCondResponsibles :=  HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;

  if FilterObject = nil then
  begin
    FilterObject := ENTechCondResponsiblesFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
    ENTechCondResponsiblesFilter(FilterObject).orderBySQL := 'power desc, responsiblefio';
  end;

  ENTechCondResponsiblesList := TempENTechCondResponsibles.getScrollableFilteredList(ENTechCondResponsiblesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENTechCondResponsiblesList.list);

  if LastCount > -1 then
     sgENTechCondResponsibles.RowCount:=LastCount+2
  else
     sgENTechCondResponsibles.RowCount:=2;

   with sgENTechCondResponsibles do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTechCondResponsiblesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENTechCondResponsiblesList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := ENTechCondResponsiblesList.list[i].responsibleFIO;
        if ENTechCondResponsiblesList.list[i].responsibleTabNumber = Low(Integer) then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := IntToStr(ENTechCondResponsiblesList.list[i].responsibleTabNumber);
        Cells[3,i+1] := ENTechCondResponsiblesList.list[i].responsiblePosition;
        //Cells[4,i+1] := ENTechCondResponsiblesList.list[i].responsibleDepName;
        //Cells[5,i+1] := ENTechCondResponsiblesList.list[i].responsibleDepCode;
        {
        if ENTechCondResponsiblesList.list[i].power = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENTechCondResponsiblesList.list[i].power);
        }
        LastRow:=i+1;
        sgENTechCondResponsibles.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENTechCondResponsibles.Row:=1;
end;

procedure TfrmENTechCondResponsiblesShow.sgENTechCondResponsiblesTopLeftChanged(Sender: TObject);
var
  TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
  i,CurrentRow: Integer;
  ENTechCondResponsiblesList: ENTechCondResponsiblesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENTechCondResponsibles.TopRow + sgENTechCondResponsibles.VisibleRowCount) = ColCount
  then
    begin
      TempENTechCondResponsibles :=  HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;
      CurrentRow:=sgENTechCondResponsibles.RowCount;

  if FilterObject = nil then
  begin
    FilterObject := ENTechCondResponsiblesFilter.Create;
    SetNullIntProps(FilterObject);
    SetNullXSProps(FilterObject);
    ENTechCondResponsiblesFilter(FilterObject).orderBySQL := 'power desc, responsiblefio';
  end;

  ENTechCondResponsiblesList := TempENTechCondResponsibles.getScrollableFilteredList(ENTechCondResponsiblesFilter(FilterObject),ColCount-1, 100);



  sgENTechCondResponsibles.RowCount:=sgENTechCondResponsibles.RowCount+100;
  LastCount:=High(ENTechCondResponsiblesList.list);
  with sgENTechCondResponsibles do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENTechCondResponsiblesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENTechCondResponsiblesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENTechCondResponsiblesList.list[i].responsibleFIO;
        if ENTechCondResponsiblesList.list[i].responsibleTabNumber = Low(Integer) then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := IntToStr(ENTechCondResponsiblesList.list[i].responsibleTabNumber);
        Cells[3,i+CurrentRow] := ENTechCondResponsiblesList.list[i].responsiblePosition;
        //Cells[4,i+CurrentRow] := ENTechCondResponsiblesList.list[i].responsibleDepName;
        //Cells[5,i+CurrentRow] := ENTechCondResponsiblesList.list[i].responsibleDepCode;
        {
        if ENTechCondResponsiblesList.list[i].power = Low(Integer) then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := IntToStr(ENTechCondResponsiblesList.list[i].power);
        }
        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENTechCondResponsibles.Row:=CurrentRow-5;
   sgENTechCondResponsibles.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENTechCondResponsiblesShow.sgENTechCondResponsiblesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENTechCondResponsibles,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENTechCondResponsiblesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENTechCondResponsibles.RowCount-1 do
   for j:=0 to sgENTechCondResponsibles.ColCount-1 do
     sgENTechCondResponsibles.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENTechCondResponsiblesShow.actViewExecute(Sender: TObject);
Var TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
begin
 TempENTechCondResponsibles := HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;
   try
     ENTechCondResponsiblesObj := TempENTechCondResponsibles.getObject(StrToInt(sgENTechCondResponsibles.Cells[0,sgENTechCondResponsibles.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTechCondResponsiblesEdit:=TfrmENTechCondResponsiblesEdit.Create(Application, dsView);
  try
    frmENTechCondResponsiblesEdit.ShowModal;
  finally
    frmENTechCondResponsiblesEdit.Free;
    frmENTechCondResponsiblesEdit:=nil;
  end;
end;

procedure TfrmENTechCondResponsiblesShow.actEditExecute(Sender: TObject);
Var TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
begin
 TempENTechCondResponsibles := HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;
   try
     ENTechCondResponsiblesObj := TempENTechCondResponsibles.getObject(StrToInt(sgENTechCondResponsibles.Cells[0,sgENTechCondResponsibles.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENTechCondResponsiblesEdit:=TfrmENTechCondResponsiblesEdit.Create(Application, dsEdit);
  try
    if frmENTechCondResponsiblesEdit.ShowModal= mrOk then
      begin
        //TempENTechCondResponsibles.save(ENTechCondResponsiblesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENTechCondResponsiblesEdit.Free;
    frmENTechCondResponsiblesEdit:=nil;
  end;
end;

procedure TfrmENTechCondResponsiblesShow.actDeleteExecute(Sender: TObject);
Var TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENTechCondResponsibles := HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENTechCondResponsibles.Cells[0,sgENTechCondResponsibles.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Відповідальні особи (реалізація ТУ)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENTechCondResponsibles.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENTechCondResponsiblesShow.actInsertExecute(Sender: TObject);
// Var TempENTechCondResponsibles: ENTechCondResponsiblesControllerSoapPort; 
begin
  // TempENTechCondResponsibles := HTTPRIOENTechCondResponsibles as ENTechCondResponsiblesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENTechCondResponsiblesObj:=ENTechCondResponsibles.Create;



  try
    frmENTechCondResponsiblesEdit:=TfrmENTechCondResponsiblesEdit.Create(Application, dsInsert);
    try
      if frmENTechCondResponsiblesEdit.ShowModal = mrOk then
      begin
        if ENTechCondResponsiblesObj<>nil then
            //TempENTechCondResponsibles.add(ENTechCondResponsiblesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENTechCondResponsiblesEdit.Free;
      frmENTechCondResponsiblesEdit:=nil;
    end;
  finally
    ENTechCondResponsiblesObj.Free;
  end;
end;

procedure TfrmENTechCondResponsiblesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENTechCondResponsiblesShow.actFilterExecute(Sender: TObject);
begin
{frmENTechCondResponsiblesFilterEdit:=TfrmENTechCondResponsiblesFilterEdit.Create(Application, dsInsert);
  try
    ENTechCondResponsiblesFilterObj := ENTechCondResponsiblesFilter.Create;
    SetNullIntProps(ENTechCondResponsiblesFilterObj);
    SetNullXSProps(ENTechCondResponsiblesFilterObj);

    if frmENTechCondResponsiblesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENTechCondResponsiblesFilter.Create;
      FilterObject := ENTechCondResponsiblesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENTechCondResponsiblesFilterEdit.Free;
    frmENTechCondResponsiblesFilterEdit:=nil;
  end;}
end;

procedure TfrmENTechCondResponsiblesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.