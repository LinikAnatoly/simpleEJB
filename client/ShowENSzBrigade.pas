
unit ShowENSzBrigade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, ENSzBrigadeController, AdvObj;


type
  TfrmENSzBrigadeShow = class(TChildForm)  
  HTTPRIOENSzBrigade: THTTPRIO;
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
    sgENSzBrigade: TAdvStringGrid;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENSzBrigadeTopLeftChanged(Sender: TObject);
procedure sgENSzBrigadeDblClick(Sender: TObject);
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
 // ENSzBrigadeObj: ENSzBrigade;
 // ENSzBrigadeFilterObj: ENSzBrigadeFilter;
  
  
implementation

uses Main, EditENSzBrigade, EditENSzBrigadeFilter, ENConsts;


{$R *.dfm}

var
  //frmENSzBrigadeShow : TfrmENSzBrigadeShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENSzBrigadeHeaders: array [1..6] of String =
        ( 'Код'
          ,'Назва'
          ,'Служба'
          ,'РЕМ'
          ,'код групи ЗІЗ'
          ,'Стан бригади'
          //,'код подразделения в кадрах'
          //,'код РЭСа в кадрах'
        );
   

procedure TfrmENSzBrigadeShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENSzBrigadeShow:=nil;
  inherited;
end;


procedure TfrmENSzBrigadeShow.FormShow(Sender: TObject);
var
  TempENSzBrigade: ENSzBrigadeControllerSoapPort;
  i: Integer;
  ENSzBrigadeList: ENSzBrigadeShortList;
begin
  SetGridHeaders(ENSzBrigadeHeaders, sgENSzBrigade.ColumnHeaders);
  ColCount:=100;
  TempENSzBrigade :=  HTTPRIOENSzBrigade as ENSzBrigadeControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENSzBrigadeFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENSzBrigadeList := TempENSzBrigade.getScrollableFilteredList(ENSzBrigadeFilter(FilterObject),0,ColCount);
  LastCount:=High(ENSzBrigadeList.list);

  if LastCount > -1 then
     sgENSzBrigade.RowCount:=LastCount+2
  else
     sgENSzBrigade.RowCount:=2;

   with sgENSzBrigade do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENSzBrigadeList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENSzBrigadeList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENSzBrigadeList.list[i].nazv;
        Cells[2,i+1] := ENSzBrigadeList.list[i].main_podr_nazv;
        Cells[3,i+1] := ENSzBrigadeList.list[i].ceh_nazv;

        if ENSzBrigadeList.list[i].sizCode = Low(Integer) then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := IntToStr(ENSzBrigadeList.list[i].sizCode);

        if ENSzBrigadeList.list[i].statusCode = ENSZBRIGADE_WORKING then
          Cells[5,i+1] := 'Існуюча'
        else
          Cells[5,i+1] := 'Закрита';

        LastRow:=i+1;
        sgENSzBrigade.RowCount:=LastRow+1;
      end;

   ColCount:=ColCount+1;
   sgENSzBrigade.Row:=1;
end;


procedure TfrmENSzBrigadeShow.sgENSzBrigadeTopLeftChanged(Sender: TObject);
var
  TempENSzBrigade: ENSzBrigadeControllerSoapPort;
  i,CurrentRow: Integer;
  ENSzBrigadeList: ENSzBrigadeShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENSzBrigade.TopRow + sgENSzBrigade.VisibleRowCount) = ColCount
  then
  begin
    TempENSzBrigade :=  HTTPRIOENSzBrigade as ENSzBrigadeControllerSoapPort;
    CurrentRow:=sgENSzBrigade.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := ENSzBrigadeFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

    ENSzBrigadeList := TempENSzBrigade.getScrollableFilteredList(ENSzBrigadeFilter(FilterObject),ColCount-1, 100);

    sgENSzBrigade.RowCount:=sgENSzBrigade.RowCount+100;
    LastCount:=High(ENSzBrigadeList.list);
    with sgENSzBrigade do
      for i:=0 to LastCount do
        begin
          Application.ProcessMessages;
          if ENSzBrigadeList.list[i].code <> Low(Integer) then
            Cells[0,i+CurrentRow] := IntToStr(ENSzBrigadeList.list[i].code)
          else
            Cells[0,i+CurrentRow] := '';

          Cells[1,i+CurrentRow] := ENSzBrigadeList.list[i].nazv;
          Cells[2,i+CurrentRow] := ENSzBrigadeList.list[i].main_podr_nazv;
          Cells[3,i+CurrentRow] := ENSzBrigadeList.list[i].ceh_nazv;

          if ENSzBrigadeList.list[i].sizCode = Low(Integer) then
            Cells[4,i+CurrentRow] := ''
          else
            Cells[4,i+CurrentRow] := IntToStr(ENSzBrigadeList.list[i].sizCode);

          if ENSzBrigadeList.list[i].statusCode = ENSZBRIGADE_WORKING then
            Cells[5,i+CurrentRow] := 'Існуюча'
          else
            Cells[5,i+CurrentRow] := 'Закрита';

          LastRow:=i+CurrentRow;
        end;

    ColCount:=ColCount+100;
    sgENSzBrigade.Row:=CurrentRow-5;
    sgENSzBrigade.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENSzBrigadeShow.sgENSzBrigadeDblClick(Sender: TObject);
