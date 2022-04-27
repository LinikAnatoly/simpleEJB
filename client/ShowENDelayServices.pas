
unit ShowENDelayServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  ENDelayServicesController, AdvObj ;


type
  TfrmENDelayServicesShow = class(TChildForm)  
  HTTPRIOENDelayServices: THTTPRIO;
    ImageList1: TImageList;
    sgENDelayServices: TAdvStringGrid;
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
procedure sgENDelayServicesTopLeftChanged(Sender: TObject);
procedure sgENDelayServicesDblClick(Sender: TObject);
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
 // ENDelayServicesObj: ENDelayServices;
 // ENDelayServicesFilterObj: ENDelayServicesFilter;
  
  
implementation

uses Main, EditENDelayServices, EditENDelayServicesFilter;


{$R *.dfm}

var
  //frmENDelayServicesShow : TfrmENDelayServicesShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENDelayServicesHeaders: array [1..5] of String =
        ( 'Код'
          ,'Дата начала задержки'
          ,'Дата окончания задержки'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );


procedure TfrmENDelayServicesShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENDelayServicesShow:=nil;
    inherited;
  end;


procedure TfrmENDelayServicesShow.FormShow(Sender: TObject);
var
  TempENDelayServices: ENDelayServicesControllerSoapPort;
  i: Integer;
  ENDelayServicesList: ENDelayServicesShortList;
  begin
  SetGridHeaders(ENDelayServicesHeaders, sgENDelayServices.ColumnHeaders);
  ColCount:=100;
  TempENDelayServices :=  HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENDelayServicesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDelayServicesList := TempENDelayServices.getScrollableFilteredList(ENDelayServicesFilter(FilterObject),0,ColCount);


  LastCount:=High(ENDelayServicesList.list);

  if LastCount > -1 then
     sgENDelayServices.RowCount:=LastCount+2
  else
     sgENDelayServices.RowCount:=2;

   with sgENDelayServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDelayServicesList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(ENDelayServicesList.list[i].code)
        else
        Cells[0,i+1] := '';
        if ENDelayServicesList.list[i].dateStart = nil then
          Cells[1,i+1] := ''
        else
          Cells[1,i+1] := XSDate2String(ENDelayServicesList.list[i].dateStart);
        if ENDelayServicesList.list[i].dateFinal = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENDelayServicesList.list[i].dateFinal);
        Cells[3,i+1] := ENDelayServicesList.list[i].userGen;
        if ENDelayServicesList.list[i].dateEdit = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := XSDateTimeWithDate2String(ENDelayServicesList.list[i].dateEdit);
        LastRow:=i+1;
        sgENDelayServices.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgENDelayServices.Row:=1;
end;

procedure TfrmENDelayServicesShow.sgENDelayServicesTopLeftChanged(Sender: TObject);
var
  TempENDelayServices: ENDelayServicesControllerSoapPort;
  i,CurrentRow: Integer;
  ENDelayServicesList: ENDelayServicesShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENDelayServices.TopRow + sgENDelayServices.VisibleRowCount) = ColCount
  then
    begin
      TempENDelayServices :=  HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;
      CurrentRow:=sgENDelayServices.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENDelayServicesFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENDelayServicesList := TempENDelayServices.getScrollableFilteredList(ENDelayServicesFilter(FilterObject),ColCount-1, 100);



  sgENDelayServices.RowCount:=sgENDelayServices.RowCount+100;
  LastCount:=High(ENDelayServicesList.list);
  with sgENDelayServices do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENDelayServicesList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(ENDelayServicesList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        if ENDelayServicesList.list[i].dateStart = nil then
          Cells[1,i+CurrentRow] := ''
        else
          Cells[1,i+CurrentRow] := XSDate2String(ENDelayServicesList.list[i].dateStart);
        if ENDelayServicesList.list[i].dateFinal = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENDelayServicesList.list[i].dateFinal);
        Cells[3,i+CurrentRow] := ENDelayServicesList.list[i].userGen;
        if ENDelayServicesList.list[i].dateEdit = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := XSDateTimeWithDate2String(ENDelayServicesList.list[i].dateEdit);		  
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENDelayServices.Row:=CurrentRow-5;
   sgENDelayServices.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENDelayServicesShow.sgENDelayServicesDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgENDelayServices,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENDelayServicesShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENDelayServices.RowCount-1 do
   for j:=0 to sgENDelayServices.ColCount-1 do
     sgENDelayServices.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENDelayServicesShow.actViewExecute(Sender: TObject);
