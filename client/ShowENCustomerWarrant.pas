
unit ShowENCustomerWarrant;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  ENCustomerWarrantController, AdvObj, Globals;


type
    TfrmENCustomerWarrantShow = class(TChildForm)  
    HTTPRIOENCustomerWarrant: THTTPRIO;
    ImageList1: TImageList;
    sgENCustomerWarrant: TAdvStringGrid;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgENCustomerWarrantTopLeftChanged(Sender: TObject);
    procedure sgENCustomerWarrantDblClick(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
   selectedRow: Integer;
 public
   { Public declarations }
   servicesObjectCode: Integer;
   servicesConsumerCode: Integer;
   customerWarrantCode: Integer;
   procedure UpdateGrid(Sender: TObject);
   class function chooseFromList : ENCustomerWarrantShort; overload; stdcall; static;
 end;


var
  frmENCustomerWarrantShow: TfrmENCustomerWarrantShow;
  
  
implementation

uses Main, EditENCustomerWarrant
  , ENServicesObjectController
;


{$R *.dfm}

var  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
  ENCustomerWarrantHeaders: array [1..7] of String =
        ( 'Код'
          ,'Номер довіреності'
          ,'Дата довіреності'
          ,'П.І.Б. довіреної особи'
          ,'Посада довіреної особи'
          ,'З правом підпису'
          ,'Користувач, який вніс зміни'
        );


class function TfrmENCustomerWarrantShow.chooseFromList : ENCustomerWarrantShort;
var
  f1 : ENCustomerWarrantFilter;
  frmENCustomerWarrantShow : TfrmENCustomerWarrantShow;
  selected : ENCustomerWarrantShort;
begin
  inherited;
     selected := nil;
     f1 := ENCustomerWarrantFilter.Create;
     SetNullXSProps(f1);
     SetNullIntProps(f1);
     frmENCustomerWarrantShow := TfrmENCustomerWarrantShow.Create(Application, fmNormal, f1);
       try
          with frmENCustomerWarrantShow do
          begin
            DisableActions([ actEdit, actInsert, actDelete ]);
            if ShowModal = mrOk then
            begin
                try
                  selected := ENCustomerWarrantShort(sgENCustomerWarrant.Objects[0, sgENCustomerWarrant.Row]);
                except
                   on EConvertError do begin Result := nil; Exit; end;
                end;
            end;
          end;
          Result := selected;
       finally
          frmENCustomerWarrantShow.Free;
       end;
end;


procedure TfrmENCustomerWarrantShow.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FormMode = fmChild then
    frmENCustomerWarrantShow:=nil;
  inherited;
end;


procedure TfrmENCustomerWarrantShow.FormCreate(Sender: TObject);
begin
  inherited;
  selectedRow := 1;
  servicesObjectCode := Low(Integer);
  servicesConsumerCode := Low(Integer);
  customerWarrantCode := Low(Integer);
end;


procedure TfrmENCustomerWarrantShow.FormShow(Sender: TObject);
var
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
  i: Integer;
  ENCustomerWarrantList: ENCustomerWarrantShortList;
begin
  SetGridHeaders(ENCustomerWarrantHeaders, sgENCustomerWarrant.ColumnHeaders);
  ColCount:=100;
  TempENCustomerWarrant :=  HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENCustomerWarrantFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENCustomerWarrantList := TempENCustomerWarrant.getScrollableFilteredList(ENCustomerWarrantFilter(FilterObject),0,ColCount);
  LastCount:=High(ENCustomerWarrantList.list);

  if LastCount > -1 then
     sgENCustomerWarrant.RowCount:=LastCount+2
  else
     sgENCustomerWarrant.RowCount:=2;

   with sgENCustomerWarrant do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENCustomerWarrantList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENCustomerWarrantList.list[i].code)
        else
          Cells[0,i+1] := '';

        Cells[1,i+1] := ENCustomerWarrantList.list[i].warrantRefNumbergen;

        if ENCustomerWarrantList.list[i].warrantRefDateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(ENCustomerWarrantList.list[i].warrantRefDateGen);

        Cells[3,i+1] := ENCustomerWarrantList.list[i].warrantRefWarrantFIO;
        Cells[4,i+1] := ENCustomerWarrantList.list[i].warrantRefWarrantPosition;

        if ENCustomerWarrantList.list[i].typeCode = YES then
          Cells[5,i+1] := 'так'
        else
          Cells[5,i+1] := 'ні';

        Cells[6,i+1] := ENCustomerWarrantList.list[i].userGen;


        LastRow:=i+1;
        sgENCustomerWarrant.RowCount:=LastRow+1;
      end;
    
    ColCount:=ColCount+1;
    sgENCustomerWarrant.Row:=1;
   
    if selectedRow <> 0 then
    begin
    if sgENCustomerWarrant.RowCount > selectedRow then
      sgENCustomerWarrant.Row := selectedRow
    else
      sgENCustomerWarrant.Row := sgENCustomerWarrant.RowCount - 1;
    end
    else
      sgENCustomerWarrant.Row:=1;   