var
  temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENSzBrigade,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENSzBrigadeShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENSzBrigade.RowCount-1 do
   for j:=0 to sgENSzBrigade.ColCount-1 do
     sgENSzBrigade.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENSzBrigadeShow.actViewExecute(Sender: TObject);
Var TempENSzBrigade: ENSzBrigadeControllerSoapPort;
begin
 TempENSzBrigade := HTTPRIOENSzBrigade as ENSzBrigadeControllerSoapPort;
   try
     ENSzBrigadeObj := TempENSzBrigade.getObject(StrToInt(sgENSzBrigade.Cells[0,sgENSzBrigade.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSzBrigadeEdit:=TfrmENSzBrigadeEdit.Create(Application, dsView);
  try
    frmENSzBrigadeEdit.ShowModal;
  finally
    frmENSzBrigadeEdit.Free;
    frmENSzBrigadeEdit:=nil;
  end;
end;

procedure TfrmENSzBrigadeShow.actEditExecute(Sender: TObject);
Var TempENSzBrigade: ENSzBrigadeControllerSoapPort;
begin
 TempENSzBrigade := HTTPRIOENSzBrigade as ENSzBrigadeControllerSoapPort;
   try
     ENSzBrigadeObj := TempENSzBrigade.getObject(StrToInt(sgENSzBrigade.Cells[0,sgENSzBrigade.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENSzBrigadeEdit:=TfrmENSzBrigadeEdit.Create(Application, dsEdit);
  try
    if frmENSzBrigadeEdit.ShowModal= mrOk then
      begin
        //TempENSzBrigade.save(ENSzBrigadeObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENSzBrigadeEdit.Free;
    frmENSzBrigadeEdit:=nil;
  end;
end;

procedure TfrmENSzBrigadeShow.actDeleteExecute(Sender: TObject);
Var TempENSzBrigade: ENSzBrigadeControllerSoapPort;
  ObjCode: Integer;
begin
 TempENSzBrigade := HTTPRIOENSzBrigade as ENSzBrigadeControllerSoapPort;
   try
     ObjCode := StrToInt(sgENSzBrigade.Cells[0,sgENSzBrigade.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Об’єкти для замовлення бригадних ЗЗ) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENSzBrigade.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENSzBrigadeShow.actInsertExecute(Sender: TObject);
Var TempENSzBrigade: ENSzBrigadeControllerSoapPort;
begin
  TempENSzBrigade := HTTPRIOENSzBrigade as ENSzBrigadeControllerSoapPort;
  ENSzBrigadeObj:=ENSzBrigade.Create;



  try
    frmENSzBrigadeEdit:=TfrmENSzBrigadeEdit.Create(Application, dsInsert);
    try
      if frmENSzBrigadeEdit.ShowModal = mrOk then
      begin
        if ENSzBrigadeObj<>nil then
            //TempENSzBrigade.add(ENSzBrigadeObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENSzBrigadeEdit.Free;
      frmENSzBrigadeEdit:=nil;
    end;
  finally
    ENSzBrigadeObj.Free;
  end;
end;

procedure TfrmENSzBrigadeShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENSzBrigadeShow.actFilterExecute(Sender: TObject);
begin
frmENSzBrigadeFilterEdit:=TfrmENSzBrigadeFilterEdit.Create(Application, dsInsert);
  try
    ENSzBrigadeFilterObj := ENSzBrigadeFilter.Create;
    SetNullIntProps(ENSzBrigadeFilterObj);
    SetNullXSProps(ENSzBrigadeFilterObj);

    if frmENSzBrigadeFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENSzBrigadeFilter.Create;
      FilterObject := ENSzBrigadeFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENSzBrigadeFilterEdit.Free;
    frmENSzBrigadeFilterEdit:=nil;
  end;
end;

procedure TfrmENSzBrigadeShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.