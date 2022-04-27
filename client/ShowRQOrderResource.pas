
unit ShowRQOrderResource;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit, 
  EnergyProController, EnergyProController2,
  RQOrderResourceController, AdvObj ;


type
  TfrmRQOrderResourceShow = class(TChildForm)  
  HTTPRIORQOrderResource: THTTPRIO;
    ImageList1: TImageList;
    sgRQOrderResource: TAdvStringGrid;
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
procedure sgRQOrderResourceTopLeftChanged(Sender: TObject);
procedure sgRQOrderResourceDblClick(Sender: TObject);
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
 frmRQOrderResourceShow : TfrmRQOrderResourceShow;
 // RQOrderResourceObj: RQOrderResource;
 // RQOrderResourceFilterObj: RQOrderResourceFilter;
  
  
implementation

uses Main, EditRQOrderResource, EditRQOrderResourceFilter;


{$R *.dfm}

var
  //frmRQOrderResourceShow : TfrmRQOrderResourceShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  RQOrderResourceHeaders: array [1..2] of String =
        ( 'Код'
          ,'Вид наполнения (тмц/услуги)'
        );
   

procedure TfrmRQOrderResourceShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmRQOrderResourceShow:=nil;
    inherited;
  end;


procedure TfrmRQOrderResourceShow.FormShow(Sender: TObject);
var
  TempRQOrderResource: RQOrderResourceControllerSoapPort;
  i: Integer;
  RQOrderResourceList: RQOrderResourceShortList;
  begin
  SetGridHeaders(RQOrderResourceHeaders, sgRQOrderResource.ColumnHeaders);
  ColCount:=100;
  TempRQOrderResource :=  HTTPRIORQOrderResource as RQOrderResourceControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderResourceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderResourceList := TempRQOrderResource.getScrollableFilteredList(RQOrderResourceFilter(FilterObject),0,ColCount);


  LastCount:=High(RQOrderResourceList.list);

  if LastCount > -1 then
     sgRQOrderResource.RowCount:=LastCount+2
  else
     sgRQOrderResource.RowCount:=2;

   with sgRQOrderResource do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderResourceList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQOrderResourceList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQOrderResourceList.list[i].name;
        LastRow:=i+1;
        sgRQOrderResource.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQOrderResource.Row:=1;
end;

procedure TfrmRQOrderResourceShow.sgRQOrderResourceTopLeftChanged(Sender: TObject);
var
  TempRQOrderResource: RQOrderResourceControllerSoapPort;
  i,CurrentRow: Integer;
  RQOrderResourceList: RQOrderResourceShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQOrderResource.TopRow + sgRQOrderResource.VisibleRowCount) = ColCount
  then
    begin
      TempRQOrderResource :=  HTTPRIORQOrderResource as RQOrderResourceControllerSoapPort;
      CurrentRow:=sgRQOrderResource.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQOrderResourceFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  RQOrderResourceList := TempRQOrderResource.getScrollableFilteredList(RQOrderResourceFilter(FilterObject),ColCount-1, 100);



  sgRQOrderResource.RowCount:=sgRQOrderResource.RowCount+100;
  LastCount:=High(RQOrderResourceList.list);
  with sgRQOrderResource do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQOrderResourceList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQOrderResourceList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQOrderResourceList.list[i].name;
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQOrderResource.Row:=CurrentRow-5;
   sgRQOrderResource.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQOrderResourceShow.sgRQOrderResourceDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQOrderResource,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQOrderResourceShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQOrderResource.RowCount-1 do
   for j:=0 to sgRQOrderResource.ColCount-1 do
     sgRQOrderResource.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQOrderResourceShow.actViewExecute(Sender: TObject);
Var TempRQOrderResource: RQOrderResourceControllerSoapPort;
begin
 TempRQOrderResource := HTTPRIORQOrderResource as RQOrderResourceControllerSoapPort;
   try
     RQOrderResourceObj := TempRQOrderResource.getObject(StrToInt(sgRQOrderResource.Cells[0,sgRQOrderResource.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderResourceEdit:=TfrmRQOrderResourceEdit.Create(Application, dsView);
  try
    frmRQOrderResourceEdit.ShowModal;
  finally
    frmRQOrderResourceEdit.Free;
    frmRQOrderResourceEdit:=nil;
  end;
end;

procedure TfrmRQOrderResourceShow.actEditExecute(Sender: TObject);
Var TempRQOrderResource: RQOrderResourceControllerSoapPort;
begin
 TempRQOrderResource := HTTPRIORQOrderResource as RQOrderResourceControllerSoapPort;
   try
     RQOrderResourceObj := TempRQOrderResource.getObject(StrToInt(sgRQOrderResource.Cells[0,sgRQOrderResource.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQOrderResourceEdit:=TfrmRQOrderResourceEdit.Create(Application, dsEdit);
  try
    if frmRQOrderResourceEdit.ShowModal= mrOk then
      begin
        //TempRQOrderResource.save(RQOrderResourceObj);
        UpdateGrid(Sender);
      end;
  finally
    frmRQOrderResourceEdit.Free;
    frmRQOrderResourceEdit:=nil;
  end;
end;

procedure TfrmRQOrderResourceShow.actDeleteExecute(Sender: TObject);
Var TempRQOrderResource: RQOrderResourceControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQOrderResource := HTTPRIORQOrderResource as RQOrderResourceControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQOrderResource.Cells[0,sgRQOrderResource.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Ресурсы заявки (тмц/услуги)) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQOrderResource.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQOrderResourceShow.actInsertExecute(Sender: TObject);
Var TempRQOrderResource: RQOrderResourceControllerSoapPort;
begin
  TempRQOrderResource := HTTPRIORQOrderResource as RQOrderResourceControllerSoapPort;
  RQOrderResourceObj:=RQOrderResource.Create;



  try
    frmRQOrderResourceEdit:=TfrmRQOrderResourceEdit.Create(Application, dsInsert);
    try
      if frmRQOrderResourceEdit.ShowModal = mrOk then
      begin
        if RQOrderResourceObj<>nil then
            //TempRQOrderResource.add(RQOrderResourceObj);
            UpdateGrid(Sender);
      end;
    finally
      frmRQOrderResourceEdit.Free;
      frmRQOrderResourceEdit:=nil;
    end;
  finally
    RQOrderResourceObj.Free;
  end;
end;

procedure TfrmRQOrderResourceShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQOrderResourceShow.actFilterExecute(Sender: TObject);
begin
{frmRQOrderResourceFilterEdit:=TfrmRQOrderResourceFilterEdit.Create(Application, dsEdit);
  try
    RQOrderResourceFilterObj := RQOrderResourceFilter.Create;
    SetNullIntProps(RQOrderResourceFilterObj);
    SetNullXSProps(RQOrderResourceFilterObj);

    if frmRQOrderResourceFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := RQOrderResourceFilter.Create;
      FilterObject := RQOrderResourceFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQOrderResourceFilterEdit.Free;
    frmRQOrderResourceFilterEdit:=nil;
  end;}
end;

procedure TfrmRQOrderResourceShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

end.