end;


procedure TfrmENCustomerWarrantShow.sgENCustomerWarrantTopLeftChanged(Sender: TObject);
var
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
  i,CurrentRow: Integer;
  ENCustomerWarrantList: ENCustomerWarrantShortList;
begin
  if LastCount < 99 then Exit;
  if (sgENCustomerWarrant.TopRow + sgENCustomerWarrant.VisibleRowCount) = ColCount
  then
  begin
    TempENCustomerWarrant :=  HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;
    CurrentRow:=sgENCustomerWarrant.RowCount;

    if FilterObject = nil then
    begin
       FilterObject := ENCustomerWarrantFilter.Create;
       SetNullIntProps(FilterObject);
       SetNullXSProps(FilterObject);
    end;

    ENCustomerWarrantList := TempENCustomerWarrant.getScrollableFilteredList(ENCustomerWarrantFilter(FilterObject),ColCount-1, 100);


    sgENCustomerWarrant.RowCount:=sgENCustomerWarrant.RowCount+100;
    LastCount:=High(ENCustomerWarrantList.list);
    with sgENCustomerWarrant do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;

        if ENCustomerWarrantList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENCustomerWarrantList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';

        Cells[1,i+CurrentRow] := ENCustomerWarrantList.list[i].warrantRefNumbergen;

        if ENCustomerWarrantList.list[i].warrantRefDateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(ENCustomerWarrantList.list[i].warrantRefDateGen);

        Cells[3,i+CurrentRow] := ENCustomerWarrantList.list[i].warrantRefWarrantFIO;
        Cells[4,i+CurrentRow] := ENCustomerWarrantList.list[i].warrantRefWarrantPosition;

        if ENCustomerWarrantList.list[i].typeCode = YES then
          Cells[5,i+CurrentRow] := 'так'
        else
          Cells[5,i+CurrentRow] := 'ні';

        Cells[6,i+CurrentRow] := ENCustomerWarrantList.list[i].userGen;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENCustomerWarrant.Row:=CurrentRow-5;
   sgENCustomerWarrant.RowCount:=LastRow+1;
  end;
end;