Var TempENDelayServices: ENDelayServicesControllerSoapPort;
begin
 TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;
   try
     ENDelayServicesObj := TempENDelayServices.getObject(StrToInt(sgENDelayServices.Cells[0,sgENDelayServices.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDelayServicesEdit:=TfrmENDelayServicesEdit.Create(Application, dsView);
  try
    frmENDelayServicesEdit.ShowModal;
  finally
    frmENDelayServicesEdit.Free;
    frmENDelayServicesEdit:=nil;
  end;
end;

procedure TfrmENDelayServicesShow.actEditExecute(Sender: TObject);
Var TempENDelayServices: ENDelayServicesControllerSoapPort;
begin
 TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;
   try
     ENDelayServicesObj := TempENDelayServices.getObject(StrToInt(sgENDelayServices.Cells[0,sgENDelayServices.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENDelayServicesEdit:=TfrmENDelayServicesEdit.Create(Application, dsEdit);
  try
    if frmENDelayServicesEdit.ShowModal= mrOk then
      begin
        //TempENDelayServices.save(ENDelayServicesObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENDelayServicesEdit.Free;
    frmENDelayServicesEdit:=nil;
  end;
end;

procedure TfrmENDelayServicesShow.actDeleteExecute(Sender: TObject);
Var TempENDelayServices: ENDelayServicesControllerSoapPort;
  ObjCode: Integer;
begin
 TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;
   try
     ObjCode := StrToInt(sgENDelayServices.Cells[0,sgENDelayServices.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Задержка предоставления услуг) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENDelayServices.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENDelayServicesShow.actInsertExecute(Sender: TObject);
// Var TempENDelayServices: ENDelayServicesControllerSoapPort; 
begin
  // TempENDelayServices := HTTPRIOENDelayServices as ENDelayServicesControllerSoapPort;  /// Это здесь уже лишнее!!!
  ENDelayServicesObj:=ENDelayServices.Create;

   //ENDelayServicesObj.dateStart:= TXSDate.Create;
   //ENDelayServicesObj.dateFinal:= TXSDate.Create;
   //ENDelayServicesObj.dateEdit:= TXSDateTime.Create;
   


  try
    frmENDelayServicesEdit:=TfrmENDelayServicesEdit.Create(Application, dsInsert);
    try
      if frmENDelayServicesEdit.ShowModal = mrOk then
      begin
        if ENDelayServicesObj<>nil then
            //TempENDelayServices.add(ENDelayServicesObj);
            UpdateGrid(Sender);
      end;
    finally
      frmENDelayServicesEdit.Free;
      frmENDelayServicesEdit:=nil;
    end;
  finally
    ENDelayServicesObj.Free;
  end;
end;

procedure TfrmENDelayServicesShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENDelayServicesShow.actFilterExecute(Sender: TObject);
begin
{frmENDelayServicesFilterEdit:=TfrmENDelayServicesFilterEdit.Create(Application, dsInsert);
  try
    ENDelayServicesFilterObj := ENDelayServicesFilter.Create;
    SetNullIntProps(ENDelayServicesFilterObj);
    SetNullXSProps(ENDelayServicesFilterObj);

    if frmENDelayServicesFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENDelayServicesFilter.Create;
      FilterObject := ENDelayServicesFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENDelayServicesFilterEdit.Free;
    frmENDelayServicesFilterEdit:=nil;
  end;}
end;

procedure TfrmENDelayServicesShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.