procedure TfrmENCustomerWarrantShow.sgENCustomerWarrantDblClick(Sender: TObject);
var
  temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp := StrToInt(GetReturnValue(sgENCustomerWarrant,0));
      customerWarrantCode := StrToInt(GetReturnValue(sgENCustomerWarrant,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;


procedure TfrmENCustomerWarrantShow.UpdateGrid(Sender: TObject);
var 
  i, j: Integer;
begin
 for i:=1 to sgENCustomerWarrant.RowCount-1 do
   for j:=0 to sgENCustomerWarrant.ColCount-1 do
     sgENCustomerWarrant.Cells[j,i]:='';
   FormShow(Sender);
end;


procedure TfrmENCustomerWarrantShow.actViewExecute(Sender: TObject);
var 
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
begin
  TempENCustomerWarrant := HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;
  try
    ENCustomerWarrantObj := TempENCustomerWarrant.getObject(StrToInt(sgENCustomerWarrant.Cells[0,sgENCustomerWarrant.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCustomerWarrant.Row;
  frmENCustomerWarrantEdit:=TfrmENCustomerWarrantEdit.Create(Application, dsView);
  
  try
    frmENCustomerWarrantEdit.ShowModal;
  finally
    frmENCustomerWarrantEdit.Free;
    frmENCustomerWarrantEdit:=nil;
  end;

  if sgENCustomerWarrant.RowCount > selectedRow then
    sgENCustomerWarrant.Row := selectedRow
  else
    sgENCustomerWarrant.Row := sgENCustomerWarrant.RowCount - 1;
  
end;


procedure TfrmENCustomerWarrantShow.actEditExecute(Sender: TObject);
var 
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
begin
  TempENCustomerWarrant := HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;
  try
    ENCustomerWarrantObj := TempENCustomerWarrant.getObject(StrToInt(sgENCustomerWarrant.Cells[0,sgENCustomerWarrant.Row]));
  except
    on EConvertError do Exit;
  end;
  
  selectedRow := sgENCustomerWarrant.Row;
  frmENCustomerWarrantEdit:=TfrmENCustomerWarrantEdit.Create(Application, dsEdit);
  
  try
    if frmENCustomerWarrantEdit.ShowModal= mrOk then
      begin
        //TempENCustomerWarrant.save(ENCustomerWarrantObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENCustomerWarrantEdit.Free;
    frmENCustomerWarrantEdit:=nil;
  end;

  if sgENCustomerWarrant.RowCount > selectedRow then
    sgENCustomerWarrant.Row := selectedRow
  else
    sgENCustomerWarrant.Row := sgENCustomerWarrant.RowCount - 1;
  
end;


procedure TfrmENCustomerWarrantShow.actDeleteExecute(Sender: TObject);
var
  TempENCustomerWarrant: ENCustomerWarrantControllerSoapPort;
  ObjCode: Integer;
begin
  TempENCustomerWarrant := HTTPRIOENCustomerWarrant as ENCustomerWarrantControllerSoapPort;
  try
    ObjCode := StrToInt(sgENCustomerWarrant.Cells[0,sgENCustomerWarrant.Row]);
  except
    on EConvertError do Exit;
  end;

  if Application.MessageBox(PChar('Ви дійсно бажаєте видалити (Довіреність замовника)?'),
                    PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENCustomerWarrant.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;


procedure TfrmENCustomerWarrantShow.actInsertExecute(Sender: TObject);
begin

  // if servicesObjectCode = Low(Integer) then Exit;

  ENCustomerWarrantObj := ENCustomerWarrant.Create;
  SetNullIntProps(ENCustomerWarrantObj);
  SetNullXSProps(ENCustomerWarrantObj);

  if servicesObjectCode <> Low(Integer) then
  begin
    ENCustomerWarrantObj.servicesObjectRef := ENServicesObjectRef.Create;
    ENCustomerWarrantObj.servicesObjectRef.code := servicesObjectCode;
  end;

  if servicesConsumerCode <> Low(Integer) then
  begin
    ENCustomerWarrantObj.servicesConsumerCode := servicesConsumerCode;
  end;

  try
    frmENCustomerWarrantEdit := TfrmENCustomerWarrantEdit.Create(Application, dsInsert);
    try
      if frmENCustomerWarrantEdit.ShowModal = mrOk then
      begin
        if ENCustomerWarrantObj <> nil then
        begin
          if ENCustomerWarrantObj.code <> Low(Integer) then
          begin
            FilterObject := ENCustomerWarrantFilter.Create;
            SetNullIntProps(FilterObject);
            SetNullXSProps(FilterObject);
            ENCustomerWarrantFilter(FilterObject).code := ENCustomerWarrantObj.code;
          end;

          UpdateGrid(Sender);
        end;
      end;
    finally
      frmENCustomerWarrantEdit.Free;
      frmENCustomerWarrantEdit:=nil;
    end;
  finally
    ENCustomerWarrantObj.Free;
  end;
end;


procedure TfrmENCustomerWarrantShow.actUpdateExecute(Sender: TObject);
begin
  selectedRow := 1;
  UpdateGrid(Sender);
end;


end.
